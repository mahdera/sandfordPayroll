<%@page import="com.payrolladmin.server.classes.*"%>
<%
	int userId = Integer.parseInt(request.getParameter("userId"));
	User.deleteUser(userId);
	//now delete its corresponding account...
	Account acctOfUser = Account.getAccountForUser(userId);
	Account.deleteAccount(acctOfUser.getAccountId());
%>