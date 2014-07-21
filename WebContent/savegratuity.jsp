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
	float amountGiven = Float.parseFloat(request.getParameter("amountGiven"));
	int currencyId = Integer.parseInt(request.getParameter("currencyId"));
	Date dateGiven = Date.valueOf(request.getParameter("dateGiven"));
	String description = request.getParameter("description");
	
	//now save this information to the database...
	Gratuity gratuity = new Gratuity(employeeId,amountGiven,currencyId,dateGiven,description,modifiedBy,modificationDate);
	gratuity.save();
%>
<p class="msg done">Gratuity information saved successfully!</p>