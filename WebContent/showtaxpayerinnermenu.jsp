<div>
	<table border="0" width="100%">
		<tr style="background:#CCCCCC">
			<td align="center"><a href="#.jsp" id="addTaxPayerLink"><img src="design/add-icon.gif" border="0" /> <strong>Add Tax Payer</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfTaxPayer"><img src="design/viewdetail.jpeg" border="0" align="absmiddle"/> <strong>View Tax Payers</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfTaxPayerForEditLink"><img src="design/edit-icon.gif" border="0" align="absmiddle"/> <strong>Edit Tax Payer</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfTaxPayerForDeleteLink"><img src="design/delete.png" border="0" align="absmiddle"/> <strong>Delete Tax Payer</strong></a></td>			
		</tr>
	</table>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#addTaxPayerLink').click(function(){
			$('#subTabDetailDiv').load('showtaxpayerform.jsp');
		});
		
		$('#showListOfTaxPayer').click(function(){
			$('#subTabDetailDiv').load('showlistoftaxpayer.jsp');
		});
		
		$('#showListOfTaxPayerForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistoftaxpayerforedit.jsp');
		});
		
		$('#showListOfTaxPayerForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistoftaxpayerfordelete.jsp');
		});
	});//end document.ready function
</script>
