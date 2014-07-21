<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	PayrollEmptype payrollEmptype = PayrollEmptype.getPayrollEmptypeForEmployeeType("Locally Recruited Expatriate Parttime Teacher");
	List<EmployeePayrollTypeMap> employeePayrollTypeMapList = EmployeePayrollTypeMap.getAllLocallyRecruitedExpatTypesWhoseTaxPayrInfoNotDefined(payrollEmptype.getId());
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
					<td><font color="red">*</font> Payroll Employee Type</td>
				</tr>			
			<%				
				while(employeePayrollTypeMapItr.hasNext()){
					EmployeePayrollTypeMap employeePayrollTypeMap = employeePayrollTypeMapItr.next();
					Employee employee = Employee.getEmployee(employeePayrollTypeMap.getEmployeeId());
					String taxPayerControlName = "slcttaxpayer" + ctr;
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
								<select name="<%=taxPayerControlName %>" id="<%=taxPayerControlName%>" style="width:100%">
									<option value="" selected="selected">--Select--</option>
									<option value="Employee">Employee</option>
									<option value="School">School</option>
								</select>
							</td>
						</tr>
					<%
				}//end while loop
			%>
				<tr>
					<td colspan="9" align="right">
						<input type="button" value="Save Tax Payer Information" id="btnsave" class="input-submit"/>
						<input type="reset" value="Clear" class="input-submit"/>
					</td>
				</tr>
			</table>
		</form>
		<%
	}else{
		%>
			<p class="msg info">All Locally Recruited Expat and Parttime Teachers tax payer information has been submitted. Please use the edit option!</p>
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
				var taxPayerControlName = "slcttaxpayer" + i;
				//now get the values...
				var employeeId = $('#'+employeeIdControlName).val();
				var taxPayer = $('#'+taxPayerControlName).val();
				//now define a temporary vehchile to transport the parameters as one big dataString...
				var strEmpId = "empId" + i;
				var strTaxPayer = "taxPayer" + i;
				dataString += strEmpId+"="+employeeId+"&"+strTaxPayer+"="+taxPayer+"&";
			}//end for...loop
			
			//now append the employeeCount to the dataString object....
			dataString += "employeeCount="+employeeCount;
			$.ajax({
			    url: 'savetaxpayerinformation.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){
			    		$('#subTabDetailDiv').load('showtaxpayerform.jsp');					
			    },
			    error:function(error){
					alert(error);
			    }
			});
		});//end button click function
	});//end document.ready function	
</script>