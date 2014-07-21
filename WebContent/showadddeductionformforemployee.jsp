<%@page import="com.payrolladmin.server.classes.Currency"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	long employeeId = Long.parseLong(request.getParameter("employeeId"));
	Employee employee = Employee.getEmployee(employeeId);
	String fullName = employee.getFirstName()+" "+employee.getMiddleName()+" "+employee.getLastName();
	//now define the control names in here...
	String deductionControlName = "slctdeduction" + employeeId;
	String deductionTypeControlName = "slctdeductiontype" + employeeId;
	String deductionAmountControlName = "txtdeductionamount" + employeeId;
	String currencyControlName = "slctcurrency" + employeeId;
%>
<form style="background:lightyellow">
	<table border="0" width="100%">
		<tr>
			<td>Employee:</td>
			<td>
				<input type="text" disabled="disabled" size="30" value="<%=fullName%>"/>
			</td>
		</tr>
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
								%>
									<option value="<%=deduction.getId() %>"><%=deduction.getDeductionName() %></option>
								<%
							}//end while loop
						}else{
							%>
								<p class="msg warning">Administrator should enter deduction types first!</p>
							<%
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> Deduction Type:</td>
			<td>
				<select name="<%=deductionTypeControlName %>" id="<%=deductionTypeControlName %>" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<option value="Amount">Amount</option>
					<option value="Percentage">Percentage</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> Deduction Amount:</td>
			<td>
				<input type="text" name="<%=deductionAmountControlName %>" id="<%=deductionAmountControlName %>" size="30"/>				
				<%
					String divId = "computePercentDiv" + employeeId;
					String linkId = "computePercentValueLink" + employeeId;
				%>				
				<div id="<%=divId %>"></div>
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
		var linkId = "computePercentValueLink" + employeeId;
		
		$('#'+linkId).click(function(){
			var divId = "computePercentDiv" + employeeId;
			$('#'+divId).load('showcomputepercentvalueform.jsp?employeeId='+employeeId);
		});
		
		$('#'+buttonId).click(function(){
			//now define the contorl names in here...
			var deductionControlName = "slctdeduction" + employeeId;
			var deductionTypeControlName = "slctdeductiontype" + employeeId;
			var deductionAmountControlName = "txtdeductionamount" + employeeId;
			var currencyControlName = "slctcurrency" + employeeId;
			//now get the values using the control names you just defined above...
			var deductionId = $('#'+deductionControlName).val();
			var deductionType = $('#'+deductionTypeControlName).val();
			var deductionAmount = $('#'+deductionAmountControlName).val();
			var currencyId = $('#'+currencyControlName).val();
			
			if(employeeId != "" && deductionId != "" && deductionAmount != "" && currencyId != "" && deductionType != ""){
				var dataString = "employeeId="+employeeId+"&deductionId="+deductionId+
				"&deductionAmount="+deductionAmount+"&currencyId="+currencyId+"&deductionType="+deductionType;
				
				var divId = "employeeDeductionManagementDiv" + employeeId;
				
				$.ajax({
				    url: 'saveemployeededuction.jsp',		
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