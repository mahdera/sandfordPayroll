<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.*" %>
<%	
	int payrollMonth = Integer.parseInt(request.getParameter("payrollMonth"));
	String monthName = null;
	int ctr=1;
	String payrollName = "expatriate_teachers_usd_payroll_detail";
	DecimalFormat twoDigit = new DecimalFormat("0.00");
	
	if(payrollMonth == 1){monthName = "JANUARY";}
	else if(payrollMonth == 2){monthName = "FEBRUARY";}
	else if(payrollMonth == 3){monthName = "MARCH";}
	else if(payrollMonth == 4){monthName = "APRIL";}
	else if(payrollMonth == 5){monthName = "MAY";}
	else if(payrollMonth == 6){monthName = "JUNE";}
	else if(payrollMonth == 7){monthName = "JULY";}
	else if(payrollMonth == 8){monthName = "AUGUST";}
	else if(payrollMonth == 9){monthName = "SEPTEMBER";}
	else if(payrollMonth == 10){monthName = "OCTOBER";}
	else if(payrollMonth == 10){monthName = "NOVEMBER";}
	else{monthName = "DECEMBER";}
	
	Date datePrepared = Date.valueOf(request.getParameter("datePrepared"));
	int year = (datePrepared.getYear() + 1900);
	int numberOfDays = 28;
	if(payrollMonth == 1 || payrollMonth == 3 || payrollMonth == 5 || payrollMonth == 8 ||
			payrollMonth == 10 || payrollMonth == 12){
		numberOfDays = 31;
	}else if(payrollMonth == 4 || payrollMonth == 6 || payrollMonth == 7 || payrollMonth == 9 ||
			payrollMonth == 11){
		numberOfDays = 30;
	}
	//now construct a Date object using the above information	
	String strMonth = String.valueOf(payrollMonth);
	if(payrollMonth < 10){
		strMonth = "0"+payrollMonth;
	}
	String strStartDate = year+"-"+strMonth+"-01";
	Date startDate = Date.valueOf(strStartDate);
	//now do the same for the last date of the selected payroll month...
	String strLastDate = year+"-"+strMonth+"-"+numberOfDays;	
	Date lastDate = Date.valueOf(strLastDate);
	PayrollEmptype payrollEmptype = PayrollEmptype.getPayrollEmptypeForEmployeeType("Expatriate Teacher");
	List<Employee> expatTeachersEmployeeList = EmployeePayrollTypeMap.getAllEmployeesOfThisPayrollEmpType(payrollEmptype.getId());	
	
	if(!expatTeachersEmployeeList.isEmpty()){
%>
<div style="text-align:center">
	<h5>SANDFORD INTERNATIONAL SCHOOL<br/>PAYROLL SHEET (EXPATRIATE TEACHERS USD SALARY)<br/>FOR THE MONTH OF <%=monthName %></h5>
</div>
<table border="" width="100%" style="border: 1px solid #2779aa" rules="all">
	<tr style="background:#eee;font-weight:bolder">
		<td colspan="5" align="center">
			Earnings
		</td>
		<td colspan="5" align="center">
			Deductions
		</td>		
		<td></td>
	</tr>
	<tr style="background:#eee;font-weight:bolder">
		<td>No.</td>
		<td>Employee</td>
		<td>Basic Salary</td>
		<td>Resp. Allow.</td>
		<td>Gross Salary</td>		
		<td>Converted into Birr</td>
		<td>Adv & Loans</td>
		<td>Retained with School</td>
		<td>Tel & Fax, Elect</td>
		<td>Total Deductions</td>
		<td>Net Pay</td>				
	</tr>
	<%
		Iterator<Employee> expatTeachersEmployeeItr = expatTeachersEmployeeList.iterator();
		float totalBasicSalary = 0.0f;
		float totalResponsibilityAllowance = 0.0f;
		float totalGrossSalary = 0.0f;
		float totalConvertedHrdCurrency = 0.0f;
		float totalAdvanceAndLoans = 0.0f;
		float totalRetainedWithSchool = 0.0f;
		float totalTelFaxAndElect = 0.0f;
		float totalDeductionsAmount = 0.0f;
		float totalNetPay = 0.0f;
		
		while(expatTeachersEmployeeItr.hasNext()){
			Employee expatTeacherEmployee = expatTeachersEmployeeItr.next();
			String fullName = expatTeacherEmployee.getFirstName()+" "+expatTeacherEmployee.getMiddleName()+" "+expatTeacherEmployee.getLastName();
			EmployeeSalary employeeSalary = EmployeeSalary.getEmployeeSalaryForThisEmployee(expatTeacherEmployee.getId());
			SalaryInternational salary = SalaryInternational.getSalary((employeeSalary != null ? employeeSalary.getSalaryId() : 0));			
			float employeeAllowanceSum = EmployeeAllowance.getEmployeeAllowanceSumForThisEmployee(expatTeacherEmployee.getId());			
			float employeeRetirementPFERSum = 0.0f;
			float basicSalaryUsd = 0.0f;
			if(salary != null){
				basicSalaryUsd = (salary != null ? salary.getUsdAmount() : 0.0f);
				//now get any absent day information from the database and deduct that...			
				float oneDayIncomeUsd = salary.getUsdAmount() / 30;
				AbsentDayInformation absentDayInformation = AbsentDayInformation.getAbsentDayInformationForEmployeeDuringThisYearAndMonth(expatTeacherEmployee.getId(),year,payrollMonth);
				float basicSalaryAfterLeaveInfoUsd = salary.getUsdAmount();
				if(absentDayInformation != null){
					basicSalaryAfterLeaveInfoUsd = salary.getUsdAmount() - (oneDayIncomeUsd * absentDayInformation.getNumberOfDaysToBeDeducted());
					System.out.println("here mahi : "+basicSalaryAfterLeaveInfoUsd);
				}
				float grossSalaryUsd = basicSalaryAfterLeaveInfoUsd + employeeAllowanceSum;
				
				EmployeeAllowance responsibilityAllowanceUsd = EmployeeAllowance.getEmployeeAllowanceForThisEmployeeAndType(expatTeacherEmployee.getId(), "Responsibility Allowance USD");
				float responsibilityUsd = 0.0f;
				if(responsibilityAllowanceUsd != null){
					responsibilityUsd = responsibilityAllowanceUsd.getAllowanceAmount();
				}
				
				EmployeeDeduction pensionDeduction = EmployeeDeduction.getEmployeeDeductionForThisEmployeeAndType(expatTeacherEmployee.getId(),"Pension");
				float pension = 0.0f;
				if(pensionDeduction != null){
					if(pensionDeduction.getDeductionType().equalsIgnoreCase("percentage")){
						pension = grossSalaryUsd * pensionDeduction.getDeductionAmount();	
					}else{
						pension = pensionDeduction.getDeductionAmount();
					}
					
				}
				EmployeeDeduction loanDeduction = EmployeeDeduction.getEmployeeDeductionForThisEmployeeAndType(expatTeacherEmployee.getId(), "Loan");
				float loan = 0.0f;
				if(loanDeduction != null){
					if(loanDeduction.getDeductionType().equalsIgnoreCase("percentage")){
						loan = grossSalaryUsd * loanDeduction.getDeductionAmount();	
					}else{
						loan = loanDeduction.getDeductionAmount();
					}				
				}
				
				float advancePayment = 0.0f;			
				advancePayment = Advance.getAllAdvancePaymentsForEmployeePaiedDuring(expatTeacherEmployee.getId(),startDate,lastDate);
				float advanceAndLoan = loan + advancePayment;
				
				EmployeeDeduction otherDeduction = EmployeeDeduction.getEmployeeDeductionForThisEmployeeAndType(expatTeacherEmployee.getId(), "Other");
				float other = 0.0f;
				if(otherDeduction != null){
					if(otherDeduction.getDeductionType().equalsIgnoreCase("percentage")){
						other = grossSalaryUsd * otherDeduction.getDeductionAmount();	
					}else{
						other = otherDeduction.getDeductionAmount();
					}				
				}
				
				float foreignCurrencyAmount = 0.0f;
				ConvertedHardCurrency convertedHardCurrency = ConvertedHardCurrency.getMostRecentConvertedHardCurrencyForEmployee(expatTeacherEmployee.getId());
				if(convertedHardCurrency != null){
					foreignCurrencyAmount = convertedHardCurrency.getForeignCurrencyAmount();
				}
				
				EmployeeDeduction creditAssociationDeduction = EmployeeDeduction.getEmployeeDeductionForThisEmployeeAndType(expatTeacherEmployee.getId(), "Credit Association");
				float creditAssociation = 0.0f;
				if(creditAssociationDeduction != null){
					if(creditAssociationDeduction.getDeductionType().equalsIgnoreCase("percentage")){
						creditAssociation = grossSalaryUsd * creditAssociationDeduction.getDeductionAmount();	
					}else{
						creditAssociation = creditAssociationDeduction.getDeductionAmount();
					}				
				}
				
				RetainedWithSchool retainedWithSchool = RetainedWithSchool.getRetainedWithSchoolForThisEmployee(expatTeacherEmployee.getId());
				float retainedWithSchoolAmount = 0.0f;
				if(retainedWithSchool != null){
					retainedWithSchoolAmount = (salary != null ? salary.getUsdAmount() : 0.0f) * retainedWithSchool.getPercentValue();
				}
				
				EmployeeDeduction telAndElectDeduction = EmployeeDeduction.getEmployeeDeductionForThisEmployeeAndType(expatTeacherEmployee.getId(),"Telephone and Electricity");
				float telAndElect = 0.0f;
				if(telAndElectDeduction != null){
					if(telAndElectDeduction.getDeductionType().equalsIgnoreCase("percentage")){
						telAndElect = (salary != null ? salary.getUsdAmount() : 0.0f) * telAndElectDeduction.getDeductionAmount();
					}else{
						telAndElect = telAndElectDeduction.getDeductionAmount();
					}
				}
				
							
				float totalDeduction = advanceAndLoan + retainedWithSchoolAmount + telAndElect + foreignCurrencyAmount;
				float netPay = grossSalaryUsd - totalDeduction;
				//now define the control names in here...
				String employeeIdControlName = "employeeId" + ctr;
				String basicSalaryUsdControlName = "basicSalaryUsd" + ctr;
				String responsibilityAllowanceUsdControlName = "responsibilityAllowanceUsd" + ctr;
				String grossSalaryUsdControlName = "grossSalaryUsd" + ctr;			
				String convertedHrdCurrencyControlName = "convertedHrdCurrency" + ctr;
				String advanceAndLoansControlName = "advanceAndLoans" + ctr;
				String retainedWithSchoolControlName = "retainedWithSchool" + ctr;
				String telAndFaxElectControlName = "telAndFaxElect" + ctr;
				String totalDeductionsControlName = "totalDeductions" + ctr;
				String netPayControlName = "netPay" + ctr;			
				%>
					<tr>
						<td><%=ctr++ %></td>
						<td><%=fullName %><input type="hidden" name="<%=employeeIdControlName %>" id="<%=employeeIdControlName %>" value="<%=expatTeacherEmployee.getId() %>"/></td>
						<td><%=twoDigit.format(basicSalaryUsd) %><input type="hidden" name="<%=basicSalaryUsdControlName %>" id="<%=basicSalaryUsdControlName %>" value="<%=twoDigit.format(basicSalaryUsd) %>"/></td>
						<td><%=twoDigit.format(responsibilityUsd) %><input type="hidden" name="<%=responsibilityAllowanceUsdControlName %>" id="<%=responsibilityAllowanceUsdControlName %>" value="<%=twoDigit.format(responsibilityUsd) %>"/></td>
						<td><%=twoDigit.format(grossSalaryUsd) %><input type="hidden" name="<%=grossSalaryUsdControlName %>" id="<%=grossSalaryUsdControlName %>" value="<%=grossSalaryUsd %>"/></td>					
						<td><%=twoDigit.format(foreignCurrencyAmount) %>
							<a href="#.jsp" onclick="showAddConvertedHardCurrencyFormForThisEmployee(<%=expatTeacherEmployee.getId() %>,'<%=datePrepared%>','<%=payrollMonth%>');">+</a>
							<input type="hidden" name="<%=convertedHrdCurrencyControlName %>" id="<%=convertedHrdCurrencyControlName %>" value="<%=twoDigit.format(foreignCurrencyAmount) %>"/>
							<%
								String divId = "convertedHrdCurrencyDiv" + expatTeacherEmployee.getId();
							%>
							<div id="<%=divId %>"></div>
						</td>
						<td><%=twoDigit.format(advanceAndLoan) %><input type="hidden" name="<%=advanceAndLoansControlName %>" id="<%=advanceAndLoansControlName %>" value="<%=twoDigit.format(advanceAndLoan) %>"/></td>
						
						<td><%=twoDigit.format(retainedWithSchoolAmount) %><input type="hidden" name="<%=retainedWithSchoolControlName %>" id="<%=retainedWithSchoolControlName %>" value="<%=twoDigit.format(retainedWithSchoolAmount) %>"/></td>
						<td><%=twoDigit.format(telAndElect) %><input type="hidden" name="<%=telAndFaxElectControlName %>" id="<%=telAndFaxElectControlName %>" value="<%=twoDigit.format(telAndElect) %>"/></td>
						<td><%=twoDigit.format(totalDeduction) %><input type="hidden" name="<%=totalDeductionsControlName %>" id="<%=totalDeductionsControlName %>" value="<%=twoDigit.format(totalDeduction) %>"/></td>
						<td><%=twoDigit.format(netPay) %><input type="hidden" name="<%=netPayControlName %>" id="<%=netPayControlName %>" value="<%=twoDigit.format(netPay) %>"/></td>					
					</tr>
				<%
				totalBasicSalary += basicSalaryUsd;
				totalResponsibilityAllowance += responsibilityUsd;
				totalGrossSalary += grossSalaryUsd;
				totalConvertedHrdCurrency += foreignCurrencyAmount;
				totalAdvanceAndLoans += advanceAndLoan;
				totalRetainedWithSchool += retainedWithSchoolAmount;
				totalTelFaxAndElect += telAndElect;
				totalDeductionsAmount += totalDeduction;
				totalNetPay += netPay;
			}//end if salary null checker condition...
		}//end while loop
	%>
	<tr style="background:#eee;font-weight:bolder">
		<td></td>
		<td>Total</td>
		<td><%=twoDigit.format(totalBasicSalary) %></td>
		<td><%=twoDigit.format(totalResponsibilityAllowance) %></td>
		<td><%=twoDigit.format(totalGrossSalary) %></td>
		<td><%=twoDigit.format(totalConvertedHrdCurrency) %></td>
		<td><%=twoDigit.format(totalAdvanceAndLoans) %></td>
		<td><%=twoDigit.format(totalRetainedWithSchool) %></td>
		<td><%=twoDigit.format(totalTelFaxAndElect) %></td>
		<td><%=twoDigit.format(totalDeductionsAmount) %></td>
		<td><%=twoDigit.format(totalNetPay) %></td>		
	</tr>
	<tr>
		<td colspan="11" align="right">
			<input type="button" value="Save" class="input-submit" id="btnsave"/>			
		</td>
	</tr>
</table>
<%
	}else{
%>
	<p class="msg warning">No expatriate employee is found in the database!</p>
<%
	}
%>
<script type="text/javascript">
	function showAddConvertedHardCurrencyFormForThisEmployee(employeeId,datePrepared,payrollMonth){
		var divId = "convertedHrdCurrencyDiv" + employeeId;
		$('#'+divId).load("showaddconvertedhardcurrencyformforthisemployeeinusd.jsp?employeeId="+
				employeeId+"&datePrepared="+datePrepared+"&payrollMonth="+payrollMonth);
	}

	$(document).ready(function(){
		$('#loadingDiv').hide();
		
		$('#btnsave').click(function(){
			var ctr = "<%=ctr - 1%>";
			var dataString = "";
			var payrollName = "<%=payrollName %>";
			var payrollMonth = "<%=payrollMonth %>";
			var datePrepared = "<%=datePrepared %>";
			
			for(var i=1; i<=ctr;i++){
				//now define the control names in here...
				var employeeIdControlName = "employeeId" + i;
				var basicSalaryUsdControlName = "basicSalaryUsd" + i;
				var responsibilityAllowanceUsdControlName = "responsibilityAllowanceUsd" + i;
				var grossSalaryUsdControlName = "grossSalaryUsd" + i;				
				var convertedIntoBirrControlName = "convertedHrdCurrency" + i;
				var advanceAndLoansControlName = "advanceAndLoans" + i;
				var retainedWithSchoolControlName = "retainedWithSchool" + i;
				var telAndFaxElectControlName = "telAndFaxElect" + i;
				var totalDeductionsControlName = "totalDeductions" + i;
				var netPayControlName = "netPay" + i;
				//now get the values of these controls....
				var employeeId = $('#'+employeeIdControlName).val();
				var basicSalaryUsd = $('#'+basicSalaryUsdControlName).val();
				var responsibilityAllowanceUsd = $('#'+responsibilityAllowanceUsdControlName).val();
				var grossSalaryUsd = $('#'+grossSalaryUsdControlName).val();				
				var convertedIntoBirr = $('#'+convertedIntoBirrControlName).val();
				var advanceAndLoans = $('#'+advanceAndLoansControlName).val();
				var retainedWithSchool = $('#'+retainedWithSchoolControlName).val();
				var telAndFaxElect = $('#'+telAndFaxElectControlName).val();
				var totalDeductions = $('#'+totalDeductionsControlName).val();
				var netPay = $('#'+netPayControlName).val();				
				//now build the dataString object here....
				dataString += "&" + employeeIdControlName +"="+ employeeId +"&"+ basicSalaryUsdControlName +"="+ basicSalaryUsd +"&"+ responsibilityAllowanceUsdControlName +"="+ responsibilityAllowanceUsd +
				"&"+ grossSalaryUsdControlName +"="+ grossSalaryUsd +"&"+ convertedIntoBirrControlName +"="+ convertedIntoBirr +
				"&"+ retainedWithSchoolControlName +"="+ retainedWithSchool +"&"+ telAndFaxElectControlName +"="+ telAndFaxElect +"&"+ totalDeductionsControlName +"="+
				totalDeductions +"&"+ netPayControlName +"="+ netPay + "&" + advanceAndLoansControlName +"="+ advanceAndLoans;
			}//end for...loop
			dataString += "&ctr="+ctr+"&payrollName="+payrollName+"&payrollMonth="+payrollMonth+"&datePrepared="+datePrepared;
			
			$.ajax({
			    url: 'saveexpatriateteacherspayrollsheetusd.jsp',		
			    data: dataString,
			    type:'POST',
			    success:function(response){				    		
			    		$('#tabDetailDiv').load('shownewpayrollform.jsp');					
			    },
			    error:function(error){
					alert(error);
			    }
			});
		});//end button.click function
	});//end document.ready function
</script>