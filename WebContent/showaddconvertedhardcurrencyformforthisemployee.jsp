<%@page import="java.sql.Date"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%
	long employeeId = Long.parseLong(request.getParameter("employeeId"));
	String payrollMonth = request.getParameter("payrollMonth");
	Date datePrepared = Date.valueOf(request.getParameter("datePrepared"));
	//now define the control name in here...
	String textBoxControlName = "txtconvertedamount" + employeeId;
	ConvertedHardCurrency convertedHardCurrency = ConvertedHardCurrency.getMostRecentConvertedHardCurrencyForEmployee(employeeId);
%>

<input type="text" name="<%=textBoxControlName %>" id="<%=textBoxControlName %>" size="5"
	value="<%=(convertedHardCurrency != null ? convertedHardCurrency.getConvHrdCurrencyAmount() : 0.0f)%>"/>

<script type="text/javascript">
	$(document).ready(function(){
		var employeeId = "<%=employeeId%>";
		var textBoxControlName = "txtconvertedamount" + employeeId;
		var payrollMonth = "<%=payrollMonth%>";
		var datePrepared = "<%=datePrepared%>";
		$('#'+textBoxControlName).focus();
		
		$('#'+textBoxControlName).keyup(function(e){
			if(e.keyCode === 13){//pressed key is Enter key?
				var foreignCurrencyAmount = $('#'+textBoxControlName).val();
				if(payrollMonth != "" && datePrepared != "" && foreignCurrencyAmount != "" && employeeId != ""){
					var dataString = "employeeId="+employeeId+"&foreignCurrencyAmount="+foreignCurrencyAmount;
					$.ajax({
					    url: 'saveconvertedhardcurrency.jsp',		
					    data: dataString,
					    type:'POST',
					    success:function(response){				    		
					    		$('#payrollDetailDiv').load('shownewexpatriateteachersetbpayrolldetail.jsp?payrollMonth='+payrollMonth+'&datePrepared='+datePrepared);					
					    },
					    error:function(error){
							alert(error);
					    }
					});
				}
			}
		});
	});//end document.ready function
</script>