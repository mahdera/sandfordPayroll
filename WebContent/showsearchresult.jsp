<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	String searchItem = request.getParameter("searchItem");
	//now get search result using the serach item passed....
	List<Employee> employeeList = Employee.genericEmployeeSearch(searchItem);
	if(!employeeList.isEmpty()){
		Iterator<Employee> employeeItr = employeeList.iterator();
		%>
			<div>
				<table border="1" width="100%">
					<tr style="background:#eee;font-weight:bold;">
						<td colspan="8" align="center" style="font-size:12px">
							Employee List
						</td>
					</tr>
					<tr style="background:#eee;font-weight:bold">
						<td>Family Name</td>
						<td>First Name</td>
						<td>Middle Name</td>
						<td>Date of Birth</td>
						<td>Place of Birth</td>
						<td>Nationality At Birth</td>
						<td>View Detail</td>						
					</tr>
					<%
						while(employeeItr.hasNext()){
							Employee employee = employeeItr.next();
							%>
							<tr>
								<td><%=employee.getLastName() %></td>
								<td><%=employee.getFirstName() %></td>
								<td><%=employee.getMiddleName() %></td>
								<td><%=employee.getDateOfBirth() %></td>
								<td><%=employee.getPlaceOfBirth() %></td>
								<td><%=employee.getNationalityAtBirth() %></td>
								<td>
									<a href="#.jsp" onclick="showEmployeeDetail(<%=employee.getId() %>);">View more</a> |
									<a href="#.jsp" onclick="hideEmployeeDetail(<%=employee.getId() %>);">Hide Detail</a>
								</td>								
							</tr>
							<tr>
								<td colspan="7">
									<%
										String divId = "employeeDetailDiv" + employee.getId();
									%>
									<div id="<%=divId %>"></div>
								</td>
							</tr>
							<%
						}//end while loop
					%>
				</table>
			</div>
		<%
	}else{
		%>
			<p class="msg warning">There is/are no employee information found with the entered search item!</p>
		<%
	}
%>
<script type="text/javascript">
	function showEmployeeDetail(employeeId){
		var divId = "employeeDetailDiv"+employeeId;
		$('#'+divId).load('showemployeedetailform.jsp?employeeId='+employeeId);
	}
	
	function hideEmployeeDetail(employeeId){
		var divId = "employeeDetailDiv"+employeeId;
		$('#'+divId).html('');
	}
</script>