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
		String employeeIdControlName = "employeeId" + i;
		String basicSalaryControlName = "basicSalary" + i;
		String overtimeControlName = "overtime" + i;
		String retirementPfErControlName = "retirementPfEr" + i;
		String allowanceControlName = "allowance" + i;
		String grossSalaryControlName = "grossSalary" + i;
		String taxableIncomeControlName = "taxableIncome" + i;
		String incomeTaxControlName = "incomeTax" + i;
		String retirementPfErDeductionControlName = "retirementPfErDeduction" + i;
		String retirementPfEeControlName = "retirementPfEe" + i;
		String pensionControlName = "pension" + i;
		String loanPfLoanControlName = "loanPfLoan" + i;
		String otherControlName = "other" + i;
		String creditAssociationControlName = "creditAssociation" + i;
		String laborUnionControlName = "laborUnion" + i;
		String totalDeductionControlName = "totalDeduction" + i;
		String netPayControlName = "netPay" + i;
		String loanControlName = "loan" + i;
		/////
		long employeeId = Long.parseLong(request.getParameter(employeeIdControlName));
		float basicSalary = Float.parseFloat(request.getParameter(basicSalaryControlName));
		float overtime = Float.parseFloat(request.getParameter(overtimeControlName));
		float retirementPfEr = Float.parseFloat(request.getParameter(retirementPfErControlName));
		float allowance = Float.parseFloat(request.getParameter(allowanceControlName));
		float grossSalary = Float.parseFloat(request.getParameter(grossSalaryControlName));
		float taxableIncome = Float.parseFloat(request.getParameter(taxableIncomeControlName));
		float incomeTax = Float.parseFloat(request.getParameter(incomeTaxControlName));
		float retirementPfErDeduction = Float.parseFloat(request.getParameter(retirementPfErDeductionControlName));
		float retirementPfEe = Float.parseFloat(request.getParameter(retirementPfEeControlName));
		float pension = Float.parseFloat(request.getParameter(pensionControlName));
		float loanPfLoan = Float.parseFloat(request.getParameter(loanPfLoanControlName));
		float other = Float.parseFloat(request.getParameter(otherControlName));
		float creditAssociation = Float.parseFloat(request.getParameter(creditAssociationControlName));
		float laborUnion = Float.parseFloat(request.getParameter(laborUnionControlName));
		float totalDeduction = Float.parseFloat(request.getParameter(totalDeductionControlName));
		float netPay = Float.parseFloat(request.getParameter(netPayControlName));
		float loan = Float.parseFloat(request.getParameter(loanControlName));
		//now do the saving in here...
		LocalTeachersPayrollSheet localTeachersPayrollSheet = new LocalTeachersPayrollSheet(fetchedPayroll.getId(),
				employeeId,basicSalary,overtime,retirementPfEr,allowance,grossSalary,taxableIncome,incomeTax,
				retirementPfErDeduction,retirementPfEe,pension,loanPfLoan,other,creditAssociation,laborUnion,
				totalDeduction,netPay,modifiedBy,modificationDate);
		localTeachersPayrollSheet.save();	
		//now update the loan information...
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