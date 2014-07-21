<%@page import="com.payrolladmin.server.classes.*"%>
<%
	long gratuityId = Long.parseLong(request.getParameter("gratuityId"));
	Gratuity.delete(gratuityId);
%>