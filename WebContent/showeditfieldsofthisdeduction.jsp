<%@page import="com.payrolladmin.server.classes.*"%>
<%
	int deductionId = Integer.parseInt(request.getParameter("deductionId"));
	Deduction deduction = Deduction.getDeduction(deductionId);
	//now define the control names in here...
	String deductionNameControlName = "txtdeductionname" + deductionId;
	String descriptionControlName = "textareadescription" + deductionId;
%>
<form style="background:#eee">
	<table border="0" width="100%">
		<tr>
			<td>Deduction Name:</td>
			<td>
				<input type="text" name="<%=deductionNameControlName %>" id="<%=deductionNameControlName %>" size="30" value="<%=deduction.getDeductionName() %>"/>
			</td>
		</tr>
		<tr>
			<td>Description:</td>
			<td>
				<textarea name="<%=descriptionControlName %>" id="<%=descriptionControlName %>" rows="3" style="width:100%"><%=deduction.getDescription() %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<%
					String buttonId = "btnupdate" + deductionId;
				%>
				<input type="button" value="Update" id="<%=buttonId %>" class="input-submit"/>
				<input type="reset" value="Clear" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var deductionId = "<%=deductionId %>";
		var buttonId = "btnupdate" + deductionId;
		
		$('#'+buttonId).click(function(){
			//now define the control names in here..
			var deductionNameControlName = "txtdeductionname" + deductionId;
			var descriptionControlName = "textareadescription" + deductionId;
			/////
			var deductionName = $('#'+deductionNameControlName).val();
			var description = $('#'+descriptionControlName).val();
			
			if(deductionName != ""){
				var dataString = "deductionName="+deductionName+"&description="+description+
				"&deductionId="+deductionId;
				
				$.ajax({
				    url: 'updatededuction.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#subTabDetailDiv').load('showlistofdeductionsforedit.jsp');					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>