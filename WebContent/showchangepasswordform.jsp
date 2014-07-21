<%@page import="com.payrolladmin.server.classes.*" %>
<form>
<%
	Account account = (Account) session.getAttribute("account");
	String functionalityName = "accountManagement";
	//Functionality functionalityO = Functionality.getFunctionalityByFunctionalityName(functionalityName);
	//Role role = Role.getRole(account.getAccountId(), functionalityO.getId());
	if(true)
	{
%>
<table border="0" width="100%" style="background:#eeeeee">
	<tr>
		<td colspan="2">
			<div id="passwordErrorDiv"></div>
		</td>
	</tr>
	<tr>
		<td align="right">Enter current username</td>
		<td><input type="text" name="txtcurrentusername" id="txtcurrentusername"/></td>
	</tr>
	<tr>
		<td align="right">Enter current password</td>
		<td><input type="password" name="txtcurrentpassword" id="txtcurrentpassword"/></td>
	</tr>
	<tr>
		<td align="right">Enter new password</td>
		<td><input type="password" name="txtnewpassword" id="txtnewpassword"/></td>
	</tr>
	<tr>
		<td align="right">Enter confirmation password</td>
		<td><input type="password" name="txtconfirmpassword" id="txtconfirmpassword"/></td>
	</tr>
	<tr>
		<td align="right" colspan="2">
			<input type="button" value = "Change" class="input-submit" id="btnchange"/>
			<input type="reset" value="Clear" class="input-submit"/>
		</td>		
	</tr>
</table>
<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}	
%>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnchange').click(function(){
			var currentUsername = $('#txtcurrentusername').val();
			var currentPassword = $('#txtcurrentpassword').val();
			var newPassword = $('#txtnewpassword').val();
			var confirmPassword = $('#txtconfirmpassword').val();
			
			if(currentUsername != "" && currentPassword != "" && newPassword != "" && confirmPassword != ""){
				if(newPassword != confirmPassword) {
					$('#passwordErrorDiv').html("<p class='msg warning'>New and confirmation password are not identical!</p>");				
					$('#txtnewpassword').focus();				
				}else{
					var dataString = "currentUsername="+currentUsername+"&currentPassword="+currentPassword+
					"&newPassword="+newPassword;
					
					$.ajax({
					    url: 'changepassword.jsp',		
					    data: dataString,
					    type:'POST',
					    success:function(response){
					    		$('#tabDetailDiv').html(response);					
					    },
					    error:function(error){
							alert(error);
					    }
					});
				}
			}
		});
	});//end document.ready function
</script>