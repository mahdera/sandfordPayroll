<%@page import="com.payrolladmin.server.classes.Currency"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	long employeeId = Long.parseLong(request.getParameter("employeeId"));
	//now get all employee allowances of this employee...
	List<EmployeeAllowance> employeeAllowanceList = EmployeeAllowance.getAllEmployeeAllowancesOfThisEmployee(employeeId);
	if(!employeeAllowanceList.isEmpty()){
		Iterator<EmployeeAllowance> employeeAllowanceItr = employeeAllowanceList.iterator();
		%>
		<table border="0" width="100%">
			<tr style="background:#eee;font-weight:bolder">
				<td>Ser.No</td>
				<td>Allowance</td>
				<td>Allowance Amount</td>
				<td>Currency</td>				
			</tr>
			<%
				int ctr=1;
				while(employeeAllowanceItr.hasNext()){
					EmployeeAllowance employeeAllowance = employeeAllowanceItr.next();
					Allowance allowance = Allowance.getAllowance(employeeAllowance.getAllowanceId());
					Currency currency = Currency.getCurrency(employeeAllowance.getCurrencyId());
					%>
						<tr>
							<td><%=ctr++ %></td>
							<td><%=allowance.getAllowanceName() %></td>
							<td><%=employeeAllowance.getAllowanceAmount() %></td>
							<td><%=currency.getCurrencyName() %></td>
						</tr>
					<%
				}//end while loop
			%>
		</table>
		<%
	}else{
		%>
			<p class="msg warning">There is/are no employee allowance information saved in the database for this employee!</p>
		<%
	}
%>