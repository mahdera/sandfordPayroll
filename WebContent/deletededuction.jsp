<%@page import="com.payrolladmin.server.classes.*"%>
<%
	int deductionId = Integer.parseInt(request.getParameter("deductionId"));
	Deduction.delete(deductionId);
%>