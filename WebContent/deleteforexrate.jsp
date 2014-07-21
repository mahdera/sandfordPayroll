<%@page import="com.payrolladmin.server.classes.*"%>
<%
	int forexId = Integer.parseInt(request.getParameter("forexId"));
	ForeignCurrencyExchangeRate.delete(forexId);
%>