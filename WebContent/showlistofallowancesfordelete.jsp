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
					<td>Delete</td>
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
									<a href="#.jsp" onclick="deleteThisAllowance(<%=allowance.getId() %>);">Delete</a>
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
	function deleteThisAllowance(allowanceId){
		if(window.confirm('Are you sure you want to delete this allowance record?')){
			var dataString = "allowanceId="+allowanceId;
			$.ajax({
			    url: 'deleteallowance.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){
			    		$('#subTabDetailDiv').load('showlistofallowancesfordelete.jsp');					
			    },
			    error:function(error){
					alert(error);
			    }
			});
		}
	}
</script>