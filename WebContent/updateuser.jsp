<%@page import="com.payrolladmin.server.classes.*"%>
<%
	int userId = Integer.parseInt(request.getParameter("userId"));
	String fullName = request.getParameter("fullName");
	String userType = request.getParameter("userType");
	User user = User.getUser(userId);	
	User.updateUser(userId, fullName, userType);
%>