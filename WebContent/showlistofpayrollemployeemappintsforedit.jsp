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
					<td>Edit</td>
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
								<a href="#.jsp" onclick="showEditFieldsOfThisEmployeePayrollTypeMapping(<%=employeePayrollTypeMap.getId() %>);">Edit</a>
							</td>
						</tr>
						<%
							String divId = "employeePayrollTypeMappingEditDiv" + employeePayrollTypeMap.getId();
						%>
						<tr>
							<td colspan="10">
								<div id="<%=divId%>"></div>
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
	function showEditFieldsOfThisEmployeePayrollTypeMapping(employeePayrollTypeMapId){
		var divId = "employeePayrollTypeMappingEditDiv" + employeePayrollTypeMapId;
		$('#'+divId).load('showeditfieldsofthisemployeepayrolltypemapping.jsp?employeePayrollTypeMapId='+employeePayrollTypeMapId);
	}
</script>