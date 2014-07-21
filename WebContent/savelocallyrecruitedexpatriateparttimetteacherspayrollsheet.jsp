<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%
	Account account = (Account) session.getAttribute("account");
	int modifiedBy = account.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);
	
	int ctr = Integer.parseInt(request.getParameter("ctr"));
	String payrollName = request.getParameter("payrollName");
	String payrollMonth = request.getParameter("payrollMonth");
	Date datePrepared = Date.valueOf(request.getParameter("datePrepared"));
	
	//first save the payroll object
	Payroll payroll = new Payroll(payrollName,payrollMonth,datePrepared,modifiedBy,modificationDate);
	payroll.save();
	//now fetch this saved payroll for saving the relationship with the payroll detail/sheet object
	Payroll fetchedPayroll = Payroll.fetchPayrollUsing(payrollName,payrollMonth,datePrepared,modifiedBy,modificationDate);

	for(int i=1;i<=ctr;i++){
		//now define the control names in here...
		String employeeIdControlName = "employeeId" + ctr;
		String basicSalaryControlName = "basicSalary" + ctr;
		String providentFundControlName = "providentFund" + ctr;
		String transportationAllowanceControlName = "transportation" + ctr;
		String responsibilityAllowanceControlName = "responsibilityAllowance" + ctr;
		String grossSalaryControlName = "grossSalary" + ctr;
		String incomeTaxExpControlName = "incomeTaxExp" + ctr;
		String advanceAndLoanControlName = "advanceAndLoans" + ctr;				
		String otherDeductionsControlName = "otherDeductions" + ctr;
		String incomeTaxControlName = "incomeTax" + ctr;
		String retainedWithSchoolControlName = "retainedWithSchool" + ctr;
		String totalDeductionsControlName = "totalDeductions" + ctr;
		String netPayControlName = "netPay" + ctr;
		String telAndFaxControlName = "telAndFax" + ctr;
		String loanControlName = "loan" + ctr;
		/////
		long employeeId = Long.parseLong(request.getParameter(employeeIdControlName));
		float basicSalary = Float.parseFloat(request.getParameter(basicSalaryControlName));
		float providentFund = Float.parseFloat(request.getParameter(providentFundControlName));
		float responsibilityAllowance = Float.parseFloat(request.getParameter(responsibilityAllowanceControlName));
		float grossSalary = Float.parseFloat(request.getParameter(grossSalaryControlName));
		float incomeTaxExp = Float.parseFloat(request.getParameter(incomeTaxExpControlName));
		float advanceAndLoans = Float.parseFloat(request.getParameter(advanceAndLoanControlName));		
		float otherDeductions = Float.parseFloat(request.getParameter(otherDeductionsControlName));
		float incomeTax = Float.parseFloat(request.getParameter(incomeTaxControlName));
		float retainedWithSchool = Float.parseFloat(request.getParameter(retainedWithSchoolControlName));
		float totalDeductions = Float.parseFloat(request.getParameter(totalDeductionsControlName));
		float netPay = Float.parseFloat(request.getParameter(netPayControlName));
		float loan = Float.parseFloat(request.getParameter(loanControlName));
		float telAndFax = Float.parseFloat(request.getParameter(telAndFaxControlName));
		float transportationAllowance = Float.parseFloat(request.getParameter(transportationAllowanceControlName));
		
		//now do the saving in here...
		LocallyRecruitedExpatPayrollSheet locallyRecruitedExpatPayrollSheet = new LocallyRecruitedExpatPayrollSheet(fetchedPayroll.getId(),
				employeeId,basicSalary,providentFund,transportationAllowance,responsibilityAllowance,
				grossSalary,incomeTaxExp,advanceAndLoans,otherDeductions,incomeTax,telAndFax,
				retainedWithSchool,totalDeductions,netPay,modifiedBy,modificationDate);
		locallyRecruitedExpatPayrollSheet.save();
		List<EmployeeLoan> employeeLoanList = EmployeeLoan.getAllEmployeeLoansForThisEmployee(employeeId);
		if(!employeeLoanList.isEmpty()){
			Iterator<EmployeeLoan> employeeLoanItr = employeeLoanList.iterator();
			while(employeeLoanItr.hasNext() && loan > 0.0){
				float newBalance = 0.0f;
				EmployeeLoan employeeLoan = employeeLoanItr.next();
				float currentBalance = employeeLoan.getBalanceRemaining();
				if(currentBalance >= loan){
					newBalance = currentBalance - loan;
					loan = 0.0f;
				}else{					
					loan = loan - currentBalance;
					newBalance = loan;
					employeeLoan.setMonthlyPaymentAmount(newBalance);
				}
				//now do the updating in here...
				employeeLoan.setBalanceRemaining(newBalance);
				employeeLoan.setModifiedBy(modifiedBy);
				employeeLoan.setModificationDate(modificationDate);
				EmployeeLoan.update(employeeLoan);
			}//end while loop
		}
	}//end for...loop
%>