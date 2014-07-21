<%@page import="com.payrolladmin.server.classes.*"%>
<%
	String employeeIdNumber = request.getParameter("employeeIdNumber");
	//now get employee object using the passed employee id number parameter...
	Employee employee = Employee.findEmployeeUsingIdNumber(employeeIdNumber);
	String fullName = null;	
	
	if(employee != null){
		fullName = employee.getFirstName()+" "+employee.getMiddleName()+" "+employee.getLastName();
		%>
			<form style="background:#eee">
				<table border="0" width="100%">
					<tr>
						<td>Employee:</td>
						<td>
							<input type="text" disabled="disabled" value="<%=fullName %>" size="30"/>
						</td>
					</tr>
					<tr>
						<td><font color="red">*</font> Date Worked:</td>
						<td>
							<input type="text" name="txtdateworked" id="txtdateworked"/>
							<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtdateworked');" />
						</td>
					</tr>
					<tr>
						<td><font color="red">*</font> Total Hours Worked:</td>
						<td>
							<input type="text" name="txttotalhoursworked" id="txttotalhoursworked" size="30"/>
						</td>
					</tr>
					<tr>
						<td><font color="red">*</font> Rate/Hour (Rate per hour):</td>
						<td>
							<input type="text" name="txtrateperhour" id="txtrateperhour" size="30"/>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<input type="button" value="Save" id="btnsave" class="input-submit"/>
							<input type="reset" value="Clear" class="input-submit"/>
						</td>						
					</tr>
				</table>
			</form>
		<%
	}else{
		%>
			<p class="msg warning">There is no employee found using the given id number '<%=employeeIdNumber %>'</p>
		<%
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnsave').click(function(){
			var employeeId = "<%=(employee != null ? employee.getId() : 0) %>";
			var dateWorked = $('#txtdateworked').val();
			var totalHoursWorked = $('#txttotalhoursworked').val();
			var ratePerHour = $('#txtrateperhour').val();
			
			if(employeeId != "" && dateWorked != "" && totalHoursWorked != "" && ratePerHour != ""){
				var dataString = "employeeId="+employeeId+"&dateWorked="+dateWorked+
				"&totalHoursWorked="+totalHoursWorked+"&ratePerHour="+ratePerHour;
				
				$.ajax({
				    url: 'saveemployeeovertime.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#overTimeDetailDiv').html(response);					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>