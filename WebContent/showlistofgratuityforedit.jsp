<%@page import="com.payrolladmin.server.classes.Currency"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	List<Gratuity> gratuityList = Gratuity.getAllGratuities();
	if(!gratuityList.isEmpty()){
		Iterator<Gratuity> gratuityItr = gratuityList.iterator();
		%>
			<table border="0" width="100%">
				<tr style="background:#eee;font-weight:bolder">
					<td>Ser.No</td>
					<td>Employee</td>
					<td>Amount Given</td>
					<td>Currency</td>
					<td>Date Given</td>
					<td>Description</td>
					<td>Edit</td>
				</tr>
				<%
					int ctr=1;
					while(gratuityItr.hasNext()){
						Gratuity gratuity = gratuityItr.next();
						Employee employee = Employee.getEmployee(gratuity.getEmployeeId());
						String fullName = employee.getFirstName()+" "+employee.getMiddleName()+" "+employee.getLastName();
						%>
							<tr>
								<td><%=ctr++ %></td>
								<td><%=fullName %></td>
								<td><%=gratuity.getAmountGiven() %></td>
								<td><%=Currency.getCurrency(gratuity.getCurrencyId()).getCurrencyName() %></td>
								<td><%=gratuity.getDateGiven() %></td>
								<td><%=gratuity.getDescription() %></td>	
								<td>
									<a href="#.jsp" onclick="showEditFieldsOfThisGratuity(<%=gratuity.getId() %>);">Edit</a>
								</td>							
							</tr>							
							<%
								String divId = "gratuityEditDiv" + gratuity.getId();
							%>
							<tr>
								<td colspan="7">
									<div id="<%=divId%>"></div>
								</td>
							</tr>
						<%
					}//end while loop
				%>
			</table>
		<%
	}else{
		%>
			<p class="msg warning">There is/are no gratuity information saved in the database!</p>
		<%
	}
%>
<script type="text/javascript">
	function showEditFieldsOfThisGratuity(gratuityId){
		var divId = "gratuityEditDiv" + gratuityId;
		$('#'+divId).load('showeditfieldsofthisgratuity.jsp?gratuityId='+gratuityId);
	}
</script>