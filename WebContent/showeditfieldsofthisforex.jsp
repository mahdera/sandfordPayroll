<%@page import="com.payrolladmin.server.classes.*"%>
<%
	int forexId = Integer.parseInt(request.getParameter("forexId"));
	ForeignCurrencyExchangeRate forEx = ForeignCurrencyExchangeRate.getForeignCurrencyExchangeRate(forexId);
	//now define the control names in here...
	String currencyNameControlName = "slctcurrencyname" + forexId;
	String etbEquivalentAmountControlName = "txtetbequivalent" + forexId;
%>
<form style="background:#eee">
	<table border="0" width="100%">
		<tr>
			<td><font color="red">*</font> Currency Name:</td>
			<td>
				<select name="<%=currencyNameControlName %>" id="<%=currencyNameControlName %>" style="width:100%">					
					<%
						if(forEx.getCurrencyName().equalsIgnoreCase("1 USD")){
					%>
							<option value="1 USD" selected="selected">1 USD</option>
							<option value="1 EUR">1 EUR</option>
							<option value="1 Pound">1 Pound</option>
					<%
						}else if(forEx.getCurrencyName().equalsIgnoreCase("1 EUR")){
					%>
							<option value="1 USD">1 USD</option>
							<option value="1 EUR" selected="selected">1 EUR</option>
							<option value="1 Pound">1 Pound</option>
							
					<%
						}else if(forEx.getCurrencyName().equalsIgnoreCase("1 Pound")){
					%>
							<option value="1 USD">1 USD</option>
							<option value="1 EUR">1 EUR</option>
							<option value="1 Pound" selected="selected">1 Pound</option>
					<%
						}else{
					%>
							<option value="" selected="selected">--Select--</option>
							<option value="1 USD">1 USD</option>
							<option value="1 EUR">1 EUR</option>
							<option value="1 Pound">1 Pound</option>
					<%
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> ETB Equivalent Amount:</td>
			<td>
				<input type="text" name="<%=etbEquivalentAmountControlName %>" id="<%=etbEquivalentAmountControlName %>" size="30" value="<%=forEx.getEtbEquivalentAmount() %>"/>
			</td>
		</tr>		
		<tr>
			<%
				String buttonId = "btnupdate" + forexId;
			%>
			<td colspan="2" align="right">
				<input type="button" value="Update" id="<%=buttonId %>" class="input-submit"/>
				<input type="reset" value="Undo" class="input-submit"/>
			</td>			
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var forexId = "<%=forexId%>";
		var buttonId = "btnupdate" + forexId;
		
		$('#'+buttonId).click(function(){
			//now define the contol names in here...
			var currencyNameControlName = "slctcurrencyname" + forexId;
			var etbEquivalentAmountControlName = "txtetbequivalent" + forexId;
			////
			var currencyName = $('#'+currencyNameControlName).val();
			var etbEquivalentAmount = $('#'+etbEquivalentAmountControlName).val();			
			
			if(currencyName != "" && etbEquivalentAmount != ""){
				var dataString = "currencyName="+currencyName+"&etbEquivalentAmount="+etbEquivalentAmount+
				"&forexId="+forexId;
				
				$.ajax({
				    url: 'updateforexrate.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#subTabDetailDiv').load('showlistofforexrates.jsp');					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>