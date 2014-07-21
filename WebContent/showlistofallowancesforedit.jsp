<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	List<Allowance> allowanceList = Allowance.getAllAllowances();
	if(!allowanceList.isEmpty()){
		Iterator<Allowance> allowanceItr = allowanceList.iterator();
		%>
			<table border="0" width="100%">
				<tr style="background:#eee;font-weight:bolder">
					<td>Ser.No</td>
					<td>Allowance Name</td>
					<td>Description</td>
					<td>Edit</td>
				</tr>
				<%
					int ctr=1;
					while(allowanceItr.hasNext()){
						Allowance allowance = allowanceItr.next();
						%>
							<tr>
								<td><%=ctr++ %></td>
								<td><%=allowance.getAllowanceName() %></td>
								<td><%=allowance.getDescription() %></td>
								<td>
									<a href="#.jsp" onclick="showEditFieldsOfThisAllowance(<%=allowance.getId() %>);">Edit</a>
								</td>
							</tr>
							<%
								String divId = "allowanceEditDiv" + allowance.getId();
							%>
							<tr>
								<td colspan="4">
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
			<p class="msg warning">There is/are no allowance information saved in the database!</p>
		<%
	}
%>
<script type="text/javascript">
	function showEditFieldsOfThisAllowance(allowanceId){
		var divId = "allowanceEditDiv" + allowanceId;
		$('#'+divId).load('showeditfieldsofthisallowance.jsp?allowanceId='+allowanceId);
	}
</script>