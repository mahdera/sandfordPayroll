<div>
	<table border="0" width="100%">
		<tr style="background:#CCCCCC">
			<td align="center"><a href="#.jsp" id="addCurrencyLink"><img src="design/add-icon.gif" border="0" /> <strong>Add Currency</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfCurrenciesLink"><img src="design/viewdetail.jpeg" border="0" align="absmiddle"/> <strong>View Currencies</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfCurrenciesForEditLink"><img src="design/edit-icon.gif" border="0" align="absmiddle"/> <strong>Edit Currency</strong></a></td>
			<td align="center"><a href="#.jsp" id="showListOfCurrenciesForDeleteLink"><img src="design/delete.png" border="0" align="absmiddle"/> <strong>Delete Currency</strong></a></td>			
		</tr>
	</table>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#addCurrencyLink').click(function(){
			$('#subTabDetailDiv').load('showaddcurrencyform.jsp');
		});
		
		$('#showListOfCurrenciesLink').click(function(){
			$('#subTabDetailDiv').load('showlistofcurrencies.jsp');
		});
		
		$('#showListOfCurrenciesForEditLink').click(function(){
			$('#subTabDetailDiv').load('showlistofcurrencyforedit.jsp');
		});
		
		$('#showListOfCurrenciesForDeleteLink').click(function(){
			$('#subTabDetailDiv').load('showlistofcurrencyfordelete.jsp');
		});
	});//end document.ready function
</script>