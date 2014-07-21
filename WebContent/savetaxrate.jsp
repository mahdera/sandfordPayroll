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
	
	float lowerBoundary = Float.parseFloat(request.getParameter("lowerBoundary"));
	float upperBoundary = Float.parseFloat(request.getParameter("upperBoundary"));
	float taxRatePercentage = Float.parseFloat(request.getParameter("taxRatePercentage"));
	float otherDeduction = Float.parseFloat(request.getParameter("otherDeduction"));
	
	TaxRate taxRate = new TaxRate(lowerBoundary,upperBoundary,taxRatePercentage,otherDeduction,
			modifiedBy,modificationDate);
	taxRate.save();
%>