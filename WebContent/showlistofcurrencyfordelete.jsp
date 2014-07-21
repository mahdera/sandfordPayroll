<%@page import="com.payrolladmin.server.classes.Currency"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*"%>
<%
	List<Currency> currencyList = Currency.getAlCurrencies();
	if(!currencyList.isEmpty()){
		Iterator<Currency> currencyItr = currencyList.iterator();
		%>
			<table border="0" width="100%">
				<tr style="background:#eee;font-weight:bolder">
					<td>Ser.No</td>
					<td>Currency Name</td>
					<td>Description</td>
					<td>Delete</td>
				</tr>
				<%
					int ctr=1;
					while(currencyItr.hasNext()){
						Currency currency = currencyItr.next();
						%>
							<tr>
								<td><%=ctr++ %></td>
								<td><%=currency.getCurrencyName() %></td>
								<td><%=currency.getDescription() %></td>
								<td>
									<a href="#.jsp" onclick="deleteThisCurrency(<%=currency.getId() %>);">Delete</a>
								</td>
							</tr>							
						<%
					}//end while loop
				%>
			</table>
		<%
	}else{
		%>
			<p class="msg warning">There is/are no currency information saved in the database!</p>
		<%
	}
%>
<script type="text/javascript">
	function deleteThisCurrency(currencyId){
		if(window.confirm('Are you sure you want to delete this currency record?')){
			var dataString = "currencyId="+currencyId;
			$.ajax({
			    url: 'deletecurrency.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){
			    		$('#subTabDetailDiv').load('showlistofcurrencyfordelete.jsp');					
			    },
			    error:function(error){
					alert(error);
			    }
			});
		}//end if condition
	}
</script>