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
	
	long employeeAllowanceId = Long.parseLong(request.getParameter("employeeAllowanceId"));
	int allowanceId = Integer.parseInt(request.getParameter("allowanceId"));
	float allowanceAmount = Float.parseFloat(request.getParameter("allowanceAmount"));
	int currencyId = Integer.parseInt(request.getParameter("currencyId"));
	EmployeeAllowance employeeAllowance = EmployeeAllowance.getEmployeeAllowance(employeeAllowanceId);
	employeeAllowance.setAllowanceId(allowanceId);
	employeeAllowance.setAllowanceAmount(allowanceAmount);
	employeeAllowance.setCurrencyId(currencyId);
	employeeAllowance.setModifiedBy(modifiedBy);
	employeeAllowance.setModificationDate(modificationDate);
	EmployeeAllowance.update(employeeAllowance);
%>