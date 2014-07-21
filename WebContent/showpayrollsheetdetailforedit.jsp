<%@page import="com.payrolladmin.server.classes.*"%>
<%
	String payrollName = request.getParameter("payrollName");
	String payrollMonth = request.getParameter("payrollMonth");	
	int payrollYear = Integer.parseInt(request.getParameter("payrollYear"));
	
	//now search the payroll object using payrollname, payrollMonth, payrollYear...
	Payroll payroll = Payroll.getPayrollUsingPayrollNamePayrollMonthPayrollYear(payrollName,payrollMonth,payrollYear);
	String payrollMonthName = "";
	String formattedPayrollName = "";
	
	if(payrollMonth.equalsIgnoreCase("1")){payrollMonthName = "January";}
	else if(payrollMonth.equalsIgnoreCase("2")){payrollMonthName = "February";}
	else if(payrollMonth.equalsIgnoreCase("3")){payrollMonthName = "March";}
	else if(payrollMonth.equalsIgnoreCase("4")){payrollMonthName = "April";}
	else if(payrollMonth.equalsIgnoreCase("5")){payrollMonthName = "May";}
	else if(payrollMonth.equalsIgnoreCase("6")){payrollMonthName = "June";}
	else if(payrollMonth.equalsIgnoreCase("7")){payrollMonthName = "July";}
	else if(payrollMonth.equalsIgnoreCase("8")){payrollMonthName = "August";}
	else if(payrollMonth.equalsIgnoreCase("9")){payrollMonthName = "September";}
	else if(payrollMonth.equalsIgnoreCase("10")){payrollMonthName = "October";}
	else if(payrollMonth.equalsIgnoreCase("11")){payrollMonthName = "November";}
	else if(payrollMonth.equalsIgnoreCase("12")){payrollMonthName = "December";}
	
	if(payrollName.equalsIgnoreCase("admin_staff_payroll_detail")){formattedPayrollName = "Admin Staff Payroll Sheet";	}
	else if(payrollName.equalsIgnoreCase("general_service_staff_payroll_detail")){formattedPayrollName = "General Service Staff Payroll Sheet";}
	else if(payrollName.equalsIgnoreCase("local_teachers_payroll_detail")){formattedPayrollName = "Local Teachers Payroll Sheet";}
	else if(payrollName.equalsIgnoreCase("locally_recruited_expatriate_partime_teachers_payroll_detail")){formattedPayrollName = "Locally Recruited Expatriate, Partime Teachers Payroll Sheet";}
	else if(payrollName.equalsIgnoreCase("expatriate_teachers_etb_payroll_detail")){formattedPayrollName = "Expatriate Teachers ETB Payroll Sheet";}
	else if(payrollName.equalsIgnoreCase("expatriate_teachers_usd_payroll_detail")){formattedPayrollName = "Expatriate Teachers USD Payroll Detail";}
		
	if(payroll != null){
		%>
		<table border="0" width="100%">
			<tr style="background:#eee;font-weight:bolder">				
				<td>Payroll Name</td>
				<td>Payroll Month</td>
				<td>Date Prepared</td>
				<td>Payroll Sheet</td>				
			</tr>
			<tr>
				<td><%=formattedPayrollName %></td>
				<td><%=payrollMonthName %></td>
				<td><%=payroll.getDatePrepared() %></td>
				<td>
					<a href="#.jsp" onclick="showPayrollSheetForThisPayrollForEdit(<%=payroll.getId() %>,'<%=payrollName %>');">View Payroll Sheet</a>
					<div id="loadingDiv" style="display:none">
						<img src="images/loadingfb.gif" alt="Loading..."/>
					</div>
				</td>
			</tr>
		</table>
		<%
	}else{
		%>
			<p class="msg warning">No payroll information is found!</p>
		<%
	}
%>

<div id="payrollSheetDetailDiv"></div>
<script type="text/javascript">
	function showPayrollSheetForThisPayrollForEdit(payrollId, payrollName){
		var divId = "payrollSheetDetailDiv";
		$('#loadingDiv').show();
		$('#'+divId).load('showpayrollsheetforthispayrollforedit.jsp?payrollId='+payrollId+'&payrollName='+payrollName);
	}
</script>