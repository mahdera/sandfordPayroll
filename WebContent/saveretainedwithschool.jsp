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

	long employeeId = Long.parseLong(request.getParameter("employeeId"));
	float percentValue = Float.parseFloat(request.getParameter("percentValue"));
	float balance = Float.parseFloat(request.getParameter("balance"));
	
	RetainedWithSchool retainedWithSchool = new RetainedWithSchool(employeeId,percentValue,balance,
			modifiedBy,modificationDate);
	retainedWithSchool.save();
%>