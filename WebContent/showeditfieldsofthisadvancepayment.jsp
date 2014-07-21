<%@page import="com.payrolladmin.server.classes.*"%>
<%
	long advanceId = Long.parseLong(request.getParameter("advanceId"));
	Advance advance = Advance.getAdvance(advanceId);	
	Employee employee = Employee.getEmployee(advance.getEmployeeId());
	String fullName = employee.getFirstName()+" "+employee.getLastName();
	//now define the control names in here...
	String advanceAmountControlName = "txtadvanceamount" + advanceId;
	String advanceDateControlName = "txtadvancedate" + advanceId;
	String reasonControlName = "textareareason" + advanceId;
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
				<input type="text" name="<%=advanceAmountControlName %>" id="<%=advanceAmountControlName %>" size="30" value="<%=advance.getAdvanceAmount() %>"/>
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> Advance Date:</td>
			<td>
				<input type="text" name="<%=advanceDateControlName %>" id="<%=advanceDateControlName %>" value="<%=advance.getAdvanceDate() %>"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('<%=advanceDateControlName %>');" />
			</td>
		</tr>
		<tr>
			<td style="vertical-align:middle">Reason:</td>
			<td>
				<textarea class="jqte-test" name="<%=reasonControlName %>" id="<%=reasonControlName %>" rows="3" style="width:100%"><%=advance.getReason() %></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<%
					String buttonId = "btnupdate" + advanceId;
				%>
				<input type="button" value="Update" class="input-submit" id="<%=buttonId %>"/>
				<input type="reset" value="Clear" class="input-submit"/>
			</td>						
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var advanceId = "<%=advanceId %>";
		var buttonId = "btnupdate" + advanceId;
		
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
			var advanceAmountControlName = "txtadvanceamount" + advanceId;
			var advanceDateControlName = "txtadvancedate" + advanceId;
			var reasonControlName = "textareareason" + advanceId;
			////now get the values...
			var advanceAmount = $('#'+advanceAmountControlName).val();
			var advanceDate = $('#'+advanceDateControlName).val();			
			var reason = $('#'+reasonControlName).val();
			
			if(advanceAmount != "" && advanceDate != ""){
				var dataString = "advanceAmount="+advanceAmount+"&advanceDate="+advanceDate+
				"&advanceId="+advanceId+"&reason="+reason;
				
				$.ajax({
				    url: 'updateadvancepayment.jsp',		
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