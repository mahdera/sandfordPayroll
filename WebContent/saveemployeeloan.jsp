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
	
	float amountTaken = Float.parseFloat(request.getParameter("amountTaken"));
	float monthlyPaymentAmount = Float.parseFloat(request.getParameter("monthlyPaymentAmount"));
	long employeeId = Integer.parseInt(request.getParameter("employeeId"));
	int currencyId = Integer.parseInt(request.getParameter("currencyId"));
	String description = request.getParameter("description");
	Date dateTaken = Date.valueOf(request.getParameter("dateTaken"));
	
	//now save this information to the database...
	EmployeeLoan employeeLoan = new EmployeeLoan(employeeId,amountTaken,monthlyPaymentAmount,amountTaken,currencyId,
			dateTaken,description,modifiedBy,modificationDate);
	employeeLoan.save();
%>
<p class="msg done">Employee loan information saved successfully!</p>