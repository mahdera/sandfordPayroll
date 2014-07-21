<div>
	<table border="0" width="100%">
		<tr style="background:#CCCCCC">
			<td align="center"><a href="#.jsp" id="addRetainedWithSchoolLink"><img src="design/add-icon.gif" border="0" /> <strong>Add Retained with School Info</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfRetainedWithSchoolLink"><img src="design/viewdetail.jpeg" border="0" align="absmiddle"/> <strong>View Retained with School Info</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfRetainedWithSchoolForEditLink"><img src="design/edit-icon.gif" border="0" align="absmiddle"/> <strong>Edit Retained with School Info</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfRetainedWithSchoolForDeleteLink"><img src="design/delete.png" border="0" align="absmiddle"/> <strong>Delete Retained with School Info</strong></a></td>			
		</tr>
	</table>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#addRetainedWithSchoolLink').click(function(){
			$('#subTabDetailDiv').load('showaddretainedwithschoolform.jsp');
		});
		
		$('#showListOfRetainedWithSchoolLink').click(function(){
			$('#subTabDetailDiv').load('showlistofretainedwithschool.jsp');
		});
		
		$('#showListOfRetainedWithSchoolForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofretainedwithschoolforedit.jsp');
		});
		
		$('#showListOfRetainedWithSchoolForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofretainedwithschoolfordelete.jsp');
		});
	});//end document.ready function
</script>
