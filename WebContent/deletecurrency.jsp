<%@page import="com.payrolladmin.server.classes.*"%>
<%
	int currencyId = Integer.parseInt(request.getParameter("currencyId"));
	Currency.delete(currencyId);
%>