<%@page import="com.payrolladmin.server.classes.Currency"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	long employeeId = Long.parseLong(request.getParameter("employeeId"));
	//now get all employee allowances of this employee...
	List<EmployeeDeduction> employeeDeductionList = EmployeeDeduction.getAllEmployeeDeductionsOfThisEmployee(employeeId);
	if(!employeeDeductionList.isEmpty()){
		Iterator<EmployeeDeduction> employeeDeductionItr = employeeDeductionList.iterator();
		%>
		<table border="0" width="100%">
			<tr style="background:#eee;font-weight:bolder">
				<td>Ser.No</td>
				<td>Deduction</td>
				<td>Deduction Type</td>
				<td>Deduction Amount</td>
				<td>Currency</td>	
				<td>Edit</td>			
			</tr>
			<%
				int ctr=1;
				while(employeeDeductionItr.hasNext()){
					EmployeeDeduction employeeDeduction = employeeDeductionItr.next();
					Deduction deduction = Deduction.getDeduction(employeeDeduction.getDeductionId());
					Currency currency = Currency.getCurrency(employeeDeduction.getCurrencyId());
					%>
						<tr>
							<td><%=ctr++ %></td>
							<td><%=deduction.getDeductionName() %></td>
							<td><%=employeeDeduction.getDeductionType() %></td>
							<td><%=employeeDeduction.getDeductionAmount() %></td>
							<td><%=currency.getCurrencyName() %></td>
							<td>
								<a href="#.jsp" onclick="showEditFieldsOfThisEmployeeDeduction(<%=employeeDeduction.getId() %>);">Edit</a>
							</td>
						</tr>
						<%
							String divId = "employeeDeductionEditDiv" + employeeDeduction.getId();
						%>
						<tr>
							<td colspan="6">
								<div id="<%=divId%>"></div>
							</td>
						</tr>
					<%
				}//end while loop
			%>
		</table>
		<%
	}else{
		%>
			<p class="msg warning">There is/are no employee deduction information saved in the database for this employee!</p>
		<%
	}
%>
<script type="text/javascript">
	function showEditFieldsOfThisEmployeeDeduction(employeeDeductionId){
		var divId = "employeeDeductionEditDiv" + employeeDeductionId;
		$('#'+divId).load('showeditfieldsofthisemployeededuction.jsp?employeeDeductionId='+employeeDeductionId);
	}
</script>