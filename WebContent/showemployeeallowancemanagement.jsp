<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*"%>
<div style="background:#eee">
	<table border="1" width="100%">
		<tr style="font-weight:bolder">
			<td colspan="2">
				Employee Allowance Management: Employee Type Selector Bar
			</td>
		</tr>
		<tr>
			<td>	Please select employee type</td>
			<td>
				<select name="slctemployeetypedropdown" id="slctemployeetypedropdown" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<option value="International Employee">International Employee</option>
					<option value="National Employee">National Employee</option>
				</select>
			</td>
		</tr>
	</table>
</div>
<div id="employeeListDiv"></div>
<div id="employeeListDetailDiv"></div>
<script type="text/javascript">
	$('#slctemployeetypedropdown').change(function(){
		var selectedEmployeeType = $(this).val();
		if(selectedEmployeeType != ''){
			if(selectedEmployeeType == 'International Employee'){
				$('#employeeListDetailDiv').load('showlistofinternationalemployeesforallowancemanagement.jsp');
			}else if(selectedEmployeeType == 'National Employee'){
				$('#employeeListDetailDiv').load('showlistofnationalemployeesforallowancemanagement.jsp');
			}
		}else{
			$('#employeeListDetailDiv').html('');
		}
	});
</script>
