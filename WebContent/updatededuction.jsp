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
	int deductionId = Integer.parseInt(request.getParameter("deductionId"));

	Deduction deduction = Deduction.getDeduction(deductionId);
	deduction.setDeductionName(deductionName);
	deduction.setDescription(description);
	deduction.setModifiedBy(modifiedBy);
	deduction.setModificationDate(modificationDate);
	Deduction.update(deduction);
%>