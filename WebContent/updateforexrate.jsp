<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.Date"%>
<%
	Account account = (Account) session.getAttribute("account");
	int modifiedBy = account.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);

	String currencyName = request.getParameter("currencyName");
	float etbEquivalentAmount = Float.parseFloat(request.getParameter("etbEquivalentAmount"));
	int forexId = Integer.parseInt(request.getParameter("forexId"));
	
	ForeignCurrencyExchangeRate forex = ForeignCurrencyExchangeRate.getForeignCurrencyExchangeRate(forexId);
	forex.setCurrencyName(currencyName);
	forex.setEtbEquivalentAmount(etbEquivalentAmount);
	forex.setModifiedBy(modifiedBy);
	forex.setModificationDate(modificationDate);
	ForeignCurrencyExchangeRate.update(forex);
%>
