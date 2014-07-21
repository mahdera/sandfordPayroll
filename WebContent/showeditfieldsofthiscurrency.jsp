<%@page import="com.payrolladmin.server.classes.*"%>
<%
	int currencyId = Integer.parseInt(request.getParameter("currencyId"));
	Currency currency = Currency.getCurrency(currencyId);
	//define the control names in here...
	String currencyControlName = "txtcurrencyname" + currencyId;
	String descriptionControlName = "textareadescription" + currencyId;
%>
<form style="background:#eee">
	<table border="0" width="100%">
		<tr>
			<td><font color="red">*</font> Currency Name:</td>
			<td>
				<input type="text" name="<%=currencyControlName %>" id="<%=currencyControlName %>" size="30" value="<%=currency.getCurrencyName() %>"/>
			</td>
		</tr>
		<tr>
			<td>Description:</td>
			<td>
				<textarea name="<%=descriptionControlName %>" id="<%=descriptionControlName %>" rows="3" style="width:100%"><%=currency.getDescription() %></textarea>
			</td>
		</tr>
		<tr>			
			<td colspan="2" align="right">
				<%
					String buttonId = "btnupdate" + currencyId;
				%>
				<input type="button" value="Update" id="<%=buttonId %>" class="input-submit"/>
				<input type="reset" value="Clear" class="input-submit"/>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var currencyId = "<%=currencyId %>";
		var buttonId = "btnupdate" + currencyId;
		
		$('#'+buttonId).click(function(){
			//define the control names in here ...
			var currencyControlName = "txtcurrencyname" + currencyId;
			var descriptionControlName = "textareadescription" + currencyId;
			//////now get the actual control values...
			var currencyName = $('#'+currencyControlName).val();
			var description = $('#'+descriptionControlName).val();
			
			if(currencyName != ""){
				var dataString = "currencyName="+currencyName+"&description="+description+
				"&currencyId="+currencyId;
				
				$.ajax({
				    url: 'updatecurrency.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#subTabDetailDiv').load('showlistofcurrencyforedit.jsp');					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>