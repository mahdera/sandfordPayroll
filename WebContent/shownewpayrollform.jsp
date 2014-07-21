<%@page import="com.payrolladmin.server.classes.*"%>
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
				<font color="red">*</font> Date Prepared:<br/>
				<input type="text" name="txtdateprepared" id="txtdateprepared"/>
				<img src="sample/images/cal.gif" onclick="javascript:NewCssCal('txtdateprepared');" />
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
				<input type="button" value="Calculate Payroll Sheet" id="btnshow"/>
				<input type="reset" value="Clear"/>
			</td>				
		</tr>		
	</table>
</form>
<div id="loadingDiv">
	<img src="images/loadingfb.gif" alt="Loading..."/>
</div>
<div id="payrollDetailDiv"></div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnshow').attr("disabled", "disabled");
		$('#loadingDiv').hide();
		
		$('#slctpayrollmonth').change(function(){
			var payrollMonth = $('#slctpayrollmonth').val();
			var payrollName = $('#slctpayrollname').val();
			var datePrepared = $('#txtdateprepared').val();
			
			if(payrollMonth != "" && payrollName != "" && datePrepared != ""){
				//now check if this combination is not already saved in the database...
				var dataString = "payrollMonth="+payrollMonth+"&payrollName="+payrollName+
				"&datePrepared="+datePrepared;
				$.ajax({
				    url: 'checkifpayrollisalreadysaved.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){				    		
				    		if(response.trim() == "Saved"){				    			
				    			$('#btnshow').attr("disabled", "disabled");
				    		}else if(response.trim() == "Not"){				    			
				    			$('#btnshow').removeAttr("disabled");
				    		}					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
		
		$('#slctpayrollname').change(function(){
			var payrollMonth = $('#slctpayrollmonth').val();
			var payrollName = $('#slctpayrollname').val();
			var datePrepared = $('#txtdateprepared').val();
			
			if(payrollMonth != "" && payrollName != "" && datePrepared != ""){
				//now check if this combination is not already saved in the database...
				var dataString = "payrollMonth="+payrollMonth+"&payrollName="+payrollName+
				"&datePrepared="+datePrepared;
				$.ajax({
				    url: 'checkifpayrollisalreadysaved.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){				    		
				    		if(response.trim() == "Saved"){				    			
				    			$('#btnshow').attr("disabled", "disabled");
				    		}else if(response.trim() == "Not"){				    			
				    			$('#btnshow').removeAttr("disabled");
				    		}					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
		
		$('#btnshow').click(function(){
			var payrollMonth = $('#slctpayrollmonth').val();
			var datePrepared = $('#txtdateprepared').val();
			var payrollName = $('#slctpayrollname').val();
			
			if(payrollMonth != "" && datePrepared != "" && payrollName != ""){
				//now show the payroll detail...
				if(payrollName == "admin_staff_payroll_detail"){
					$('#loadingDiv').show();
					$('#payrollDetailDiv').load('shownewadminstaffpayrolldetail.jsp?payrollMonth='+payrollMonth+'&datePrepared='+datePrepared);	
				}else if(payrollName == "local_teachers_payroll_detail"){
					$('#loadingDiv').show();
					$('#payrollDetailDiv').load('shownewlocalteacherspayrolldetail.jsp?payrollMonth='+payrollMonth+'&datePrepared='+datePrepared);
				}else if(payrollName == "locally_recruited_expatriate_partime_teachers_payroll_detail"){
					$('#loadingDiv').show();
					$('#payrollDetailDiv').load('shownewlocallyrecruitedexpatriateparttimeteacherspayrolldetail.jsp?payrollMonth='+payrollMonth+'&datePrepared='+datePrepared);					
				}else if(payrollName == "expatriate_teachers_etb_payroll_detail"){
					$('#loadingDiv').show();
					$('#payrollDetailDiv').load('shownewexpatriateteachersetbpayrolldetail.jsp?payrollMonth='+payrollMonth+'&datePrepared='+datePrepared);
				}else if(payrollName == "general_service_staff_payroll_detail"){
					$('#loadingDiv').show();
					$('#payrollDetailDiv').load('shownewgeneralservicestaffpayrolldetail.jsp?payrollMonth='+payrollMonth+'&datePrepared='+datePrepared);
				}else if(payrollName == "expatriate_teachers_usd_payroll_detail"){
					$('#loadingDiv').show();
					$('#payrollDetailDiv').load('shownewexpatriateteachersusdpayrolldetail.jsp?payrollMonth='+payrollMonth+'&datePrepared='+datePrepared);
				}			
			}
		});
	});//end document.ready function
</script>