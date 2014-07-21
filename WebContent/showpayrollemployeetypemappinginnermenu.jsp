<div>
	<table border="0" width="100%">
		<tr style="background:#CCCCCC">
			<td align="center"><a href="#.jsp" id="newPayrollEmployeeMapping"><img src="design/add-icon.gif" border="0" /> <strong>New Payroll Employee Mapping</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfPayrollEmployeeMappingsLink"><img src="design/viewdetail.jpeg" border="0" align="absmiddle"/> <strong>View Payroll Employee Mappings</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfPayrollEmployeeMappingsForEditLink"><img src="design/edit-icon.gif" border="0" align="absmiddle"/> <strong>Edit Payroll Employee Mapping</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfPayrollEmployeeMappingsForDeleteLink"><img src="design/delete.png" border="0" align="absmiddle"/> <strong>Delete Payroll Employee Mapping</strong></a></td>			
		</tr>
	</table>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#newPayrollEmployeeMapping').click(function(){
			$('#subTabDetailDiv').load('shownewpayrollemployeemapping.jsp');
		});
		
		$('#showListOfPayrollEmployeeMappingsLink').click(function(){
			$('#subTabDetailDiv').load('showlistofpayrollemployeemappings.jsp');
		});
		
		$('#showListOfPayrollEmployeeMappingsForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofpayrollemployeemappintsforedit.jsp');
		});
		
		$('#showListOfPayrollEmployeeMappingsForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofpayrollemployeemappintsfordelete.jsp');
		});
	});//end document.ready function
</script>