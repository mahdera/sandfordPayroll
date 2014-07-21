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
	
	ForeignCurrencyExchangeRate forex = new ForeignCurrencyExchangeRate(currencyName,etbEquivalentAmount,
			modifiedBy,modificationDate);
	forex.save();
%>
