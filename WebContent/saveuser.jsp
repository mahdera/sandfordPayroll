<%@page import="com.payrolladmin.server.classes.*"%>
<%
	String fullName = request.getParameter("fullName");
	String userType = request.getParameter("userType");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	User user = new User(fullName,userType);
	user.addUser();
	//fetch the user using fullName and user type...
	User fetchedUser = User.getUserWith(fullName, userType);
	//now save the account object to the database...
	Account account = new Account(fetchedUser.getId(),username,password,userType);
	account.addAccount();
%>