<%@page import="com.payrolladmin.server.classes.*"%>
<%
	long employeeOvertimeId = Long.parseLong(request.getParameter("employeeOvertimeId"));
	EmployeeOvertime.delete(employeeOvertimeId);
%>
<p class="msg done">Employee overtime information deleted successfully!</p>