<%@page import="com.payrolladmin.server.classes.*" %>
<%
	int aId = Integer.parseInt(request.getParameter("accountId"));
	String rUsername = request.getParameter("resetedUsername");
	String rPassword = request.getParameter("resetedPassword");
	
	Account.resetThisAccount(aId,rUsername,rPassword);
%>
