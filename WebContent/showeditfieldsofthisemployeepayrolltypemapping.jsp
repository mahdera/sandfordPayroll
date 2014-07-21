<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	long employeePayrollTypeMapId = Long.parseLong(request.getParameter("employeePayrollTypeMapId"));
	EmployeePayrollTypeMap employeePayrollTypeMap = EmployeePayrollTypeMap.getEmployeePayrollTypeMap(employeePayrollTypeMapId);
	Employee employee = Employee.getEmployee(employeePayrollTypeMap.getEmployeeId());
	String fullName = employee.getFirstName()+" "+employee.getMiddleName()+" "+employee.getLastName();
	//now define the control name in here...
	String payrollEmpTypeControlName = "slctpayrollemployeetype" + employeePayrollTypeMapId;
%>
<form style="background:lightyellow">
	<table border="0" width="100%">
		<tr>
			<td>Employee:</td>
			<td>
				<%=fullName %>
			</td>
		</tr>
		<tr>
			<td>Payroll Employee Type:</td>
			<td>
				<select name="<%=payrollEmpTypeControlName %>" id="<%=payrollEmpTypeControlName %>" style="width:100%">
					<%
						List<PayrollEmptype> payrollEmptypeList = PayrollEmptype.getAllPayrollEmptypes();
						Iterator<PayrollEmptype> payrollEmptypeItr = payrollEmptypeList.iterator();
						while(payrollEmptypeItr.hasNext()){
							PayrollEmptype payrollEmptype = payrollEmptypeItr.next();
							if(payrollEmptype.getId() == employeePayrollTypeMap.getPayrollEmpTypeId()){
							%>
								<option value="<%=payrollEmptype.getId() %>" selected="selected"><%=payrollEmptype.getEmployeeTypeName() %></option>
							<%
							}else{
							%>
								<option value="<%=payrollEmptype.getId() %>"><%=payrollEmptype.getEmployeeTypeName() %></option>
							<%
							}
						}//end while loop
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<%
					String buttonId = "btnupdate" + employeePayrollTypeMapId;
				%>
				<input type="button" value="Update" id="<%=buttonId %>" class="input-submit"/>
				<input type="reset" value="Undo" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var employeePayrollTypeMapId = "<%=employeePayrollTypeMapId%>";
		var buttonId = "btnupdate" + employeePayrollTypeMapId;
		
		$('#'+buttonId).click(function(){
			//now define the control name in here...
			var payrollEmpTypeControlName = "slctpayrollemployeetype" + employeePayrollTypeMapId;
			//now get the value...
			var payrollEmpTypeId = $('#'+payrollEmpTypeControlName).val();
			
			var dataString = "employeePayrollTypeMapId="+employeePayrollTypeMapId+"&payrollEmpTypeId="+
			payrollEmpTypeId;
			
			$.ajax({
			    url: 'updatemapemployeestopayrollemployeetype.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){
			    		$('#subTabDetailDiv').load('showlistofpayrollemployeemappintsforedit.jsp');					
			    },
			    error:function(error){
					alert(error);
			    }
			});
		});
	});//end document.ready function
</script>