<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	String employeeIdNumber = request.getParameter("employeeIdNumber");
	Employee employee = Employee.findEmployeeUsingIdNumber(employeeIdNumber);
	
	if(employee != null){
		//now get List of partime works for this particular employee.
		List<EmployeeOvertime> employeeOvertimeList = EmployeeOvertime.getAllEmployeeOvertimesForThisEmployee(employee.getId());
		if(!employeeOvertimeList.isEmpty()){
			Iterator<EmployeeOvertime> employeeOvertimeItr = employeeOvertimeList.iterator();
			%>
				<table border="0" width="100%">
					<tr style="background:#eee;font-weight:bolder">
						<td>Ser.No</td>
						<td>Date Worked</td>
						<td>Total Hours Worked</td>
						<td>Rate Per Hour</td>
						<td>Delete</td>						
					</tr>
					<%
						int ctr=1;
						while(employeeOvertimeItr.hasNext()){
							EmployeeOvertime employeeOvertime = employeeOvertimeItr.next();
							%>
								<tr>
									<td><%=ctr++ %></td>
									<td><%=employeeOvertime.getDateWorked() %></td>
									<td><%=employeeOvertime.getTotalHoursWorked() %></td>									
									<td><%=employeeOvertime.getRatePerHour() %></td>
									<td>
										<a href="#.jsp" onclick="deleteThisEmployeeOvertime(<%=employeeOvertime.getId() %>);">Delete</a>
									</td>																		 
								</tr>								
							<%
						}//end while loop
					%>
				</table>
			<%
		}else{
			%>
				<p class="msg warning">No overtime information found for this employee!</p>
			<%
		}
	}else{
		%>
			<p class="msg warning">There is no employee found using the employee id number used!</p>
		<%
	}
%>
<script type="text/javascript">
	function deleteThisEmployeeOvertime(employeeOvertimeId){
		if(window.confirm('Are you sure you want to delete this employee overtime record?')){
			var dataString = "employeeOvertimeId="+employeeOvertimeId;
			
			$.ajax({
			    url: 'deleteemployeeovertime.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){
			    		$('#overTimeDetailDiv').html(response);					
			    },
			    error:function(error){
					alert(error);
			    }
			});
		}//end confirmation if condition
	}
</script>