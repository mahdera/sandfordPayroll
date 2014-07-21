<%@page import="com.payrolladmin.server.classes.Currency"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	long employeeDeductionId = Long.parseLong(request.getParameter("employeeDeductionId"));
	EmployeeDeduction employeeDeduction = EmployeeDeduction.getEmployeeDeduction(employeeDeductionId);
	long employeeId = employeeDeduction.getEmployeeId();
	//now define the control names in here...
	String deductionControlName = "slctdeduction" + employeeDeductionId;
	String deductionTypeControlName = "slctdeductiontype" + employeeDeductionId;
	String deductionAmountControlName = "txtdeductionamount" + employeeDeductionId;
	String currencyControlName = "slctcurrency" + employeeDeductionId;
%>
<form style="background:lightyellow">
	<table border="0" width="100%">
		<tr>
			<td><font color="red">*</font> Deduction:</td>
			<td>
				<select name="<%=deductionControlName %>" id="<%=deductionControlName %>" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						List<Deduction> deductionList = Deduction.getAllDeductions();
						if(!deductionList.isEmpty()){
							Iterator<Deduction> deductionItr = deductionList.iterator();
							while(deductionItr.hasNext()){
								Deduction deduction = deductionItr.next();
								if(deduction.getId() == employeeDeduction.getDeductionId()){
								%>
									<option value="<%=deduction.getId() %>" selected="selected"><%=deduction.getDeductionName() %></option>
								<%
								}else{
								%>
									<option value="<%=deduction.getId() %>"><%=deduction.getDeductionName() %></option>
								<%
								}
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
			<td>	<font color="red">*</font> Deduction Type</td>
			<td>
				<select name="<%=deductionTypeControlName %>" id="<%=deductionTypeControlName %>" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						if(employeeDeduction.getDeductionType().equalsIgnoreCase("Amount")){
					%>
							<option value="Amount" selected="selected">Amount</option>
							<option value="Percentage">Percentage</option>
					<%
						}else if(employeeDeduction.getDeductionType().equalsIgnoreCase("Percentage")){
					%>
							<option value="Amount">Amount</option>
							<option value="Percentage" selected="selected">Percentage</option>
					<%
						}else{
					%>
							<option value="Amount">Amount</option>
							<option value="Percentage">Percentage</option>
					<%
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> Deduction Amount:</td>
			<td>
				<input type="text" name="<%=deductionAmountControlName %>" id="<%=deductionAmountControlName %>" size="30" value="<%=employeeDeduction.getDeductionAmount() %>"/>
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
								if(currency.getId() == employeeDeduction.getCurrencyId()){
								%>
									<option value="<%=currency.getId() %>" selected="selected"><%=currency.getCurrencyName() %></option>
								<%
								}else{
								%>
									<option value="<%=currency.getId() %>"><%=currency.getCurrencyName() %></option>
								<%
								}
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
					String buttonId = "btnupdate" + employeeDeductionId;
				%>
				<input type="button" value="Update" class="input-submit" id="<%=buttonId %>"/>
				<input type="reset" value="Clear" class="input-submit"/>
			</td>
		</tr>		
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var employeeDeductionId = "<%=employeeDeductionId%>";
		var buttonId = "btnupdate" + employeeDeductionId;
		var employeeId = "<%=employeeId%>";
		
		$('#'+buttonId).click(function(){
			//now define the contorl names in here...
			var deductionControlName = "slctdeduction" + employeeDeductionId;
			var deductionTypeControlName = "slctdeductiontype" + employeeDeductionId;
			var deductionAmountControlName = "txtdeductionamount" + employeeDeductionId;
			var currencyControlName = "slctcurrency" + employeeDeductionId;
			//now get the values using the control names you just defined above...
			var deductionId = $('#'+deductionControlName).val();
			var deductionType = $('#'+deductionTypeControlName).val();
			var deductionAmount = $('#'+deductionAmountControlName).val();
			var currencyId = $('#'+currencyControlName).val();
			
			if(employeeDeductionId != "" && deductionId != "" && deductionAmount != "" && currencyId != "" && deductionType != ""){
				
				var dataString = "employeeDeductionId="+employeeDeductionId+"&deductionId="+deductionId+
				"&deductionAmount="+deductionAmount+"&currencyId="+currencyId+"&deductionType="+deductionType;
				
				var divId = "employeeDeductionManagementDiv" + employeeId;
				
				$.ajax({
				    url: 'updateemployeededuction.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#'+divId).load('showlistofdeductionsforemployeeforedit.jsp?employeeId='+employeeId);					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready funciton
</script>