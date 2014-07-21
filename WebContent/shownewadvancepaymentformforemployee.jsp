<%@page import="com.payrolladmin.server.classes.*"%>
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
						<td><font color="red">*</font> Advance Amount:</td>
						<td>
							<input type="text" name="txtadvanceamount" id="txtadvanceamount" size="30"/>
						</td>
					</tr>
					<tr>
						<td><font color="red">*</font> Advance Date:</td>
						<td>
							<input type="text" name="txtadvancedate" id="txtadvancedate"/>
							<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtadvancedate');" />
						</td>
					</tr>
					<tr>
						<td style="vertical-align:middle">Reason:</td>
						<td>
							<textarea class="jqte-test" name="textareareason" id="textareareason" rows="3" style="width:100%"></textarea>
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
			var advanceAmount = $('#txtadvanceamount').val();
			var advanceDate = $('#txtadvancedate').val();
			var employeeId = "<%=(employee != null ? employee.getId() : 0)%>";
			var reason = $('#textareareason').val();
			
			if(advanceAmount != "" && advanceDate != ""){
				var dataString = "advanceAmount="+advanceAmount+"&advanceDate="+advanceDate+
				"&employeeId="+employeeId+"&reason="+reason;
				
				$.ajax({
				    url: 'saveadvancepayment.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#advanceDetailDiv').html(response);					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>