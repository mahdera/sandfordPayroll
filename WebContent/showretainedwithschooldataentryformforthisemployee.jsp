<%@page import="com.payrolladmin.server.classes.*"%>
<%
	long employeeId = Long.parseLong(request.getParameter("employeeId"));
	//now define the control names in here...
	String percentValueControlName = "txtpercentvalue"+employeeId;
	String balanceControlName = "txtbalance"+employeeId;
%>
<form style="background:lightyellow">
	<table border="0" width="100%">
		<tr>
			<td><font color="red">*</font> Percent Value:</td>
			<td>
				<input type="text" name="<%=percentValueControlName %>" id="<%=percentValueControlName%>" size="30"/> %
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> Balance:</td>
			<td>
				<input type="text" name="<%=balanceControlName %>" id="<%=balanceControlName %>" size="30" value="0"/>
			</td>
		</tr>
		<tr>			
			<td colspan="2" align="right">
				<%
					String buttonId = "btnsave" + employeeId;
				%>
				<input type="button" value="Save" class="input-submit" id="<%=buttonId %>"/>
				<input type="reset" value="Clear" class="input-submit"/>
			</td>
		</tr>
	</table>	
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var employeeId = "<%=employeeId %>";
		var buttonId = "btnsave"+employeeId;
		
		$('#'+buttonId).click(function(){
			//now define the control names in here...
			var percentValueControlName = "txtpercentvalue"+employeeId;
			var balanceControlName = "txtbalance"+employeeId;
			//get the values using the control names you have defined just above....
			var percentValue = $('#'+percentValueControlName).val();
			var balance = $('#'+balanceControlName).val();
			
			if(employeeId != "" && percentValue != "" && balance != ""){
				var dataString = "employeeId="+employeeId+"&percentValue="+percentValue+"&balance="+balance;
				
				$.ajax({
				    url: 'saveretainedwithschool.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#subTabDetailDiv').load('showaddretainedwithschoolform.jsp');					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>