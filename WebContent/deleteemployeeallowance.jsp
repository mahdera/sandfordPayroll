<%@page import="com.payrolladmin.server.classes.*"%>
<%
	long employeeAllowanceId = Long.parseLong(request.getParameter("employeeAllowanceId"));
	EmployeeAllowance.delete(employeeAllowanceId);
%>