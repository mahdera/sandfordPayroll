<%@page import="com.payrolladmin.server.classes.*"%>
<%
	int taxPayerId = Integer.parseInt(request.getParameter("taxPayerId"));
	WhoIsTaxPayer whoIsTaxPayer = WhoIsTaxPayer.getWhoIsTaxPayer(taxPayerId);
	Employee employee = Employee.getEmployee(whoIsTaxPayer.getEmployeeId());
	String fullName = employee.getFirstName()+" "+employee.getMiddleName()+" "+employee.getLastName();
	//now define the control names in here
	String taxPayerControlName = "slcttaxpayer" + taxPayerId;
%>
<form style="background:lightyellow">
	<table border="0" width="100%">
		<tr>
			<td width="30%">Employee:</td>
			<td>
				<input type="text" disabled="disabled" value="<%=fullName %>" size="30"/>
			</td>
		</tr>
		<tr>
			<td>Tax Payer:</td>
			<td>
				<select name="<%=taxPayerControlName %>" id="<%=taxPayerControlName %>" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%
						if(whoIsTaxPayer.getTaxPayer().equalsIgnoreCase("school")){
							%>
								<option value="School" selected="selected">School</option>
								<option value="Employee">Employee</option>
							<%
						}else if(whoIsTaxPayer.getTaxPayer().equalsIgnoreCase("employee")){
							%>
								<option value="School">School</option>
								<option value="Employee" selected="selected">Employee</option>
							<%
						}else{
							%>
								<option value="School">School</option>
								<option value="Employee">Employee</option>
							<%
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<%
				String buttonId = "btnupdate" + taxPayerId;
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
		var taxPayerId = "<%=taxPayerId%>";
		var buttonId = "btnupdate" + taxPayerId;
		
		$('#'+buttonId).click(function(){
			//now define the control names in here...
			var taxPayerControlName = "slcttaxpayer" + taxPayerId;
			var taxPayer = $('#'+taxPayerControlName).val();
			
			if(taxPayerId != "" && taxPayer != ""){
				var dataString = "taxPayerId="+taxPayerId+"&taxPayer="+taxPayer;
				
				$.ajax({
				    url: 'updatetaxpayerinformation.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#subTabDetailDiv').load('showlistoftaxpayerforedit.jsp');					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready funciton
</script>