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