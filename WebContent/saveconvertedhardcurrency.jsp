<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%
	Account account = (Account) session.getAttribute("account");
	int modifiedBy = account.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);
	
	long employeeId = Long.parseLong(request.getParameter("employeeId"));
	float foreignCurrencyAmount = Float.parseFloat(request.getParameter("foreignCurrencyAmount"));
	//now get the currency exchange rate and calculate the conversion using the exchange rate....
	ForeignCurrencyExchangeRate forEx = ForeignCurrencyExchangeRate.getForeignCurrencyExchangeRateForCurrency("1 USD");
	float convertedHrdCurrencyAmount = foreignCurrencyAmount * forEx.getEtbEquivalentAmount();
	//now do the saving in here...
	ConvertedHardCurrency fetchedConvertedHardCurrency = ConvertedHardCurrency.getMostRecentConvertedHardCurrencyForEmployee(employeeId);
	if(fetchedConvertedHardCurrency != null){
		fetchedConvertedHardCurrency.setConvHrdCurrencyAmount(convertedHrdCurrencyAmount);
		fetchedConvertedHardCurrency.setExchangeRateUsed(forEx.getEtbEquivalentAmount());
		fetchedConvertedHardCurrency.setForeignCurrencyAmount(foreignCurrencyAmount);
		fetchedConvertedHardCurrency.setConvertionDate(modificationDate);
		fetchedConvertedHardCurrency.setModifiedBy(modifiedBy);
		fetchedConvertedHardCurrency.setModificationDate(modificationDate);
		ConvertedHardCurrency.update(fetchedConvertedHardCurrency);
	}else{
		ConvertedHardCurrency convertedHardCurrency = new ConvertedHardCurrency(employeeId,foreignCurrencyAmount,
				forEx.getEtbEquivalentAmount(),convertedHrdCurrencyAmount,modificationDate,
				modifiedBy,modificationDate);
		convertedHardCurrency.save();
	}
%>