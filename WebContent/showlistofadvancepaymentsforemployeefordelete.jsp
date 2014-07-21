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
						<td>Delete</td>					
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
									<td>
										<a href="#.jsp" onclick="deleteThisAdvancePayment(<%=advance.getId() %>);">Delete</a>
									</td>
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
<script type="text/javascript">
	function deleteThisAdvancePayment(advanceId){
		if(window.confirm('Are you sure you want to delete this advance payment record?')){
			var dataString = "advanceId="+advanceId;
			
			$.ajax({
			    url: 'deleteadvancepayment.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){
			    		$('#advanceDetailDiv').html(response);					
			    },
			    error:function(error){
					alert(error);
			    }
			});
		}
	}
</script>