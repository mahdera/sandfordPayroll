<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%@page import="java.sql.Date"%>
<%
	Account account = (Account) session.getAttribute("account");
	int modifiedBy = account.getUserId();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);
	
	int taxPayerId = Integer.parseInt(request.getParameter("taxPayerId"));
	String taxPayer = request.getParameter("taxPayer");
	//now get the obj...set its values and update it back to the database....
	WhoIsTaxPayer whoIsTaxPayer = WhoIsTaxPayer.getWhoIsTaxPayer(taxPayerId);
	whoIsTaxPayer.setTaxPayer(taxPayer);
	whoIsTaxPayer.setModifiedBy(modifiedBy);
	whoIsTaxPayer.setModificationDate(modificationDate);
	WhoIsTaxPayer.update(whoIsTaxPayer);
%>