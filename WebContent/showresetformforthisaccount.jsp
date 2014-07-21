<%@page import="com.payrolladmin.server.classes.*" %>
<%
	int accountId = Integer.parseInt(request.getParameter("accountId"));	
	Account a = Account.getAccount(accountId);
	String defaultUsername = "user123";
	String defaultPassword = "pass123";
	//now define the control names in here...
	String usernameControlName = "txtresetedusername" + accountId;
	String passwordControlName = "txtresetedpassword" + accountId;
%>
<form>
<table width="100%" style="background:#eeeeee">
	<tr>
		<td align="right">New username</td>
		<td>
			<input type="text" name="<%=usernameControlName %>" id="<%=usernameControlName %>" value="<%=defaultUsername %>"/>
		</td>
	</tr>
	<tr>
		<td align="right">New password</td>
		<td>
			<input type="password" name="<%=passwordControlName %>" id="<%=passwordControlName %>" value="<%=defaultPassword %>"/>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
			<%
				String buttonId = "btnreset" + accountId;
			%>
			<input type="button" value="Reset Account" class="input-submit" id="<%=buttonId %>"/>
			<input type="reset" value="Reset to default values" class="input-submit"/>
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var accountId = "<%=accountId %>";
		var buttonId = "btnreset" + accountId;
		
		$('#'+buttonId).click(function(){
			//now define the control names in here...
			var usernameControlName = "txtresetedusername" + accountId;
			var passwordControlName = "txtresetedpassword" + accountId;
			//now get the values using the defined control names...
			var username = $('#'+usernameControlName).val();
			var password = $('#'+passwordControlName).val();
			
			if(username != "" && password != ""){
				var dataString = "accountId="+accountId+"&username="+username+"&password="+password;
				
				$.ajax({
				    url: 'changepassword.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#tabDetailDiv').load('showaccountsforreset.jsp');					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>