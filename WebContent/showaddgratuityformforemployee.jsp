<%@page import="com.payrolladmin.server.classes.Currency"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%
	String employeeIdNumber = request.getParameter("employeeIdNumber");
	//now get employee object using the passed employee id number parameter...
	Employee employee = Employee.findEmployeeUsingIdNumber(employeeIdNumber);
	String fullName = null;
	
	
	if(employee != null){
		fullName = employee.getFirstName()+" "+employee.getMiddleName()+" "+employee.getLastName();
		%>
			<form style="background:#eee">
				<table border="0" width="100%">
					<tr>
						<td>Employee:</td>
						<td>
							<input type="text" disabled="disabled" value="<%=fullName %>" size="30"/>
						</td>
					</tr>
					<tr>
						<td><font color="red">*</font> Amount Given:</td>
						<td>
							<input type="text" name="txtamountgiven" id="txtamountgiven" size="30"/>
						</td>
					</tr>
					<tr>
						<td><font color="red">*</font> Currency:</td>
						<td>
							<select name="slctcurrency" id="slctcurrency" style="width:100%">
								<option value="" selected="selected">--Select--</option>
								<%
									List<Currency> currencyList = Currency.getAlCurrencies();
									Iterator<Currency> currencyItr = currencyList.iterator();
									while(currencyItr.hasNext()){
										Currency currency = currencyItr.next();
										%>
											<option value="<%=currency.getId() %>"><%=currency.getCurrencyName() %></option>
										<%
									}//end while loop
								%>
							</select>
						</td>
					</tr>
					<tr>
						<td><font color="red">*</font> Date Given:</td>
						<td>
							<input type="text" name="txtdategiven" id="txtdategiven"/>
							<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtdategiven');" />
						</td>
					</tr>					
					<tr>
						<td>Description:</td>
						<td>
							<textarea name="textareadescription" id="textareadescription" rows="3" style="width:100%"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<input type="button" value="Save" id="btnsave" class="input-submit"/>
							<input type="reset" value="Clear" class="input-submit"/>
						</td>						
					</tr>
				</table>
			</form>
		<%
	}else{
		%>
			<p class="msg warning">There is no employee found using the given id number '<%=employeeIdNumber %>'</p>
		<%
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnsave').click(function(){
			var employeeId = "<%=(employee != null ? employee.getId() : 0) %>";
			var amountGiven = $('#txtamountgiven').val();
			var currencyId = $('#slctcurrency').val();
			var dateGiven = $('#txtdategiven').val();
			var description = $('#textareadescription').val();
			
			if(employeeId != "" && amountGiven != "" && currencyId != "" && dateGiven != ""){
				var dataString = "employeeId="+employeeId+"&amountGiven="+amountGiven+
				"&currencyId="+currencyId+"&dateGiven="+dateGiven+"&description="+description;
				
				$.ajax({
				    url: 'savegratuity.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#gratuityDetailDiv').html(response);					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>