<%@page import="com.payrolladmin.server.classes.*"%>
<%
	int allowanceId = Integer.parseInt(request.getParameter("allowanceId"));
	Allowance allowance = Allowance.getAllowance(allowanceId);
	//now define the control names in here...
	String allowanceNameControlName = "txtallowancename" + allowanceId;
	String descriptionControlName = "textareadescription" + allowanceId;
%>
<form style="background:#eee">
	<table border="0" width="100%">
		<tr>
			<td>Allowance Name:</td>
			<td>
				<input type="text" name="<%=allowanceNameControlName %>" id="<%=allowanceNameControlName %>" size="30" value="<%=allowance.getAllowanceName() %>"/>
			</td>
		</tr>
		<tr>
			<td>Description:</td>
			<td>
				<textarea name="<%=descriptionControlName %>" id="<%=descriptionControlName %>" rows="3" style="width:100%"><%=allowance.getDescription() %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<%
					String buttonId = "btnupdate" + allowanceId;
				%>
				<input type="button" value="Update" id="<%=buttonId %>" class="input-submit"/>
				<input type="reset" value="Clear" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var allowanceId = "<%=allowanceId %>";
		var buttonId = "btnupdate" + allowanceId;
		
		$('#'+buttonId).click(function(){
			//now define the control names in here..
			var allowanceNameControlName = "txtallowancename" + allowanceId;
			var descriptionControlName = "textareadescription" + allowanceId;
			/////
			var allowanceName = $('#'+allowanceNameControlName).val();
			var description = $('#'+descriptionControlName).val();
			
			if(allowanceName != ""){
				var dataString = "allowanceName="+allowanceName+"&description="+description+
				"&allowanceId="+allowanceId;
				
				$.ajax({
				    url: 'updateallowance.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#subTabDetailDiv').load('showlistofallowancesforedit.jsp');					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>