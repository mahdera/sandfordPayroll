<%@page import="com.payrolladmin.server.classes.*"%>
<%
	int taxRateId = Integer.parseInt(request.getParameter("taxRateId"));
	TaxRate.delete(taxRateId);
%>