<%@page import="com.payrolladmin.server.classes.Currency"%>
<%@page import="com.payrolladmin.server.classes.*" %>
<%@page import="java.util.*" %>
<%
	long gratuityId = Long.parseLong(request.getParameter("gratuityId"));
	Gratuity gratuity = Gratuity.getGratuity(gratuityId);
	//now define the control names in here...
	String amountGivenControlName = "txtamountgiven" + gratuityId;
	String currencyControlName = "slctcurrency" + gratuityId;
	String dateGivenControlName = "txtdategiven" + gratuityId;
	String descriptionControlName = "textareadescription" + gratuityId;
%>
<form style="background:#eee">
	<table border="0" width="100%">
		<tr>
			<td><font color="red">*</font> Amount Given:</td>
			<td>
				<input type="text" name="<%=amountGivenControlName %>" id="<%=amountGivenControlName %>" size="30" value="<%=gratuity.getAmountGiven() %>"/>
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> Currency:</td>
			<td>
				<select name="<%=currencyControlName %>" id="<%=currencyControlName %>" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<Currency> currencyList = Currency.getAlCurrencies();
						Iterator<Currency> currencyItr = currencyList.iterator();
						while(currencyItr.hasNext()){
							Currency currency = currencyItr.next();
							if(gratuity.getCurrencyId() == currency.getId()){
							%>
								<option value="<%=currency.getId() %>" selected="selected"><%=currency.getCurrencyName() %></option>
							<%
							}else{
							%>
								<option value="<%=currency.getId() %>"><%=currency.getCurrencyName() %></option>
							<%
							}
						}//end while loop
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> Date Given:</td>
			<td>
				<input type="text" name="<%=dateGivenControlName %>" id="<%=dateGivenControlName %>" value="<%=gratuity.getDateGiven() %>"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('<%=dateGivenControlName %>');" />
			</td>
		</tr>					
		<tr>
			<td>Description:</td>
			<td>
				<textarea name="<%=descriptionControlName %>" id="<%=descriptionControlName %>" rows="3" style="width:100%"><%=gratuity.getDescription() %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<%
					String buttonId = "btnupdate" + gratuityId;
				%>
				<input type="button" value="Update" id="<%=buttonId %>" class="input-submit"/>
				<input type="reset" value="Clear" class="input-submit"/>
			</td>						
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var gratuityId = "<%=gratuityId %>";
		var buttonId = "btnupdate" + gratuityId;
		
		$('#'+buttonId).click(function(){
			//now define the control names in here...
			var amountGivenControlName = "txtamountgiven" + gratuityId;
			var currencyControlName = "slctcurrency" + gratuityId;
			var dateGivenControlName = "txtdategiven" + gratuityId;
			var descriptionControlName = "textareadescription" + gratuityId;
			////
			var amountGiven = $('#'+amountGivenControlName).val();
			var currencyId = $('#'+currencyControlName).val();
			var dateGiven = $('#'+dateGivenControlName).val();
			var description = $('#'+descriptionControlName).val();
			
			if(amountGiven != "" && currencyId != "" && dateGiven != ""){
				var dataString = "amountGiven="+amountGiven+"&currencyId="+currencyId+
				"&dateGiven="+dateGiven+"&description="+description+"&gratuityId="+gratuityId;
				
				$.ajax({
				    url: 'updategratuity.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#subTabDetailDiv').load('showlistofgratuityforedit.jsp');					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>