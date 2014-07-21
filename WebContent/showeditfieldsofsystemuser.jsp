<%@page import="com.payrolladmin.server.classes.*"%>
<%
	int userId = Integer.parseInt(request.getParameter("userId"));
	User user = User.getUser(userId);
	Account account = Account.getAccountForUser(userId);
	//now define the control names in here...
	String fullNameControlName = "txtfullname" + userId;
	String userTypeControlName = "slctusertype" + userId;
%>
<form>
	<table border="1" width="100%" style="background:#eeeeee">
		<tr>
			<td align="right"><font color="red">*</font> Full Name:</td>
			<td>
				<input type="text" name="<%=fullNameControlName %>" id="<%=fullNameControlName %>" value="<%=user.getFullName() %>"/>
			</td>
		</tr>
		<tr>
			<td align="right"><font color="red">*</font> User Type:</td>
			<td>
				<select name="<%=userTypeControlName %>" id="<%=userTypeControlName %>" style="width:50%">
					<option value="" selected="selected">--Select--</option>
					<%
						if(user.getUserType().equalsIgnoreCase("administrator")){
					%>
							<option value="Administrator" selected="selected">Administrator</option>
							<option value="Data Clerk">Data Clerk</option>
					<%
						}else if(user.getUserType().equalsIgnoreCase("data clerk")){
					%>
							<option value="Administrator">Administrator</option>
							<option value="Data Clerk" selected="selected">Data Clerk</option>
					<%
						}else{
					%>
							<option value="Administrator">Administrator</option>
							<option value="Data Clerk">Data Clerk</option>
					<%
						}
					%>					
				</select>
			</td>
		</tr>		
		<tr>
			<td colspan="2" align="right">
				<%
					String buttonId = "btnupdate" + userId;
				%>
				<input type="button" value="Update" class="input-submit" id="<%=buttonId %>"/>						
				<input type="reset" value="Clear" class="input-submit"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<p class="msg info">N.B. Fields indicated with <font color="red">*</font> are required!</p>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var userId = "<%=userId %>";
		var buttonId = "btnupdate" + userId;
		
		$('#'+buttonId).click(function(){
			//now define the control names in here...
			var fullNameControlName = "txtfullname" + userId;
			var userTypeControlName = "slctusertype" + userId;
			//now get the values....
			var fullName = $('#'+fullNameControlName).val();
			var userType = $('#'+userTypeControlName).val();
			
			if(fullName != "" && userType != ""){
				var dataString = "userId="+userId+"&fullName="+fullName+"&userType="+userType;
				
				$.ajax({
				    url: 'updateuser.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#tabDetailDiv').load('showlistofusersforedit.jsp');					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>