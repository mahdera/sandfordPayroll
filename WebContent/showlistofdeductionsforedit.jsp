<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	List<Deduction> deductionList = Deduction.getAllDeductions();
	if(!deductionList.isEmpty()){
		Iterator<Deduction> deductionItr = deductionList.iterator();
		%>
			<table border="0" width="100%">
				<tr style="background:#eee;font-weight:bolder">
					<td>Ser.No</td>
					<td>Deduction Name</td>
					<td>Description</td>
					<td>Edit</td>
				</tr>
				<%
					int ctr=1;
					while(deductionItr.hasNext()){
						Deduction deduction = deductionItr.next();
						%>
							<tr>
								<td><%=ctr++ %></td>
								<td><%=deduction.getDeductionName() %></td>
								<td><%=deduction.getDescription() %></td>
								<td>
									<a href="#.jsp" onclick="showEditFieldsOfThisDeduction(<%=deduction.getId() %>);">Edit</a>
								</td>
							</tr>
							<%
								String divId = "deductionEditDiv" + deduction.getId();
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
			<p class="msg warning">There is/are no deduction information saved in the database!</p>
		<%
	}
%>
<script type="text/javascript">
	function showEditFieldsOfThisDeduction(deductionId){
		var divId = "deductionEditDiv" + deductionId;
		$('#'+divId).load('showeditfieldsofthisdeduction.jsp?deductionId='+deductionId);
	}
</script>