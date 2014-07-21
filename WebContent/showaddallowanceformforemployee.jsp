<%@page import="com.payrolladmin.server.classes.Currency"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	long employeeId = Long.parseLong(request.getParameter("employeeId"));
	//now define the control names in here...
	String allowanceControlName = "slctallowance" + employeeId;
	String allowanceAmountControlName = "txtallowanceamount" + employeeId;
	String currencyControlName = "slctcurrency" + employeeId;
%>
<form style="background:lightyellow">
	<table border="0" width="100%">
		<tr>
			<td><font color="red">*</font> Allowance:</td>
			<td>
				<select name="<%=allowanceControlName %>" id="<%=allowanceControlName %>" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<Allowance> allowanceList = Allowance.getAllAllowances();
						if(!allowanceList.isEmpty()){
							Iterator<Allowance> allowanceItr = allowanceList.iterator();
							while(allowanceItr.hasNext()){
								Allowance allowance = allowanceItr.next();
								%>
									<option value="<%=allowance.getId() %>"><%=allowance.getAllowanceName() %></option>
								<%
							}//end while loop
						}else{
							%>
								<p class="msg warning">Administrator should enter allowance types first!</p>
							<%
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> Allowance Amount:</td>
			<td>
				<input type="text" name="<%=allowanceAmountControlName %>" id="<%=allowanceAmountControlName %>" size="30"/>
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> Currency:</td>
			<td>
				<select name="<%=currencyControlName %>" id="<%=currencyControlName %>" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<Currency> currencyList = Currency.getAlCurrencies();
						if(!currencyList.isEmpty()){
							Iterator<Currency> currencyItr = currencyList.iterator();
							while(currencyItr.hasNext()){
								Currency currency = currencyItr.next();
								%>
									<option value="<%=currency.getId() %>"><%=currency.getCurrencyName() %></option>
								<%
							}//end while loop
						}else{
							%>
								<p class="msg warning">Administrator should enter currency list first!</p>
							<%
						}
					%>
				</select>
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
		var employeeId = "<%=employeeId%>";
		var buttonId = "btnsave" + employeeId;
		
		$('#'+buttonId).click(function(){
			//now define the contorl names in here...
			var allowanceControlName = "slctallowance" + employeeId;
			var allowanceAmountControlName = "txtallowanceamount" + employeeId;
			var currencyControlName = "slctcurrency" + employeeId;
			//now get the values using the control names you just defined above...
			var allowanceId = $('#'+allowanceControlName).val();
			var allowanceAmount = $('#'+allowanceAmountControlName).val();
			var currencyId = $('#'+currencyControlName).val();
			
			if(employeeId != "" && allowanceId != "" && allowanceAmount != "" && currencyId != ""){
				var dataString = "employeeId="+employeeId+"&allowanceId="+allowanceId+
				"&allowanceAmount="+allowanceAmount+"&currencyId="+currencyId;
				var divId = "employeeAllowanceManagementDiv" + employeeId;
				
				$.ajax({
				    url: 'saveemployeeallowance.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#'+divId).html(response);					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready funciton
</script>