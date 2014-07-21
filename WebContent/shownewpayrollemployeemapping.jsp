<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	List<Employee> unmappedEmployeeList = EmployeePayrollTypeMap.getAllUnmappedEmployeeList();
	int ctr=1;
	if(!unmappedEmployeeList.isEmpty()){
		Iterator<Employee> unmappedEmployeeItr = unmappedEmployeeList.iterator();
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
					<td><font color="red">*</font> Payroll Employee Type</td>
				</tr>			
			<%				
				while(unmappedEmployeeItr.hasNext()){
					Employee employee = unmappedEmployeeItr.next();
					String payrollEmployeeTypeControlName = "slctpayrollemployeetype" + ctr;
					String employeeIdControlName = "txtemployeeid" + ctr;
					%>
						<tr>
							<td>
								<%=ctr++ %>
								<input type="hidden" name="<%=employeeIdControlName%>" id="<%=employeeIdControlName%>" value="<%=employee.getId() %>"/>
							</td>
							<td><%=employee.getLastName() %></td>
							<td><%=employee.getFirstName() %></td>
							<td><%=employee.getMiddleName() %></td>
							<td><%=employee.getDateOfBirth() %></td>
							<td><%=employee.getPlaceOfBirth() %></td>
							<td><%=employee.getNationalityAtBirth() %></td>
							<td><%=employee.getEmployeeCategoryType() %></td>
							<td>
								<select name="<%=payrollEmployeeTypeControlName %>" id="<%=payrollEmployeeTypeControlName%>" style="width:100%">
									<option value="" selected="selected">--Select--</option>
									<%
										List<PayrollEmptype> payrollEmptypeList = PayrollEmptype.getAllPayrollEmptypes();
										Iterator<PayrollEmptype> payrollEmptypeItr = payrollEmptypeList.iterator();
										while(payrollEmptypeItr.hasNext()){
											PayrollEmptype payrollEmptype = payrollEmptypeItr.next();
											%>
												<option value="<%=payrollEmptype.getId() %>"><%=payrollEmptype.getEmployeeTypeName() %></option>
											<%
										}//end while loop
									%>
								</select>
							</td>
						</tr>
					<%
				}//end while loop
			%>
				<tr>
					<td colspan="9" align="right">
						<input type="button" value="Map Employee Type" id="btnsave" class="input-submit"/>
						<input type="reset" value="Clear" class="input-submit"/>
					</td>
				</tr>
			</table>
		</form>
		<%
	}else{
		%>
			<p class="msg info">All employees are mapped to payroll employee types!</p>
		<%
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		var ctr = "<%=ctr%>";		
		var employeeCount = ctr - 1;		
		var dataString = "";
		
		$('#btnsave').click(function(){
			
			for(var i = 1;i<=employeeCount;i++){
				//now define the control names in here...
				var employeeIdControlName = "txtemployeeid" + i;
				var payrollEmpTypeControlName = "slctpayrollemployeetype" + i;
				//now get the values...
				var employeeId = $('#'+employeeIdControlName).val();
				var payrollEmpType = $('#'+payrollEmpTypeControlName).val();
				//now define a temporary vehchile to transport the parameters as one big dataString...
				var strEmpId = "empId" + i;
				var strPayrollEmpType = "payrollEmpType" + i;
				dataString += strEmpId+"="+employeeId+"&"+strPayrollEmpType+"="+payrollEmpType+"&";
			}//end for...loop
			
			//now append the employeeCount to the dataString object....
			dataString += "employeeCount="+employeeCount;
			$.ajax({
			    url: 'mapemployeestopayrollemployeetype.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){
			    		$('#subTabDetailDiv').load('shownewpayrollemployeemapping.jsp');					
			    },
			    error:function(error){
					alert(error);
			    }
			});
		});//end button click function
	});//end document.ready function	
</script>