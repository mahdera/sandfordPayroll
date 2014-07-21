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
	
	long retainedWithSchoolId = Long.parseLong(request.getParameter("retainedWithSchoolId"));
	float percentValue = Float.parseFloat(request.getParameter("percentValue"));
	float balance = Float.parseFloat(request.getParameter("balance"));
	//now find the object...set its values and update it back to the database....
	RetainedWithSchool retainedWithSchool = RetainedWithSchool.getRetainedWithSchool(retainedWithSchoolId);
	retainedWithSchool.setPercentValue(percentValue);
	retainedWithSchool.setBalance(balance);
	retainedWithSchool.setModifiedBy(modifiedBy);
	retainedWithSchool.setModificationDate(modificationDate);
	RetainedWithSchool.update(retainedWithSchool);
%>