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
	
	String deductionName = request.getParameter("deductionName");
	String description = request.getParameter("description");
	
	Deduction deduction = new Deduction(deductionName,description,modifiedBy,modificationDate);
	deduction.save();
%>