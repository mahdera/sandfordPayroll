<%@page import="com.payrolladmin.server.classes.*"%>
<%
	long employeeId = Long.parseLong(request.getParameter("employeeId"));
	EmployeeSalary employeeSalary = EmployeeSalary.getEmployeeSalaryForThisEmployee(employeeId);
	if(employeeSalary != null){
		Salary salary = Salary.getSalary(employeeSalary.getSalaryId());
		//now define the control names in here...
		String amountControlName = "txtvalueamount" + employeeId;
		String basicSalaryControlName = "txtbasicsalary" + employeeId;
		String displayAreaDiv = "resultDisplayAreaDiv" + employeeId;
		%>
		<table border="0" width="100%" style="background:#ffffff">
			<tr>
				<td align="right">Enter Amount (Value):</td>
				<td>
					<input type="text" name="<%=amountControlName%>" id="<%=amountControlName%>"/>
				</td>
			</tr>
			<tr>
				<td align="right">Employee Basic Salary:</td>
				<td>
					<input type="text" name="<%=basicSalaryControlName %>" id="<%=basicSalaryControlName %>" readonly="readonly" value="<%=salary.getAmount() %>"/>					
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="<%=displayAreaDiv %>"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<%
						String buttonId = "btncompute" + employeeId;
					%>
					<input type="button" value="Compute % value" id="<%=buttonId %>"/>					
				</td>
			</tr>
		</table>
		<%
	}else{
		%>
			<p class="msg warning">No salary information found for this employee!</p>
		<%
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		var employeeId = "<%=employeeId %>";
		var buttonId = "btncompute" + employeeId;
		
		$('#'+buttonId).click(function(){
			//now define the control names in here...
			var amountControlName = "txtvalueamount" + employeeId;
			var basicSalaryControlName = "txtbasicsalary" + employeeId;
			//get the values using the above control names you just defined in here...
			var basicSalary = $('#'+basicSalaryControlName).val();
			var valueAmount = $('#'+amountControlName).val();
			var divId = "resultDisplayAreaDiv" + employeeId;
			//now do the calculation in here and show the result to the specified div area....
			$('#'+divId).html('[ Amount / Basic Salary = % ] => '+(valueAmount +' / '+basicSalary)+'  : '+(valueAmount / basicSalary));
		});
	});//end document.ready function
</script>