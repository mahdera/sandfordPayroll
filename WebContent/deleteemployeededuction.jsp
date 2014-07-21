<%@page import="com.payrolladmin.server.classes.*"%>
<%
	long employeeDeductionId = Long.parseLong(request.getParameter("employeeDeductionId"));
	EmployeeDeduction.delete(employeeDeductionId);
%>