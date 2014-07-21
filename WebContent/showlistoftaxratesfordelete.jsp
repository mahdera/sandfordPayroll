<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	List<TaxRate> taxRateList = TaxRate.getAllTaxRates();
	if(!taxRateList.isEmpty()){
		Iterator<TaxRate> taxRateItr = taxRateList.iterator();
		%>
			<table border="1" width="100%">
				<tr style="background:#eee;font-weight:bolder">
					<td>Ser.No</td>
					<td>Lower Boundary</td>
					<td>Upper Boundary</td>
					<td>Tax Rate Percentage</td>
					<td>Other Deduction</td>
					<td>Delete</td>
				</tr>
				<%
					int ctr=1;
					while(taxRateItr.hasNext()){
						TaxRate taxRate = taxRateItr.next();
						%>
							<tr>
								<td><%=ctr++ %></td>
								<td><%=taxRate.getLowerBounday() %></td>
								<td><%=taxRate.getUpperBoundary() %></td>
								<td><%=taxRate.getTaxRatePercentage() %> %</td>
								<td><%=taxRate.getOtherDeduction() %></td>	
								<td>
									<a href="#.jsp" onclick="deleteThisTaxRate(<%=taxRate.getId() %>);">Delete</a>
								</td>							
							</tr>							
						<%
					}//end while loop
				%>
			</table>
		<%
	}else{
		%>
			<p class="msg warning">There is/are no tax rate information saved in the database!</p>
		<%
	}
%>
<script type="text/javascript">
	function deleteThisTaxRate(taxRateId){
		if(window.confirm('Are you sure you want to delete this tax rate record?')){
			var dataString = "taxRateId="+taxRateId;
			
			$.ajax({
			    url: 'deletetaxrate.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){
			    		$('#subTabDetailDiv').load('showlistoftaxratesfordelete.jsp');					
			    },
			    error:function(error){
					alert(error);
			    }
			});
		}//end confirmation if condition
	}
</script>