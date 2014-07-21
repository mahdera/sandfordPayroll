<form style="background:#eee">
	<table border="0" width="100%">
		<tr>
			<td>Enter the Id Number of Employee:</td>
			<td>
				<input type="text" name="txtemployeeidnumber" id="txtemployeeidnumber" size="30"/>
				<input type="button" value="Search" id="btnsearch"/>
			</td>
		</tr>
	</table>
</form>
<div id="gratuityDetailDiv"></div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#txtemployeeidnumber').focus();
		$('#btnsearch').click(function(){
			var employeeIdNumber = $('#txtemployeeidnumber').val();
			if(employeeIdNumber != ""){
				$('#gratuityDetailDiv').load('showaddgratuityformforemployee.jsp?employeeIdNumber='+employeeIdNumber);
			}
		});
	});//end document.ready funciton
</script>