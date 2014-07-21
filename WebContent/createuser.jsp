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
	<table border="1" width="100%" style="background:#eeeeee">
		<tr>
			<td align="right"><font color="red">*</font> Full Name:</td>
			<td>
				<input type="text" name="txtfullname" id="txtfullname"/>
			</td>
		</tr>
		<tr>
			<td align="right"><font color="red">*</font> User Type:</td>
			<td>
				<select name="slctusertype" id="slctusertype" style="width:50%">
					<option value="" selected="selected">--Select--</option>
					<option value="Administrator">Administrator</option>
					<option value="Data Clerk">Data Clerk</option>					
				</select>
			</td>
		</tr>
		<tr>
			<td align="right"><font color="red">*</font> Username:</td>
			<td>
				<input type="text" name="txtusername" id="txtusername"/>
			</td>
		</tr>
		<tr>
			<td align="right"><font color="red">*</font> Password:</td>
			<td>
				<input type="password" name="txtpassword" id="txtpassword"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="Save" class="input-submit" id="btnsave"/>						
				<input type="reset" value="Clear" class="input-submit"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<p class="msg info">N.B. Fields indicated with <font color="red">*</font> are required!</p>
			</td>
		</tr>
	</table>
	<%
	}else{
		out.print("<p class='msg error'>You do not have sufficient privileged to perform this operation!</p>");
	}	
%>
<div id="errorDiv"></div>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnsave').click(function(){
			var fullName = $('#txtfullname').val();
			var userType = $('#slctusertype').val();
			var username = $('#txtusername').val();
			var password = $('#txtpassword').val();
			
			if(fullName != "" && userType != "" && username != "" && password != ""){
				var dataString = "fullName="+fullName+"&userType="+userType+"&username="+username+
				"&password="+password;
				
				$.ajax({
				    url: 'saveuser.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#tabDetailDiv').load('createuser.jsp');					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>