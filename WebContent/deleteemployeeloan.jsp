<%@page import="com.payrolladmin.server.classes.*"%>
<%
	long employeeLoanId = Long.parseLong(request.getParameter("employeeLoanId"));
	EmployeeLoan.delete(employeeLoanId);
%>