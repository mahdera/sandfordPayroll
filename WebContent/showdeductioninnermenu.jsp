<div>
	<table border="0" width="100%">
		<tr style="background:#CCCCCC">
			<td align="center"><a href="#.jsp" id="addDeductionLink"><img src="design/add-icon.gif" border="0" /> <strong>Add Deduction</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfDeductionsLink"><img src="design/viewdetail.jpeg" border="0" align="absmiddle"/> <strong>View Deductions</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfDeductionsForEditLink"><img src="design/edit-icon.gif" border="0" align="absmiddle"/> <strong>Edit Deduction</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfDeductionsForDeleteLink"><img src="design/delete.png" border="0" align="absmiddle"/> <strong>Delete Deduction</strong></a></td>			
		</tr>
	</table>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#addDeductionLink').click(function(){
			$('#subTabDetailDiv').load('showadddeductionform.jsp');
		});
		
		$('#showListOfDeductionsLink').click(function(){
			$('#subTabDetailDiv').load('showlistofdeductions.jsp');
		});
		
		$('#showListOfDeductionsForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofdeductionsforedit.jsp');
		});
		
		$('#showListOfDeductionsForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofdeductionsfordelete.jsp');
		});
	});//end document.ready function
</script>