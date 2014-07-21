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
	
	float basicSalary = Float.parseFloat(request.getParameter("basicSalary"));
	float responsibilityAllowance = Float.parseFloat(request.getParameter("responsibilityAllowance"));
	float grossSalary = Float.parseFloat(request.getParameter("grossSalary"));
	float convertedIntoBirr = Float.parseFloat(request.getParameter("convertedIntoBirr"));
	float advanceAndLoans = Float.parseFloat(request.getParameter("advanceAndLoans"));
	float retainedWithSchool = Float.parseFloat(request.getParameter("retainedWithSchool"));
	float telFaxAndElect = Float.parseFloat(request.getParameter("telFaxAndElect"));
	float totalDeductions = Float.parseFloat(request.getParameter("totalDeductions"));
	float netPay = Float.parseFloat(request.getParameter("netPay"));
	long expatTeachersUsdPayrollSheetId = Long.parseLong(request.getParameter("expatTeachersUsdPayrollSheetId"));
	
	ExpatTeachersUsdPayrollSheet expatTeachersUsdPayrollSheet = ExpatTeachersUsdPayrollSheet.getExpatTeachersUsdPayrollSheet(expatTeachersUsdPayrollSheetId);
	expatTeachersUsdPayrollSheet.setBasicSalary(basicSalary);
	expatTeachersUsdPayrollSheet.setResponsibilityAllowance(responsibilityAllowance);
	expatTeachersUsdPayrollSheet.setGrossSalary(grossSalary);
	expatTeachersUsdPayrollSheet.setConvertedIntoBirr(convertedIntoBirr);
	expatTeachersUsdPayrollSheet.setAdvanceAndLoans(advanceAndLoans);
	expatTeachersUsdPayrollSheet.setRetainedWithSchool(retainedWithSchool);
	expatTeachersUsdPayrollSheet.setTelFaxElect(telFaxAndElect);
	expatTeachersUsdPayrollSheet.setTotalDeduction(totalDeductions);
	expatTeachersUsdPayrollSheet.setNetPay(netPay);
	expatTeachersUsdPayrollSheet.setModifiedBy(modifiedBy);
	expatTeachersUsdPayrollSheet.setModificationDate(modificationDate);
	ExpatTeachersUsdPayrollSheet.update(expatTeachersUsdPayrollSheet);
%>
<p class="msg done">Expat teachers USD payroll sheet updated successfully!</p>