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
						<td>Edit</td>						
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
										<a href="#.jsp" onclick="showEditFieldsOfThisEmployeeOvertime(<%=employeeOvertime.getId() %>);">Edit</a>
									</td>																		 
								</tr>
								<%
									String divId = "employeeOvertimeEditDiv" + employeeOvertime.getId();
								%>
								<tr>
									<td colspan="5">
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
	function showEditFieldsOfThisEmployeeOvertime(employeeOvertimeId){
		var divId = "employeeOvertimeEditDiv" + employeeOvertimeId;
		$('#'+divId).load('showeditfieldsofthisemployeeovertime.jsp?employeeOvertimeId='+employeeOvertimeId);
	}
</script>