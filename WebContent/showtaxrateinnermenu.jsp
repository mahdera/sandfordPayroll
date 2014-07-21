<div>
	<table border="0" width="100%">
		<tr style="background:#CCCCCC">
			<td align="center"><a href="#.jsp" id="addTaxRateLink"><img src="design/add-icon.gif" border="0" /> <strong>Add Tax Rate</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfTaxRatesLink"><img src="design/viewdetail.jpeg" border="0" align="absmiddle"/> <strong>View Tax Rates</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfTaxRatesForEditLink"><img src="design/edit-icon.gif" border="0" align="absmiddle"/> <strong>Edit Tax Rate</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfTaxRatesForDeleteLink"><img src="design/delete.png" border="0" align="absmiddle"/> <strong>Delete Tax Rate</strong></a></td>			
		</tr>
	</table>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#addTaxRateLink').click(function(){
			$('#subTabDetailDiv').load('showaddtaxrateform.jsp');
		});
		
		$('#showListOfTaxRatesLink').click(function(){
			$('#subTabDetailDiv').load('showlistoftaxrates.jsp');
		});
		
		$('#showListOfTaxRatesForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistoftaxratesforedit.jsp');
		});
		
		$('#showListOfTaxRatesForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistoftaxratesfordelete.jsp');
		});
	});//end document.ready function
</script>