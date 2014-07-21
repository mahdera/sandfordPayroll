<%@page import="com.payrolladmin.server.classes.*"%>
<%
	int taxPayerId = Integer.parseInt(request.getParameter("taxPayerId"));
	WhoIsTaxPayer.delete(taxPayerId);
%>