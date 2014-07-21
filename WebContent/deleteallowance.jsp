<%@page import="com.payrolladmin.server.classes.*"%>
<%
	int allowanceId = Integer.parseInt(request.getParameter("allowanceId"));
	Allowance.delete(allowanceId);
%>