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
	
	long gratuityId = Long.parseLong(request.getParameter("gratuityId"));
	float amountGiven = Float.parseFloat(request.getParameter("amountGiven"));
	int currencyId = Integer.parseInt(request.getParameter("currencyId"));
	Date dateGiven = Date.valueOf(request.getParameter("dateGiven"));
	String description = request.getParameter("description");
	
	//now save this information to the database...
	Gratuity gratuity = Gratuity.getGratuity(gratuityId);
	gratuity.setAmountGiven(amountGiven);
	gratuity.setCurrencyId(currencyId);
	gratuity.setDateGiven(dateGiven);
	gratuity.setDescription(description);
	gratuity.setModifiedBy(modifiedBy);
	gratuity.setModificationDate(modificationDate);
	Gratuity.update(gratuity);
%>