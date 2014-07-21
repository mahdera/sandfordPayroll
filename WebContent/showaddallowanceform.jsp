<%@page import="com.payrolladmin.server.classes.*" %>
<form style="background:#eee">
	<table border="0" width="100%">
		<tr>
			<td>Allowance Name:</td>
			<td>
				<input type="text" name="txtallowancename" id="txtallowancename" size="30"/>
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
			var allowanceName = $('#txtallowancename').val();
			var description = $('#textareadescription').val();
			
			if(allowanceName != ""){
				var dataString = "allowanceName="+allowanceName+"&description="+description;
				
				$.ajax({
				    url: 'saveallowance.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#subTabDetailDiv').load('showaddallowanceform.jsp');					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>