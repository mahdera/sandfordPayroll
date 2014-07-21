<%@page import="com.payrolladmin.server.classes.*"%>
<form style="background:#eee">
	<table border="0" width="100%">
		<tr>
			<td><font color="red">*</font> Currency Name:</td>
			<td>
				<input type="text" name="txtcurrencyname" id="txtcurrencyname" size="30"/>
			</td>
		</tr>
		<tr>
			<td>Description:</td>
			<td>
				<textarea name="textareadescription" id="textareadescription" rows="3" style="width:100%"></textarea>
			</td>
		</tr>
		<tr>			
			<td colspan="2" align="right">
				<input type="button" value="Save" id="btnsave" class="input-submit"/>
				<input type="reset" value="Clear" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnsave').click(function(){
			var currencyName = $('#txtcurrencyname').val();
			var description = $('#textareadescription').val();
			
			if(currencyName != ""){
				var dataString = "currencyName="+currencyName+"&description="+description;
				
				$.ajax({
				    url: 'savecurrency.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#subTabDetailDiv').load('showaddcurrencyform.jsp');					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>