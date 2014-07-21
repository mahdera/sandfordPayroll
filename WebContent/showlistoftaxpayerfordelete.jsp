<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	List<WhoIsTaxPayer> whoIsTaxPayerList = WhoIsTaxPayer.getAllWhoIsTaxPayers();
	if(!whoIsTaxPayerList.isEmpty()){
		Iterator<WhoIsTaxPayer> whoIsTaxPayerItr = whoIsTaxPayerList.iterator();
		%>
			<table border="0" width="100%">
				<tr style="background:#eee;font-weight:bolder">
					<td>Ser.No</td>
					<td>Family Name</td>
					<td>First Name</td>
					<td>Middle Name</td>
					<td>Date of Birth</td>
					<td>Place of Birth</td>
					<td>Nationality At Birth</td>
					<td>Employee Type</td>
					<td>Tax Payer Information</td>
					<td>Delete</td>
				</tr>	
				<%
					int ctr=1;
					while(whoIsTaxPayerItr.hasNext()){
						WhoIsTaxPayer whoIsTaxPayer = whoIsTaxPayerItr.next();
						Employee employee = Employee.getEmployee(whoIsTaxPayer.getEmployeeId());
						%>
						<tr>
							<td>	<%=ctr++ %></td>
							<td><%=employee.getLastName() %></td>
							<td><%=employee.getFirstName() %></td>
							<td><%=employee.getMiddleName() %></td>
							<td><%=employee.getDateOfBirth() %></td>
							<td><%=employee.getPlaceOfBirth() %></td>
							<td><%=employee.getNationalityAtBirth() %></td>
							<td><%=employee.getEmployeeCategoryType() %></td>
							<td><%=whoIsTaxPayer.getTaxPayer() %></td>
							<td>
								<a href="#.jsp" onclick="deleteThisTaxPayerInformation(<%=whoIsTaxPayer.getId() %>);">Delete</a>
							</td>
						</tr>						
						<%
					}//end while loop
				%>
			</table>	
		<%
	}else{
		%>
			<p class="msg warning">There is/are no tax payer information saved in the database!</p>
		<%
	}
%>
<script type="text/javascript">
	function deleteThisTaxPayerInformation(taxPayerId){
		if(window.confirm('Are you sure you want to delete this tax payer information from the database?')){
			var dataString = "taxPayerId="+taxPayerId;
			$.ajax({
			    url: 'deletetaxpayerinformation.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){
			    		$('#subTabDetailDiv').load('showlistoftaxpayerfordelete.jsp');					
			    },
			    error:function(error){
					alert(error);
			    }
			});
		}
	}
</script>