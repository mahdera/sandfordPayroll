<%@page import="com.payrolladmin.server.classes.*" %>
<%@page import="java.util.*" %>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "userManagement";
	//Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	//Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	if(true){
%>
<%	
	List<User> uList = User.getAllUsers();
	Iterator<User> uItr = uList.iterator();
	out.print("<table width='100%'>");
	out.print("<caption>List of Users</caption>");
	out.print("<th>Ser.No</th>");
	out.print("<th>Full Name</th>");
	out.print("<th>User Type</th>");
	int ctr = 1;
	while(uItr.hasNext()){
		User u = uItr.next();
		if(ctr % 2 == 0)
			out.print("<tr>");
		else
			out.print("<tr class='bg'>");
			out.print("<td>");
				out.print(ctr);
			out.print("</td>");
			out.print("<td>");
				out.print(u.getFullName());
			out.print("</td>");
			out.print("<td>");
				out.print(u.getUserType());
			out.print("</td>");
		out.print("</tr>");
		ctr++;
	}//end while loop
	out.print("</table>");	
%>
<%
	}
	else{	
%>
	<p class="msg error">You do not have sufficient privileged to perform this operation!</p>
<%
	}
%>
