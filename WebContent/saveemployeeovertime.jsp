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
	Date dateWorked = Date.valueOf(request.getParameter("dateWorked"));
	float totalHoursWorked = Float.parseFloat(request.getParameter("totalHoursWorked"));
	float ratePerHour = Float.parseFloat(request.getParameter("ratePerHour"));
	
	EmployeeOvertime employeeOvertime = new EmployeeOvertime(employeeId,totalHoursWorked,dateWorked,
			ratePerHour,modifiedBy,modificationDate);
	employeeOvertime.save();
%>
<p class="msg done">Employee overtime information saved successfully!</p>