<%@page import="com.payrolladmin.server.classes.*"%>
<%
	long expatTeachersUsdPayrollSheetId = Long.parseLong(request.getParameter("expatTeachersUsdPayrollSheetId"));
	ExpatTeachersUsdPayrollSheet expatTeachersUsdPayrollSheet = ExpatTeachersUsdPayrollSheet.getExpatTeachersUsdPayrollSheet(expatTeachersUsdPayrollSheetId);	
	//now define the control names in here ...
	String basicSalaryControlName = "txtbasicsalary" +  expatTeachersUsdPayrollSheetId;
	String responsibilityAllowanceControlName = "txtresponsibilityallowance" +  expatTeachersUsdPayrollSheetId;
	String grossSalaryControlName = "txtgrosssalary" +  expatTeachersUsdPayrollSheetId;
	String convertedIntoBirrControlName = "txtconvertedintobirr" +  expatTeachersUsdPayrollSheetId;
	String advanceAndLoansControlName = "txtadvanceandloans" +  expatTeachersUsdPayrollSheetId;
	String retainedWithSchoolControlName = "txtretainedwithschool" +  expatTeachersUsdPayrollSheetId;
	String telFaxAndElectControlName = "txttelfaxandelect" +  expatTeachersUsdPayrollSheetId;
	String totalDeductionsControlName = "txttotaldeductions" +  expatTeachersUsdPayrollSheetId;
	String netPayControlName = "txtnetpay" +  expatTeachersUsdPayrollSheetId;
%>
<form style="background:lightyellow">
	<table border="0" width="100%">
		<tr>
			<td>
				Basic Salary:<br/>
				<input type="text" name="<%=basicSalaryControlName %>" id="<%=basicSalaryControlName %>" value="<%=expatTeachersUsdPayrollSheet.getBasicSalary() %>" size="8"/>
			</td>
			<td>
				Resp. Allow.:<br/>
				<input type="text" name="<%=responsibilityAllowanceControlName %>" id="<%=responsibilityAllowanceControlName %>" value="<%=expatTeachersUsdPayrollSheet.getResponsibilityAllowance() %>" size="8"/>
			</td>
			<td>
				Gross Salary:<br/>
				<input type="text" name="<%=grossSalaryControlName %>" id="<%=grossSalaryControlName %>" value="<%=expatTeachersUsdPayrollSheet.getGrossSalary() %>" size="8"/>
			</td>
			<td>
				Converted into Birr:<br/>
				<input type="text" name="<%=convertedIntoBirrControlName %>" id="<%=convertedIntoBirrControlName %>" value="<%=expatTeachersUsdPayrollSheet.getConvertedIntoBirr() %>" size="8"/>
			</td>
			<td>
				Adv & Loans:<br/>
				<input type="text" name="<%=advanceAndLoansControlName %>" id="<%=advanceAndLoansControlName %>" value="<%=expatTeachersUsdPayrollSheet.getAdvanceAndLoans() %>" size="8"/>
			</td>
			<td>
				Retained with School:<br/>
				<input type="text" name="<%=retainedWithSchoolControlName %>" id="<%=retainedWithSchoolControlName %>" value="<%=expatTeachersUsdPayrollSheet.getRetainedWithSchool() %>" size="8"/>
			</td>
			<td>
				Tel, Fax & Elect:<br/>
				<input type="text" name="<%=telFaxAndElectControlName %>" id="<%=telFaxAndElectControlName %>" value="<%=expatTeachersUsdPayrollSheet.getTelFaxElect() %>" size="8"/>
			</td>
			<td>
				Total Deductions:<br/>
				<input type="text" name="<%=totalDeductionsControlName %>" id="<%=totalDeductionsControlName %>" value="<%=expatTeachersUsdPayrollSheet.getTotalDeduction() %>" size="8" readonly="readonly"/>
			</td>
			<td>
				Net Pay:<br/>
				<input type="text" name="<%=netPayControlName %>" id="<%=netPayControlName %>" value="<%=expatTeachersUsdPayrollSheet.getNetPay() %>" size="8" readonly="readonly"/>
			</td>
			<td>
				<%
					String buttonId = "btnupdate" + expatTeachersUsdPayrollSheetId;
				%>
				<br/>
				<input type="button" id="<%=buttonId %>" value="Update"/>
				<input type="reset" value="Undo"/>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var expatTeachersUsdPayrollSheetId = "<%=expatTeachersUsdPayrollSheetId %>";
		//now define the control names in here...
		var basicSalaryControlName = "txtbasicsalary" +  expatTeachersUsdPayrollSheetId;
		var responsibilityAllowanceControlName = "txtresponsibilityallowance" +  expatTeachersUsdPayrollSheetId;
		var grossSalaryControlName = "txtgrosssalary" +  expatTeachersUsdPayrollSheetId;
		var convertedIntoBirrControlName = "txtconvertedintobirr" +  expatTeachersUsdPayrollSheetId;
		var advanceAndLoansControlName = "txtadvanceandloans" +  expatTeachersUsdPayrollSheetId;
		var retainedWithSchoolControlName = "txtretainedwithschool" +  expatTeachersUsdPayrollSheetId;
		var telFaxAndElectControlName = "txttelfaxandelect" +  expatTeachersUsdPayrollSheetId;
		var totalDeductionsControlName = "txttotaldeductions" +  expatTeachersUsdPayrollSheetId;
		var netPayControlName = "txtnetpay" +  expatTeachersUsdPayrollSheetId;
		//now define the button id in here...
		var buttonId = "btnupdate" + expatTeachersUsdPayrollSheetId;
		
		$('#'+basicSalaryControlName).keyup(function(event){
			var keyCode = event.keyCode;
			
			if(keyCode >= 48 && keyCode <= 57){
				//now do the calculation and put the value back to the modified controls...
				var basicSalary = parseFloat($('#'+basicSalaryControlName).val());
				var responsibilityAllowance = parseFloat($('#'+responsibilityAllowanceControlName).val());
				var totalDeductions = parseFloat($('#'+totalDeductionsControlName).val());				
				var grossSalary = basicSalary + responsibilityAllowance;
				var netPay = grossSalary - totalDeductions;				
				//now put the values back to the control names...
				$('#'+grossSalaryControlName).val(grossSalary.toFixed(2));
				$('#'+netPayControlName).val(netPay.toFixed(2));
			}
		});
		
		$('#'+responsibilityAllowanceControlName).keyup(function(event){
			var keyCode = event.keyCode;
			
			if(keyCode >= 48 && keyCode <= 57){
				//now do the calculation and put the value back to the modified controls...
				var basicSalary = parseFloat($('#'+basicSalaryControlName).val());
				var responsibilityAllowance = parseFloat($('#'+responsibilityAllowanceControlName).val());
				var totalDeductions = parseFloat($('#'+totalDeductionsControlName).val());				
				var grossSalary = basicSalary + responsibilityAllowance;
				var netPay = grossSalary - totalDeductions;				
				//now put the values back to the control names...
				$('#'+grossSalaryControlName).val(grossSalary.toFixed(2));
				$('#'+netPayControlName).val(netPay.toFixed(2));
			}
		});
		
		
		$('#'+convertedIntoBirrControlName).keyup(function(event){
			var keyCode = event.keyCode;
			
			if(keyCode >= 48 && keyCode <= 57){
				var usdAmountEntered = parseFloat($('#'+convertedIntoBirrControlName).val());
				var netPay = parseFloat($('#'+netPayControlName).val());
				var dataString = "usdAmountEntered="+usdAmountEntered;
				
				
				$.ajax({
				    url: 'getequivalentetbamountfortheenteredusdamount.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){				    		
				    		$('#'+convertedIntoBirrControlName).val(parseFloat(response).toFixed(2));				    		
				    		//now add this ETB amount to the net pay and modifiy the net pay control...
				    		var newNetPay = 0.0;
				    		newNetPay = parseFloat(netPay) + parseFloat(response);				    		
				    		$('#'+netPayControlName).val(newNetPay.toFixed(2));
				    },
				    error:function(error){
						alert(error);
				    }
				});
				
			}//end if condition...
		});
		
		$('#'+advanceAndLoansControlName).keyup(function(event){
			var keyCode = event.keyCode;
			
			if(keyCode >= 48 && keyCode <= 57){
				var grossSalary = parseFloat($('#'+grossSalaryControlName).val());
				var advanceAndLoans = parseFloat($('#'+advanceAndLoansControlName).val());
				var retainedWithSchool = parseFloat($('#'+retainedWithSchoolControlName).val());
				var telFaxAndElect = parseFloat($('#'+telFaxAndElectControlName).val());
				//now do the calculations in here...
				var totalDeductions = advanceAndLoans + retainedWithSchool + telFaxAndElect;
				var netPay = grossSalary - totalDeductions;
				//now put back the values to the screen so that the user...Mekdes could see it...
				$('#'+totalDeductionsControlName).val(totalDeductions.toFixed(2));
				$('#'+netPayControlName).val(netPay.toFixed(2));
			}
		});
		
		$('#'+retainedWithSchoolControlName).keyup(function(event){
			var keyCode = event.keyCode;
			
			if(keyCode >= 48 && keyCode <= 57){
				var grossSalary = parseFloat($('#'+grossSalaryControlName).val());
				var advanceAndLoans = parseFloat($('#'+advanceAndLoansControlName).val());
				var retainedWithSchool = parseFloat($('#'+retainedWithSchoolControlName).val());
				var telFaxAndElect = parseFloat($('#'+telFaxAndElectControlName).val());
				//now do the calculations in here...
				var totalDeductions = advanceAndLoans + retainedWithSchool + telFaxAndElect;
				var netPay = grossSalary - totalDeductions;
				//now put back the values to the screen so that the user...Mekdes could see it...
				$('#'+totalDeductionsControlName).val(totalDeductions.toFixed(2));
				$('#'+netPayControlName).val(netPay.toFixed(2));
			}
		});
		
		$('#'+telFaxAndElectControlName).keyup(function(event){
			var keyCode = event.keyCode;
			
			if(keyCode >= 48 && keyCode <= 57){
				var grossSalary = parseFloat($('#'+grossSalaryControlName).val());
				var advanceAndLoans = parseFloat($('#'+advanceAndLoansControlName).val());
				var retainedWithSchool = parseFloat($('#'+retainedWithSchoolControlName).val());
				var telFaxAndElect = parseFloat($('#'+telFaxAndElectControlName).val());
				//now do the calculations in here...
				var totalDeductions = advanceAndLoans + retainedWithSchool + telFaxAndElect;
				var netPay = grossSalary - totalDeductions;
				//now put back the values to the screen so that the user...Mekdes could see it...
				$('#'+totalDeductionsControlName).val(totalDeductions.toFixed(2));
				$('#'+netPayControlName).val(netPay.toFixed(2));
			}
		});
		
		//now deal with the button click event in here...
		$('#'+buttonId).click(function(){
			//now grab the values and save it to the expatUsdPayrollSheet table in the database...
			var basicSalary = parseFloat($('#'+basicSalaryControlName).val());
			var responsibilityAllowance = parseFloat($('#'+responsibilityAllowanceControlName).val());
			var grossSalary = parseFloat($('#'+grossSalaryControlName).val());
			var convertedIntoBirr = parseFloat($('#'+convertedIntoBirrControlName).val());
			var advanceAndLoans = parseFloat($('#'+advanceAndLoansControlName).val());
			var retainedWithSchool = parseFloat($('#'+retainedWithSchoolControlName).val());
			var telFaxAndElect = parseFloat($('#'+telFaxAndElectControlName).val());
			var totalDeductions = parseFloat($('#'+totalDeductionsControlName).val());
			var netPay = parseFloat($('#'+netPayControlName).val());
			
			var dataString = "basicSalary="+basicSalary+"&responsibilityAllowance="+responsibilityAllowance+
			"&grossSalary="+grossSalary+"&convertedIntoBirr="+convertedIntoBirr+"&advanceAndLoans="+
			advanceAndLoans+"&retainedWithSchool="+retainedWithSchool+"&telFaxAndElect="+telFaxAndElect+
			"&totalDeductions="+totalDeductions+"&netPay="+netPay+"&expatTeachersUsdPayrollSheetId="+
			expatTeachersUsdPayrollSheetId;
			
			$.ajax({
			    url: 'updateexpatriateteacherspayrollsheetusd.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){	
			    		var divId = "expatTeachersUsdPayrollSheetEditDiv" + expatTeachersUsdPayrollSheetId;
			    		$('#'+divId).html(response);					
			    },
			    error:function(error){
					alert(error);
			    }
			});
		});
	});//end document.ready function
</script>