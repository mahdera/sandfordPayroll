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
				<td>Delete</td>			
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
								<a href="#.jsp" onclick="deleteThisEmployeeDeduction(<%=employeeDeduction.getId() %>);">Delete</a>
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
	function deleteThisEmployeeDeduction(employeeDeductionId){
		if(window.confirm('Are you sure you want to delete this employee allowance record?')){
			var employeeId = "<%=employeeId%>";
			var divId = "employeeDeductionManagementDiv" + employeeId;
			var dataString = "employeeDeductionId="+employeeDeductionId;
			$.ajax({
			    url: 'deleteemployeededuction.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){
			    		$('#'+divId).load('showlistofdeductionsforemployeefordelete.jsp?employeeId='+employeeId);			
			    },
			    error:function(error){
					alert(error);
			    }
			});
		}//end confirmation if condition
	}
</script>