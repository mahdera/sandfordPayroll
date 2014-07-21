<div>
	<table border="0" width="100%">
		<tr style="background:#CCCCCC">
			<td align="center"><a href="#.jsp" id="addForExLink"><img src="design/add-icon.gif" border="0" /> <strong>Add ForEx Rate</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfForExLink"><img src="design/viewdetail.jpeg" border="0" align="absmiddle"/> <strong>View ForEx Rates</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfForExForEditLink"><img src="design/edit-icon.gif" border="0" align="absmiddle"/> <strong>Edit ForEx Rate</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfForExForDeleteLink"><img src="design/delete.png" border="0" align="absmiddle"/> <strong>Delete ForEx Rate</strong></a></td>			
		</tr>
	</table>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#addForExLink').click(function(){
			$('#subTabDetailDiv').load('showaddforexrateform.jsp');
		});
		
		$('#showListOfForExLink').click(function(){
			$('#subTabDetailDiv').load('showlistofforexrate.jsp');
		});
		
		$('#showListOfForExForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofforexratesforedit.jsp');
		});
		
		$('#showListOfForExForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofforexratesfordelete.jsp');
		});
	});//end document.ready function
</script>
