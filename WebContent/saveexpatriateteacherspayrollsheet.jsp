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
		String basicSalaryUsdControlName = "basicSalaryUsd" + i;
		String responsibilityAllowanceUsdControlName = "responsibilityAllowanceUsd" + i;
		String grossSalaryUsdControlName = "grossSalaryUsd" + i;
		String exchangeRateControlName = "exchangeRate" + i;
		String totalInBirrControlName = "totalInBirr" + i;
		String basicSalaryEtbControlName = "basicSalaryEtb" + i;
		String responsibilityAllowanceEtbControlName = "responsibilityAllowanceEtb" + i;
		String convertedHrdCurrencyControlName = "convertedHrdCurrency" + i;
		String houseRentAllownaceControlName = "houseRentAllowance" + i;
		String grossSalaryEtbControlName = "grossSalaryEtb" + i;
		String grandInBirrControlName = "grandInBirr" + i;
		String advanceAndLoansControlName = "advanceAndLoans" + i;
		String houseRentDeductionsControlName = "houseRentDeductions" + i;
		String taxableIncomeControlName = "taxableIncome" + i;
		String incomeTaxControlName = "incomeTax" + i;
		String telAndElectControlName = "telAndElect" + i;
		String totalDeductionsControlName = "totalDeductions" + i;
		String netPayControlName = "netPay" + i;
		String loanControlName = "loan" + i;
		String gratuityControlName = "gratuity" + i;
		/////
		long employeeId = Long.parseLong(request.getParameter(employeeIdControlName));
		float basicSalaryUsd = Float.parseFloat(request.getParameter(basicSalaryUsdControlName));
		float responsibilityAllowanceUsd = Float.parseFloat(request.getParameter(responsibilityAllowanceUsdControlName));
		float grossSalaryUsd = Float.parseFloat(request.getParameter(grossSalaryUsdControlName));
		float exchangeRate = Float.parseFloat(request.getParameter(exchangeRateControlName));
		float totalInBirr = Float.parseFloat(request.getParameter(totalInBirrControlName));
		float basicSalaryEtb = Float.parseFloat(request.getParameter(basicSalaryEtbControlName));
		float responsibilityAllowanceEtb = Float.parseFloat(request.getParameter(responsibilityAllowanceEtbControlName));
		float convertedHrdCurrency = Float.parseFloat(request.getParameter(convertedHrdCurrencyControlName));
		float houseRentAllowance = Float.parseFloat(request.getParameter(houseRentAllownaceControlName));
		float grossSalaryEtb = Float.parseFloat(request.getParameter(grossSalaryEtbControlName));
		float grandInBirr = Float.parseFloat(request.getParameter(grandInBirrControlName));
		float advanceAndLoans = Float.parseFloat(request.getParameter(advanceAndLoansControlName));
		float houseRentDeductions = Float.parseFloat(request.getParameter(houseRentDeductionsControlName));
		float taxableIncome = Float.parseFloat(request.getParameter(taxableIncomeControlName));
		float incomeTax = Float.parseFloat(request.getParameter(incomeTaxControlName));
		float telAndElect = Float.parseFloat(request.getParameter(telAndElectControlName));
		float totalDeductions = Float.parseFloat(request.getParameter(totalDeductionsControlName));
		float netPay = Float.parseFloat(request.getParameter(netPayControlName));
		float loan = Float.parseFloat(request.getParameter(loanControlName));		
		float gratuity = Float.parseFloat(request.getParameter(gratuityControlName));
		
		//now do the saving in here...
		ExpatTeachersEtbPayrollSheet expatTeachersEtbPayrollSheet = new ExpatTeachersEtbPayrollSheet(fetchedPayroll.getId(),
				employeeId,basicSalaryUsd,responsibilityAllowanceUsd,grossSalaryUsd,exchangeRate,
				totalInBirr,basicSalaryEtb,responsibilityAllowanceEtb,convertedHrdCurrency,
				houseRentAllowance,gratuity,grossSalaryEtb,grandInBirr,advanceAndLoans,houseRentDeductions,
				taxableIncome,incomeTax,telAndElect,totalDeductions,netPay,modifiedBy,modificationDate);
		expatTeachersEtbPayrollSheet.save();
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