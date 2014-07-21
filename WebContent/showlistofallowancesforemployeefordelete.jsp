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
				<td>Delete</td>			
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
							<td>
								<a href="#.jsp" onclick="deleteThisEmployeeAllowance(<%=employeeAllowance.getId() %>);">Delete</a>
							</td>
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
<script type="text/javascript">
	function deleteThisEmployeeAllowance(employeeAllowanceId){
		if(window.confirm('Are you sure you want to delete this employee allowance record?')){
			var employeeId = "<%=employeeId%>";
			var divId = "employeeAllowanceManagementDiv" + employeeId;
			var dataString = "employeeAllowanceId="+employeeAllowanceId;
			$.ajax({
			    url: 'deleteemployeeallowance.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){
			    		$('#'+divId).load('showlistofallowancesforemployeefordelete.jsp?employeeId='+employeeId);			
			    },
			    error:function(error){
					alert(error);
			    }
			});
		}//end confirmation if condition
	}
</script>