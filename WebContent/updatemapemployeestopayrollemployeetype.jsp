<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.Date"%>
<%
	Account account = (Account) session.getAttribute("account");
	int modifiedBy = account.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);
	
	long employeePayrollTypeMapId = Long.parseLong(request.getParameter("employeePayrollTypeMapId"));
	int payrollEmpTypeId = Integer.parseInt(request.getParameter("payrollEmpTypeId"));
	
	EmployeePayrollTypeMap employeePayrollTypeMap = EmployeePayrollTypeMap.getEmployeePayrollTypeMap(employeePayrollTypeMapId);
	employeePayrollTypeMap.setPayrollEmpTypeId(payrollEmpTypeId);
	employeePayrollTypeMap.setModifiedBy(modifiedBy);
	employeePayrollTypeMap.setModificationDate(modificationDate);
	EmployeePayrollTypeMap.update(employeePayrollTypeMap);
%>