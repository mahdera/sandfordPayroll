<%@page import="com.payrolladmin.server.classes.Currency"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*" %>
<%
	String employeeIdNumber = request.getParameter("employeeIdNumber");
	Employee employee = Employee.findEmployeeUsingIdNumber(employeeIdNumber);	
	
	if(employee != null){
		String fullName = employee.getFirstName()+" "+employee.getLastName();
		%>
			<form style="background:#eee">
				<table border="0" width="100%">
					<tr>
						<td>Employee:</td>
						<td>
							<input type="text" size="30" value="<%=fullName %>" disabled="disabled"/>
						</td>
					</tr>
					<tr>
						<td><font color="red">*</font> Amount Taken:</td>
						<td>
							<input type="text" name="txtamounttaken" id="txtamounttaken" size="30"/>
						</td>
					</tr>
					<tr>
						<td><font color="red">*</font> Monthly Payment Amount:</td>
						<td>
							<input type="text" name="txtmonthlypaymentamount" id="txtmonthlypaymentamount" size="30"/>							
						</td>
					</tr>
					<tr>
						<td><font color="red">*</font> Currency:</td>
						<td>
							<select name="slctcurrency" id="slctcurrency" style="width:100%">
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
							<input type="text" name="txtdatetaken" id="txtdatetaken"/>
							<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtdatetaken');" />
						</td>
					</tr>
					<tr>
						<td style="vertical-align:middle">Description:</td>
						<td>
							<textarea class="jqte-test" name="textareadescription" id="textareadescription" rows="3" style="width:100%"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<input type="button" value="Save" class="input-submit" id="btnsave"/>
							<input type="reset" value="Clear" class="input-submit"/>
						</td>						
					</tr>
				</table>
			</form>
		<%
	}else{
		%>
			<p class="msg warning">There is no employee found with the given id number '<%=employeeIdNumber %>'</p>
		<%
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		$('.jqte-test').jqte();			
		// settings of status
		var jqteStatus = true;
		$(".status").click(function()
		{
			jqteStatus = jqteStatus ? false : true;
			$('.jqte-test').jqte({"status" : jqteStatus})
		});
		
		$('#btnsave').click(function(){
			var amountTaken = $('#txtamounttaken').val();
			var monthlyPaymentAmount = $('#txtmonthlypaymentamount').val();
			var employeeId = "<%=(employee != null ? employee.getId() : 0)%>";
			var currencyId = $('#slctcurrency').val();
			var description = $('#textareadescription').val();
			var dateTaken = $('#txtdatetaken').val();
			
			if(amountTaken != "" && monthlyPaymentAmount != "" && currencyId != "" && dateTaken != ""){
				var dataString = "amountTaken="+amountTaken+"&monthlyPaymentAmount="+monthlyPaymentAmount+
				"&employeeId="+employeeId+"&currencyId="+currencyId+"&description="+description+"&dateTaken="+dateTaken;
				
				$.ajax({
				    url: 'saveemployeeloan.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#employeeLoanDetailDiv').html(response);					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>