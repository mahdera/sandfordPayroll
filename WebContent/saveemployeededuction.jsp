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
	int deductionId = Integer.parseInt(request.getParameter("deductionId"));
	float deductionAmount = Float.parseFloat(request.getParameter("deductionAmount"));
	String deductionType = request.getParameter("deductionType");
	int currencyId = Integer.parseInt(request.getParameter("currencyId"));
	EmployeeDeduction employeeDeduction = new EmployeeDeduction(employeeId,deductionId,deductionType,deductionAmount,
			currencyId,modifiedBy,modificationDate);
	employeeDeduction.save();
%>
<p class="msg done">Employee deduction information saved successfully!</p>