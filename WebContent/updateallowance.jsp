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
	
	String allowanceName = request.getParameter("allowanceName");
	String description = request.getParameter("description");
	int allowanceId = Integer.parseInt(request.getParameter("allowanceId"));

	Allowance allowance = Allowance.getAllowance(allowanceId);
	allowance.setAllowanceName(allowanceName);
	allowance.setDescription(description);
	allowance.setModifiedBy(modifiedBy);
	allowance.setModificationDate(modificationDate);
	Allowance.update(allowance);
%>