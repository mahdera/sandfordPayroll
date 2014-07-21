<%@page import="com.payrolladmin.server.classes.*"%>
<form style="background:#eee">
	<table border="0" width="100%">
		<tr>
			<td>Enter Employee Id Number:</td>
			<td>
				<input type="text" id="txtemployeeidnumber" id="txtemployeeidnumber" size="30"/>
				<input type="button" value="Search" id="btnsearch"/>
				<input type="reset" value="Clear"/>
			</td>
		</tr>
	</table>
</form>
<div id="advanceDetailDiv"></div>
<script type="text/javascript">
	$(document).ready(function(){		
		$('#txtemployeeidnumber').focus();
		$('#btnsearch').click(function(){
			var employeeIdNumber = $('#txtemployeeidnumber').val();
			if(employeeIdNumber != ""){
				$('#advanceDetailDiv').load('shownewadvancepaymentformforemployee.jsp?employeeIdNumber='+employeeIdNumber);
			}
		});
	});//end document.ready function
</script>