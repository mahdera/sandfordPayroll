<%@page import="java.util.StringTokenizer"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.sql.Date" %>
<%
	String payrollMonth = request.getParameter("payrollMonth");	
	String payrollName = request.getParameter("payrollName");
	Date datePrepared = Date.valueOf(request.getParameter("datePrepared"));
	StringTokenizer token = new StringTokenizer(String.valueOf(datePrepared),"-");
	String yearParam = token.nextToken();
	String monthParam = token.nextToken();
	
	boolean recordExists = Payroll.payrollAlreadySaved(payrollName,Integer.parseInt(yearParam),Integer.parseInt(payrollMonth));
	if(recordExists)
		out.print("Saved");
	else
		out.print("Not");
%>