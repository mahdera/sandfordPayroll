<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	PayrollEmptype locallyRecruitedType = PayrollEmptype.getPayrollEmptypeForEmployeeType("Locally Recruited Expatriate Parttime Teacher");
	PayrollEmptype expatType = PayrollEmptype.getPayrollEmptypeForEmployeeType("Expatriate Teacher");
	List<EmployeePayrollTypeMap> employeePayrollTypeMapList = EmployeePayrollTypeMap.getAllExpatAndLocallyRecruitedEmployeesWhoDidNotHaveRetaintionInformation(expatType.getId(),locallyRecruitedType.getId());
	int ctr=1;
	if(!employeePayrollTypeMapList.isEmpty()){
		Iterator<EmployeePayrollTypeMap> employeePayrollTypeMapItr = employeePayrollTypeMapList.iterator();
		%>
		<form>
		<table border="0" width="100%">
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
				<td>Manage Retained with School</td>
			</tr>			
		<%				
			while(employeePayrollTypeMapItr.hasNext()){
				EmployeePayrollTypeMap employeePayrollTypeMap = employeePayrollTypeMapItr.next();
				Employee employee = Employee.getEmployee(employeePayrollTypeMap.getEmployeeId());
				PayrollEmptype payrollEmptype = PayrollEmptype.getPayrollEmptype(employeePayrollTypeMap.getPayrollEmpTypeId());
				if(employee != null){
				%>
					<tr>
						<td>
							<%=ctr++ %>							
						</td>
						<td><%=employee.getLastName() %></td>
						<td><%=employee.getFirstName() %></td>
						<td><%=employee.getMiddleName() %></td>
						<td><%=employee.getDateOfBirth() %></td>
						<td><%=employee.getPlaceOfBirth() %></td>
						<td><%=employee.getNationalityAtBirth() %></td>
						<td><%=employee.getEmployeeCategoryType() %></td>
						<td><%=payrollEmptype.getEmployeeTypeName() %></td>
						<td>
							<a href="#.jsp" onclick="showRetainedWithSchoolDataEntryFormForThisEmployee(<%=employee.getId() %>);">Enter Data</a>
							|
							<a href="#.jsp" onclick="hideRetainedWithSchoolDataEntryFormForThisEmployee(<%=employee.getId() %>);">Hide</a>
						</td>
					</tr>
					<%
						String divId = "retainedWithSchoolEditDiv" + employee.getId();
					%>
					<tr>
						<td colspan="10">
							<div id="<%=divId %>"></div>
						</td>
					</tr>
				<%
				}
			}//end while loop
		%>			
		</table>
	</form>
	<%
	}else{
		%>
			<p class="msg info">All Expat and/or Locally recruited expat/partime teachers have amount to be retained defined in the database!</p>
		<%
	}
%>
<script type="text/javascript">
	function showRetainedWithSchoolDataEntryFormForThisEmployee(employeeId){
		var divId = "retainedWithSchoolEditDiv" + employeeId;
		$('#'+divId).load('showretainedwithschooldataentryformforthisemployee.jsp?employeeId='+employeeId);
	}
	
	function hideRetainedWithSchoolDataEntryFormForThisEmployee(employeeId){
		var divId = "retainedWithSchoolEditDiv" + employeeId;
		$('#'+divId).html("");
	}
</script>