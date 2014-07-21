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
					<td>Edit</td>
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
								<a href="#.jsp" onclick="showEditFieldsOfThisTaxPayerInformation(<%=whoIsTaxPayer.getId() %>);">Edit</a>
								|
								<a href="#.jsp" onclick="hideDiv(<%=whoIsTaxPayer.getId()%>);">Hide</a>
							</td>
						</tr>
						<%
							String divId = "whoIsTaxPayerEditDiv" + whoIsTaxPayer.getId();
						%>
						<tr>
							<td colspan="10">
								<div id="<%=divId %>"></div>
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
	function showEditFieldsOfThisTaxPayerInformation(taxPayerId){
		var divId = "whoIsTaxPayerEditDiv" + taxPayerId;
		$('#'+divId).load('showeditfieldsofthistaxpayerinformation.jsp?taxPayerId='+taxPayerId);
	}
	
	function hideDiv(taxPayerId){
		var divId = "whoIsTaxPayerEditDiv" + taxPayerId;
		$('#'+divId).html("");
	}
</script>