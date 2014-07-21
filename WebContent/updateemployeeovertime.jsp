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
	
	long employeeOvertimeId = Long.parseLong(request.getParameter("employeeOvertimeId"));
	Date dateWorked = Date.valueOf(request.getParameter("dateWorked"));
	float totalHoursWorked = Float.parseFloat(request.getParameter("totalHoursWorked"));
	float ratePerHour = Float.parseFloat(request.getParameter("ratePerHour"));
	
	EmployeeOvertime employeeOvertime = EmployeeOvertime.getEmployeeOvertime(employeeOvertimeId);
	employeeOvertime.setDateWorked(dateWorked);
	employeeOvertime.setTotalHoursWorked(totalHoursWorked);
	employeeOvertime.setRatePerHour(ratePerHour);
	employeeOvertime.setModifiedBy(modifiedBy);
	employeeOvertime.setModificationDate(modificationDate);
	EmployeeOvertime.update(employeeOvertime);
%>
<p class="msg done">Employee overtime information updated successfully!</p>