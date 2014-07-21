<%@page import="com.payrolladmin.server.classes.*"%>
<%
	long advanceId = Long.parseLong(request.getParameter("advanceId"));
	Advance.delete(advanceId);
%>
<p class="msg done">Advance payment information deleted successfully!</p>