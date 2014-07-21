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
	int currencyId = Integer.parseInt(request.getParameter("currencyId"));
	String description = request.getParameter("description");
	Date dateTaken = Date.valueOf(request.getParameter("dateTaken"));
	long employeeLoanId = Long.parseLong(request.getParameter("employeeLoanId"));
	float balanceRemaining = Float.parseFloat(request.getParameter("balanceRemaining"));
	//now get the already saved object from the database...
	EmployeeLoan employeeLoan = EmployeeLoan.getEmployeeLoan(employeeLoanId);
	//set the new values and save it back to the database...
	employeeLoan.setAmountTaken(amountTaken);
	employeeLoan.setMonthlyPaymentAmount(monthlyPaymentAmount);
	employeeLoan.setBalanceRemaining(balanceRemaining);
	employeeLoan.setCurrencyId(currencyId);
	employeeLoan.setDescription(description);
	employeeLoan.setDateTaken(dateTaken);
	employeeLoan.setModifiedBy(modifiedBy);
	employeeLoan.setModificationDate(modificationDate);
	EmployeeLoan.update(employeeLoan);
%>