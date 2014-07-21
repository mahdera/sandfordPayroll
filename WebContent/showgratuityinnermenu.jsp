<div>
	<table border="0" width="100%">
		<tr style="background:#CCCCCC">
			<td align="center"><a href="#.jsp" id="addGratuityLink"><img src="design/add-icon.gif" border="0" /> <strong>Add Gratuity</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfGratuity"><img src="design/viewdetail.jpeg" border="0" align="absmiddle"/> <strong>View Gratuity</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfGratuityForEditLink"><img src="design/edit-icon.gif" border="0" align="absmiddle"/> <strong>Edit Gratuity</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfGratuityForDeleteLink"><img src="design/delete.png" border="0" align="absmiddle"/> <strong>Delete Gratuity</strong></a></td>			
		</tr>
	</table>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#addGratuityLink').click(function(){
			$('#subTabDetailDiv').load('showaddgratuityform.jsp');
		});
		
		$('#showListOfGratuity').click(function(){
			$('#subTabDetailDiv').load('showlistofgratuity.jsp');
		});
		
		$('#showListOfGratuityForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofgratuityforedit.jsp');
		});
		
		$('#showListOfGratuityForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofgratuityfordelete.jsp');
		});
	});//end document.ready function
</script>
