<%@page import="com.payrolladmin.server.classes.Currency"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	long employeeLoanId = Long.parseLong(request.getParameter("employeeLoanId"));
	EmployeeLoan employeeLoan = EmployeeLoan.getEmployeeLoan(employeeLoanId);
	//now define the control names in here....
	String amountTakenControlName = "txtamounttaken" + employeeLoanId;
	String monthlyPaymentAmountControlName = "txtmonthlypaymentamount" + employeeLoanId;
	String currencyControlName = "slctcurrency" + employeeLoanId;
	String dateTakenControlName = "txtdatetaken" + employeeLoanId;
	String descriptionControlName = "textareadescription" + employeeLoanId;
	String balanceRemainingControlName = "txtbalanceremaining" + employeeLoanId;
	
	if(true){		
		%>
			<form style="background:#eee">
				<table border="0" width="100%">					
					<tr>
						<td><font color="red">*</font> Amount Taken:</td>
						<td>
							<input type="text" name="<%=amountTakenControlName %>" id="<%=amountTakenControlName %>" size="30" value="<%=employeeLoan.getAmountTaken() %>"/>
						</td>
					</tr>
					<tr>
						<td><font color="red">*</font> Monthly Payment Amount:</td>
						<td>
							<input type="text" name="<%=monthlyPaymentAmountControlName %>" id="<%=monthlyPaymentAmountControlName %>" size="30" value="<%=employeeLoan.getMonthlyPaymentAmount() %>"/>							
						</td>
					</tr>
					<tr>
						<td><font color="red">*</font> Balance Remaining</td>
						<td>
							<input type="text" name="<%=balanceRemainingControlName %>" id="<%=balanceRemainingControlName %>" value="<%=employeeLoan.getBalanceRemaining() %>" size="30"/>
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
											if(employeeLoan.getCurrencyId() == currency.getId()){
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
											<p class="msg warning">No currency information is defined in the database. System Admin should enter this information first!</p>
										<%
									}
								%>
							</select>
						</td>
					</tr>
					<tr>
						<td><font color="red">*</font> Date Taken:</td>
						<td>
							<input type="text" name="<%=dateTakenControlName %>" id="<%=dateTakenControlName %>" value="<%=employeeLoan.getDateTaken() %>"/>
							<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('<%=dateTakenControlName %>');" />
						</td>
					</tr>
					<tr>
						<td>Description:</td>
						<td>
							<textarea class="jqte-test" name="<%=descriptionControlName %>" id="<%=descriptionControlName %>" rows="3" style="width:100%"><%=employeeLoan.getDescription() %></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<%
								String buttonId = "btnupdate" + employeeLoanId;
							%>
							<input type="button" value="Update" class="input-submit" id="<%=buttonId %>"/>
							<input type="reset" value="Clear" class="input-submit"/>
						</td>						
					</tr>
				</table>
			</form>
		<%
	}else{
		%>
			<p class="msg warning">There is no employee found with the given id number!</p>
		<%
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		var employeeLoanId = "<%=employeeLoanId %>";
		var buttonId = "btnupdate" + employeeLoanId;
		
		$('.jqte-test').jqte();			
		// settings of status
		var jqteStatus = true;
		$(".status").click(function()
		{
			jqteStatus = jqteStatus ? false : true;
			$('.jqte-test').jqte({"status" : jqteStatus})
		});
		
		$('#'+buttonId).click(function(){
			//now define the control names in here...
			var amountTakenControlName = "txtamounttaken" + employeeLoanId;
			var monthlyPaymentAmountControlName = "txtmonthlypaymentamount" + employeeLoanId;
			var currencyControlName = "slctcurrency" + employeeLoanId;
			var dateTakenControlName = "txtdatetaken" + employeeLoanId;
			var descriptionControlName = "textareadescription" + employeeLoanId;
			var balanceRemainingControlName = "txtbalanceremaining" + employeeLoanId;
			//now get the values using the above control names ...
			var amountTaken = $('#'+amountTakenControlName).val();
			var monthlyPaymentAmount = $('#'+monthlyPaymentAmountControlName).val();			
			var currencyId = $('#'+currencyControlName).val();
			var description = $('#'+descriptionControlName).val();
			var dateTaken = $('#'+dateTakenControlName).val();
			var balanceRemaining = $('#'+balanceRemainingControlName).val();
			
			if(amountTaken != "" && monthlyPaymentAmount != "" && currencyId != "" && dateTaken != "" && balanceRemaining != ""){
				var dataString = "amountTaken="+amountTaken+"&monthlyPaymentAmount="+monthlyPaymentAmount+
				"&currencyId="+currencyId+"&description="+description+"&dateTaken="+dateTaken+
				"&employeeLoanId="+employeeLoanId+"&balanceRemaining="+balanceRemaining;
				
				$.ajax({
				    url: 'updateemployeeloan.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#tabDetailDiv').load('showlistofemployeeloanforedit.jsp');					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>