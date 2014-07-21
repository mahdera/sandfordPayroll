<%@page import="java.util.StringTokenizer"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Calendar" %>
<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	String currentDate = dateFormat.format(cal.getTime());
	Date modificationDate = Date.valueOf(currentDate);
	StringTokenizer token = new StringTokenizer(currentDate,"-");
	String strYear = token.nextToken();	
	int year = Integer.parseInt(strYear);
%>
<form style="background:#eee">
	<table border="0" width="100%">
		<tr>
			<td>
				<font color="red">*</font> Payroll for The Month:<br/>
				<select name="slctpayrollmonth" id="slctpayrollmonth" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<option value="1">January</option>
					<option value="2">February</option>
					<option value="3">March</option>
					<option value="4">April</option>
					<option value="5">May</option>
					<option value="6">June</option>
					<option value="7">July</option>
					<option value="8">August</option>
					<option value="9">September</option>
					<option value="10">October</option>
					<option value="11">November</option>
					<option value="12">December</option>
				</select>
			</td>
			<td>
				<font color="red">*</font> Select Year:<br/>
				<select name="slctpayrollyear" id="slctpayrollyear" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<%						
						int stopYear = year - 5;
						for(int i=year;i>=stopYear;i--){
							%>
								<option value="<%=i%>"><%=i %></option>
							<%
						}//end for...loop
					%>
				</select>
			</td>		
			<td>
				<font color="red">*</font> Payroll Name:<br/>
				<select name="slctpayrollname" id="slctpayrollname" style="width:100%">
					<option value="" selected="selected">--Select--</option>
					<option value="admin_staff_payroll_detail">Administrative Staff Payroll Sheet</option>
					<option value="general_service_staff_payroll_detail">General Service Staff Payroll Sheet</option>
					<option value="local_teachers_payroll_detail">Local Teachers Payroll Sheet</option>
					<option value="locally_recruited_expatriate_partime_teachers_payroll_detail">Locally Recruited Expatriates and Parttime Teachers Payroll Sheet</option>
					<option value="expatriate_teachers_etb_payroll_detail">Expatriate Teachers ETB Salary Payroll Sheet</option>
					<option value="expatriate_teachers_usd_payroll_detail">Expatriate Teachers USD Salary Payroll Sheet</option>
				</select>
			</td>
			<td>
				<br/>
				<input type="button" value="Show Payroll Sheet" id="btnshow"/>
				<input type="reset" value="Clear"/>
			</td>				
		</tr>		
	</table>
</form>
<div id="payrollDetailDiv"></div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnshow').click(function(){
			var payrollMonth = $('#slctpayrollmonth').val();
			var payrollYear = $('#slctpayrollyear').val();
			var payrollName = $('#slctpayrollname').val();
			
			if(payrollMonth != "" && payrollYear != "" && payrollName != ""){				
				$("#payrollDetailDiv").load("showpayrollsheetdetail.jsp?payrollMonth="+payrollMonth+
						"&payrollName="+payrollName+"&payrollYear="+payrollYear);
			}
		});//end button.click function
	});//end document.ready function
</script>