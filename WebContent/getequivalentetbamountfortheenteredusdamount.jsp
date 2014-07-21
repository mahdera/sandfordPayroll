<%@page import="com.payrolladmin.server.classes.*"%>
<%
	float usdAmountEntered = Float.parseFloat(request.getParameter("usdAmountEntered"));
	ForeignCurrencyExchangeRate foreignCurrencyExchangeRate = ForeignCurrencyExchangeRate.getForeignCurrencyExchangeRateForCurrency("1 USD");
	out.print(usdAmountEntered * foreignCurrencyExchangeRate.getEtbEquivalentAmount());
%>