<form style="background:#eee">
	<table border="0" width="100%">
		<tr>
			<td><font color="red">*</font> Currency Name:</td>
			<td>
				<select name="slctcurrencyname" id="slctcurrencyname" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<option value="1 USD">1 USD</option>
					<option value="1 EUR">1 EUR</option>
					<option value="1 Pound">1 Pound</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> ETB Equivalent Amount:</td>
			<td>
				<input type="text" name="txtetbequivalent" id="txtetbequivalent" size="30"/>
			</td>
		</tr>		
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="Save" id="btnsave" class="input-submit"/>
				<input type="reset" value="Undo" class="input-submit"/>
			</td>			
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnsave').click(function(){
			var currencyName = $('#slctcurrencyname').val();
			var etbEquivalentAmount = $('#txtetbequivalent').val();			
			
			if(currencyName != "" && etbEquivalentAmount != ""){
				var dataString = "currencyName="+currencyName+"&etbEquivalentAmount="+etbEquivalentAmount;
				
				$.ajax({
				    url: 'saveforexrate.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#subTabDetailDiv').load('showaddforexrateform.jsp');					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>