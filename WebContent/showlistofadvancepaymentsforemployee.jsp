<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	String employeeIdNumber = request.getParameter("employeeIdNumber");
	Employee employee = Employee.findEmployeeUsingIdNumber(employeeIdNumber);
	if(employee != null){
		List<Advance> advanceList = Advance.getAllAdvancePaymentsForEmployee(employee.getId());
		if(!advanceList.isEmpty()){
			Iterator<Advance> advanceItr = advanceList.iterator();
			%>
				<table border="0" width="100%">
					<tr style="background:#eee;font-weight:bolder">
						<td>Ser.No</td>
						<td>Advance Amount</td>
						<td>Advance Payment Date</td>
						<td>Reason</td>						
					</tr>
					<%
						int ctr=1;
						while(advanceItr.hasNext()){
							Advance advance = advanceItr.next();
							%>
								<tr>
									<td><%=ctr++ %></td>
									<td><%=advance.getAdvanceAmount() %></td>
									<td><%=advance.getAdvanceDate() %></td>
									<td><%=advance.getReason() %></td>
								</tr>
							<%
						}//end while loop
					%>
				</table>
			<%
		}else{
			%>
				<p class="msg warning">No advance payment found for this employee!</p>
			<%
		}
	}else{
		%>
			<p class="msg warning">There is no employee found with the given id number '<%=employeeIdNumber %>'</p>
		<%
	}	
%>