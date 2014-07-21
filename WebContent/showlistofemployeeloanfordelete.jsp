<%@page import="com.payrolladmin.server.classes.Currency"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	List<EmployeeLoan> employeeLoanList = EmployeeLoan.getAllEmployeeLoans();
	if(!employeeLoanList.isEmpty()){
		Iterator<EmployeeLoan> employeeLoanItr = employeeLoanList.iterator();
		%>
			<table border="0" width="100%">
				<tr style="background:#eee;font-weight:bolder">
					<td>Ser.No</td>
					<td>Employee</td>
					<td>Amount Taken</td>
					<td>Monthly Payment Amount</td>
					<td>Balance Remaining</td>
					<td>Currency</td>
					<td>Date Taken</td>
					<td>Description</td>
					<td>Delete</td>
				</tr>
				<%
					int ctr=1;
					while(employeeLoanItr.hasNext()){
						EmployeeLoan employeeLoan = employeeLoanItr.next();
						Employee employee = Employee.getEmployee(employeeLoan.getEmployeeId());
						String fullName = employee.getFirstName()+" "+employee.getMiddleName()+" "+employee.getLastName();
						%>
							<tr>
								<td><%=ctr++ %></td>
								<td><%=fullName %></td>
								<td><%=employeeLoan.getAmountTaken() %></td>
								<td><%=employeeLoan.getMonthlyPaymentAmount() %></td>
								<td><%=employeeLoan.getBalanceRemaining() %></td>
								<td><%=Currency.getCurrency(employeeLoan.getCurrencyId()).getCurrencyName() %></td>
								<td><%=employeeLoan.getDateTaken() %></td>
								<td><%=employeeLoan.getDescription() %></td>	
								<td>
									<a href="#.jsp" onclick="deleteThisEmployeeLoan(<%=employeeLoan.getId() %>);">Delete</a>
								</td>
							</tr>							
						<%
					}//end while loop
				%>
			</table>
		<%
	}else{
		%>
			<p class="msg warning">There is/are no employee loan information saved in the database!</p>
		<%
	}
%>
<script type="text/javascript">
	function deleteThisEmployeeLoan(employeeLoanId){		
		if(window.confirm('Are you sure you want to delete this employee loan record?')){
			var dataString = "employeeLoanId="+employeeLoanId;
			
			$.ajax({
			    url: 'deleteemployeeloan.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){
			    		$('#tabDetailDiv').load('showlistofemployeeloanfordelete.jsp');					
			    },
			    error:function(error){
					alert(error);
			    }
			});
		}
	}
</script>