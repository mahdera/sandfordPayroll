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
		String convertedIntoBirrControlName = "convertedHrdCurrency" + i;
		String advanceAndLoansControlName = "advanceAndLoans" + i;
		String retainedWithSchoolControlName = "retainedWithSchool" + i;
		String telAndFaxElectControlName = "telAndFaxElect" + i;
		String totalDeductionsControlName = "totalDeductions" + i;
		String netPayControlName = "netPay" + i;
		/////
		long employeeId = Long.parseLong(request.getParameter(employeeIdControlName));
		float basicSalaryUsd = Float.parseFloat(request.getParameter(basicSalaryUsdControlName));
		float responsibilityAllowanceUsd = Float.parseFloat(request.getParameter(responsibilityAllowanceUsdControlName));
		float grossSalaryUsd = Float.parseFloat(request.getParameter(grossSalaryUsdControlName));		
		float convertedIntoBirr = Float.parseFloat(request.getParameter(convertedIntoBirrControlName));
		float advanceAndLoans = Float.parseFloat(request.getParameter(advanceAndLoansControlName));
		float retainedWithSchool = Float.parseFloat(request.getParameter(retainedWithSchoolControlName));
		float telAndFaxElect = Float.parseFloat(request.getParameter(telAndFaxElectControlName));
		float totalDeductions = Float.parseFloat(request.getParameter(totalDeductionsControlName));
		float netPay = Float.parseFloat(request.getParameter(netPayControlName));	
		
		
		//now do the saving in here...
		ExpatTeachersUsdPayrollSheet expatTeachersUsdPayrollSheet = new ExpatTeachersUsdPayrollSheet(fetchedPayroll.getId(),
				employeeId,basicSalaryUsd,responsibilityAllowanceUsd,grossSalaryUsd,convertedIntoBirr,
				advanceAndLoans,retainedWithSchool,telAndFaxElect,totalDeductions,netPay,modifiedBy,modificationDate);
		expatTeachersUsdPayrollSheet.save();	
	}//end for...loop
%>