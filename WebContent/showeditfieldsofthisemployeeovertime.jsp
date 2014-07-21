<%@page import="com.payrolladmin.server.classes.*"%>
<%
	long employeeOvertimeId = Long.parseLong(request.getParameter("employeeOvertimeId"));
	EmployeeOvertime employeeOvertime = EmployeeOvertime.getEmployeeOvertime(employeeOvertimeId);
	//now define the control names in here...
	String dateWorkedControlName = "txtdateworked" + employeeOvertimeId;
	String totalHoursWorkedControlName = "txttotalhoursworked" + employeeOvertimeId;
	String ratePerHourControlName = "txtrateperhour" + employeeOvertimeId;
%>
<form style="background:#eee">
	<table border="0" width="100%">
		<tr>
			<td><font color="red">*</font> Date Worked:</td>
			<td>
				<input type="text" name="<%=dateWorkedControlName %>" id="<%=dateWorkedControlName %>" value="<%=employeeOvertime.getDateWorked() %>"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('<%=dateWorkedControlName %>');" />
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> Total Hours Worked:</td>
			<td>
				<input type="text" name="<%=totalHoursWorkedControlName %>" id="<%=totalHoursWorkedControlName %>" size="30" value="<%=employeeOvertime.getTotalHoursWorked() %>"/>
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> Rate/Hour (Rate per hour):</td>
			<td>
				<input type="text" name="<%=ratePerHourControlName %>" id="<%=ratePerHourControlName %>" size="30" value="<%=employeeOvertime.getRatePerHour() %>"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<%
					String buttonId = "btnupdate" + employeeOvertimeId;
				%>
				<input type="button" value="Update" id="<%=buttonId%>" class="input-submit"/>
				<input type="reset" value="Clear" class="input-submit"/>
			</td>						
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var employeeOvertimeId = "<%=employeeOvertimeId%>";
		var buttonId = "btnupdate" + employeeOvertimeId;
		
		$('#'+buttonId).click(function(){
			//now define the control names in here...
			var dateWorkedControlName = "txtdateworked" + employeeOvertimeId;
			var totalHoursWorkedControlName = "txttotalhoursworked" + employeeOvertimeId;
			var ratePerHourControlName = "txtrateperhour" + employeeOvertimeId;
			//get the values....
			var dateWorked = $('#'+dateWorkedControlName).val();
			var totalHoursWorked = $('#'+totalHoursWorkedControlName).val();
			var ratePerHour = $('#'+ratePerHourControlName).val();
			
			if(employeeOvertimeId != "" && dateWorked != "" && totalHoursWorked != "" && ratePerHour != ""){
				var dataString = "employeeOvertimeId="+employeeOvertimeId+"&dateWorked="+dateWorked+
				"&totalHoursWorked="+totalHoursWorked+"&ratePerHour="+ratePerHour;
				
				var divId = "employeeOvertimeEditDiv" + employeeOvertimeId;
				
				$.ajax({
				    url: 'updateemployeeovertime.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#'+divId).html(response);					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>