<div>
	<table border="0" width="100%">
		<tr style="background:#CCCCCC">
			<td align="center"><a href="#.jsp" id="addAllowanceLink"><img src="design/add-icon.gif" border="0" /> <strong>Add Allowance</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfAllowancesLink"><img src="design/viewdetail.jpeg" border="0" align="absmiddle"/> <strong>View Allowances</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfAllowancesForEditLink"><img src="design/edit-icon.gif" border="0" align="absmiddle"/> <strong>Edit Allowance</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfAllowancessForDeleteLink"><img src="design/delete.png" border="0" align="absmiddle"/> <strong>Delete Allowance</strong></a></td>			
		</tr>
	</table>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#addAllowanceLink').click(function(){
			$('#subTabDetailDiv').load('showaddallowanceform.jsp');
		});
		
		$('#showListOfAllowancesLink').click(function(){
			$('#subTabDetailDiv').load('showlistofallownaces.jsp');
		});
		
		$('#showListOfAllowancesForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofallowancesforedit.jsp');
		});
		
		$('#showListOfAllowancessForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofallowancesfordelete.jsp');
		});
	});//end document.ready function
</script>