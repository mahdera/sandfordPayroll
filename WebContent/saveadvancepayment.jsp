<%@page import="java.sql.Date"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%
	Account account = (Account) session.getAttribute("account");
	int modifiedBy = account.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);

	float advanceAmount = Float.parseFloat(request.getParameter("advanceAmount"));
	Date advanceDate = Date.valueOf(request.getParameter("advanceDate"));
	long employeeId = Long.parseLong(request.getParameter("employeeId"));
	String reason = request.getParameter("reason");
	
	Advance advance = new Advance(employeeId,advanceAmount,advanceDate,reason,modifiedBy,modificationDate);
	advance.save();
%>
<p class="msg done">Advance payment information saved successfully!</p>