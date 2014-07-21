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
	int allowanceId = Integer.parseInt(request.getParameter("allowanceId"));
	float allowanceAmount = Float.parseFloat(request.getParameter("allowanceAmount"));
	int currencyId = Integer.parseInt(request.getParameter("currencyId"));
	EmployeeAllowance employeeAllowance = new EmployeeAllowance(employeeId,allowanceId,allowanceAmount,
			currencyId,modifiedBy,modificationDate);
	employeeAllowance.save();
%>
<p class="msg done">Employee allowance information saved successfully!</p>