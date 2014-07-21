<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.sql.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%
	Account account = (Account) session.getAttribute("account");
	int modifiedBy = account.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);
	
	int currencyId = Integer.parseInt(request.getParameter("currencyId"));
	String currencyName = request.getParameter("currencyName");
	String description = request.getParameter("description");
	
	Currency currency = Currency.getCurrency(currencyId);
	currency.setCurrencyName(currencyName);
	currency.setDescription(description);
	currency.setModifiedBy(modifiedBy);
	currency.setModificationDate(modificationDate);
	Currency.update(currency);
%>