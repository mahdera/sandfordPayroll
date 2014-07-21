<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	List<ForeignCurrencyExchangeRate> forexList = ForeignCurrencyExchangeRate.getAllCurrencyExchangeRates();
	if(!forexList.isEmpty()){
		Iterator<ForeignCurrencyExchangeRate> forexItr = forexList.iterator();
		%>
			<table border="0" width="100%">
				<tr style="background:#eee;font-weight:bolder">
					<td>Ser.No</td>
					<td>Currency Name</td>
					<td>ETB Equivalent Amount</td>					
				</tr>
				<%
					int ctr=1;
					while(forexItr.hasNext()){
						ForeignCurrencyExchangeRate forex = forexItr.next();
						%>
							<tr>
								<td><%=ctr++ %></td>
								<td><%=forex.getCurrencyName() %></td>
								<td><%=forex.getEtbEquivalentAmount() %></td>
							</tr>
						<%
					}//end while loop
				%>
			</table>
		<%
	}else{
		%>
			<p class="msg warning">There is/are no for ex information saved in the database!</p>
		<%
	}
%>