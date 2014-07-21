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
	long advanceId = Long.parseLong(request.getParameter("advanceId"));
	String reason = request.getParameter("reason");
	
	Advance advance = Advance.getAdvance(advanceId);
	advance.setAdvanceAmount(advanceAmount);
	advance.setAdvanceDate(advanceDate);
	advance.setReason(reason);
	advance.setModifiedBy(modifiedBy);
	advance.setModificationDate(modificationDate);
	Advance.update(advance);
%>
<p class="msg done">Advance payment information updated successfully!</p>