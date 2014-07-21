<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	List<EmployeePayrollTypeMap> employeePayrollTypeMapList = EmployeePayrollTypeMap.getAllEmployeePayrollTypeMaps();
	if(!employeePayrollTypeMapList.isEmpty()){
		Iterator<EmployeePayrollTypeMap> employeePayrollTypeMapItr = employeePayrollTypeMapList.iterator();
		%>
			<table border="1" width="100%">
				<tr style="background:#eee;font-weight:bolder">
					<td>Ser.No</td>
					<td>Family Name</td>
					<td>First Name</td>
					<td>Middle Name</td>
					<td>Date of Birth</td>
					<td>Place of Birth</td>
					<td>Nationality At Birth</td>
					<td>Employee Type</td>
					<td>Payroll Employee Type</td>
					<td>Delete</td>
				</tr>
				<%
					int ctr=1;
					while(employeePayrollTypeMapItr.hasNext()){
						EmployeePayrollTypeMap employeePayrollTypeMap = employeePayrollTypeMapItr.next();
						Employee employee = Employee.getEmployee(employeePayrollTypeMap.getEmployeeId());
						if(employee != null){
						%>
						<tr>
							<td><%=ctr++ %></td>
							<td><%=employee.getLastName() %></td>
							<td><%=employee.getFirstName() %></td>
							<td><%=employee.getMiddleName() %></td>
							<td><%=employee.getDateOfBirth() %></td>
							<td><%=employee.getPlaceOfBirth() %></td>
							<td><%=employee.getNationalityAtBirth() %></td>
							<td><%=employee.getEmployeeCategoryType() %></td>
							<td>
								<%=PayrollEmptype.getPayrollEmptype(employeePayrollTypeMap.getPayrollEmpTypeId()).getEmployeeTypeName() %>
							</td>
							<td>
								<a href="#.jsp" onclick="deleteThisEmployeePayrollTypeMapping(<%=employeePayrollTypeMap.getId() %>);">Delete</a>
							</td>
						</tr>						
						<%
						}//end if condition...
					}//end while loop
				%>
			</table>
		<%
	}else{
		%>
			<p class="msg warning">There is/are no employees mapped to the payroll employee type!</p>
		<%
	}
%>
<script type="text/javascript">
	function deleteThisEmployeePayrollTypeMapping(employeePayrollTypeMapId){
		if(window.confirm('Are you sure you want to delete this employee payroll type mapping record?')){
			var dataString = "employeePayrollTypeMapId="+employeePayrollTypeMapId;
			$.ajax({
			    url: 'deletethisemployeepayrolltypemapping.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){
			    		$('#subTabDetailDiv').load('showlistofpayrollemployeemappintsfordelete.jsp');					
			    },
			    error:function(error){
					alert(error);
			    }
			});
		}
	}
</script>