<%@page import="com.payrolladmin.server.classes.*"%>
<%
	long employeePayrollTypeMapId = Long.parseLong(request.getParameter("employeePayrollTypeMapId"));
	EmployeePayrollTypeMap.delete(employeePayrollTypeMapId);
%>