<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.*" %>
<%	
	int payrollMonth = Integer.parseInt(request.getParameter("payrollMonth"));
	String monthName = null;
	int ctr=1;
	String payrollName = "expatriate_teachers_etb_payroll_detail";
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
<div style="text-align:center;background:lightyellow">
	<h5>SANDFORD INTERNATIONAL SCHOOL<br/>PAYROLL SHEET (EXPATRIATE TEACHERS ETB SALARY)<br/>FOR THE MONTH OF <%=monthName %></h5>
</div>
<table border="" width="100%" style="border: 1px solid #2779aa" rules="all">
	<tr style="background:#eee;font-weight:bolder">
		<td colspan="7" align="center">
			USD
		</td>
		<td colspan="10" align="center">
			ETB
		</td>
		<td colspan="4"></td>
	</tr>
	<tr style="background:#eee;font-weight:bold">
		<td>#</td>
		<td>Employee</td>
		<td>Basic Salary</td>
		<td>Respo Allow.</td>
		<td>Gross Salary</td>
		<td>Ex. Rate</td>
		<td>Total in Birr</td>
		<td>Basic Salary</td>
		<td>Respo Allow.	</td>
		<td>Conv Hrd Curr.</td>
		<td>House Rent Allow.</td>		
		<td>Gross Salary</td>
		<td>Grand in Birr</td>
		<td>Adv./ Loans</td>
		<td>House Rent Deduct.</td>
		<td>Taxable Income.</td>
		<td>Income Tax</td>
		<td>Tel. & Elect.</td>
		<td>Total Dedn.</td>
		<td>Net Pay</td>		
	</tr>
	<%
		Iterator<Employee> expatTeachersEmployeeItr = expatTeachersEmployeeList.iterator();
		//now define the total value holders...
		float totalBasicSalaryUsd = 0.0f;
		float totalResponsibilityAllowanceUsd = 0.0f;
		float totalgrossSalaryUsd = 0.0f;
		float totalAmountInBirr = 0.0f;
		float totalBasicSalaryEtb = 0.0f;
		float totalResponsibilityAllowanceEtb = 0.0f;
		float totalConvertedHardCurrency = 0.0f;
		float totalHouseRentAllowance = 0.0f;
		float totalGrossSalaryEtb = 0.0f;
		float totalGrandInBirr = 0.0f;
		float totalAdvanceAndLoans = 0.0f;
		float totalHouseRentDeductions = 0.0f;
		float totalTaxableIncome = 0.0f;
		float totalIncomeTax = 0.0f;
		float totalTelAndElect = 0.0f;
		float totalDeductionsAmount = 0.0f;
		float totalNetPay = 0.0f;
		float totalGratuity = 0.0f;
		float totalLoan = 0.0f;
		float forExRate = 0.0f;
		
		while(expatTeachersEmployeeItr.hasNext()){
			Employee expatTeacherEmployee = expatTeachersEmployeeItr.next();
			String fullName = expatTeacherEmployee.getFirstName()+" "+expatTeacherEmployee.getLastName();
			EmployeeSalary employeeSalary = EmployeeSalary.getEmployeeSalaryForThisEmployee(expatTeacherEmployee.getId());
			SalaryInternational salary = SalaryInternational.getSalary((employeeSalary != null ? employeeSalary.getSalaryId() : 0));
			if(salary != null){			
				float employeeOvertimeSum = EmployeeOvertime.getOvertimeSumForThisEmployeeBetweenDates(expatTeacherEmployee.getId(),startDate,lastDate);
				float employeeAllowanceSum = EmployeeAllowance.getEmployeeAllowanceSumForThisEmployee(expatTeacherEmployee.getId());
				float employeeRetirementPFERSum = 0.0f;
				float basicSalaryUsd = (salary != null ? salary.getUsdAmount() : 0.0f);
				//now get any absent day information from the database and deduct that...
				float oneDayIncomeUsd = salary.getUsdAmount() / 30;
				AbsentDayInformation absentDayInformation = AbsentDayInformation.getAbsentDayInformationForEmployeeDuringThisYearAndMonth(expatTeacherEmployee.getId(),year,payrollMonth);
				float basicSalaryAfterLeaveInfoUsd = salary.getUsdAmount();
				if(absentDayInformation != null){
					basicSalaryAfterLeaveInfoUsd = salary.getUsdAmount() - (oneDayIncomeUsd * absentDayInformation.getNumberOfDaysToBeDeducted());
				}
				
				EmployeeAllowance responsibilityAllowanceUsd = EmployeeAllowance.getEmployeeAllowanceForThisEmployeeAndType(expatTeacherEmployee.getId(), "Responsibility Allowance USD");
				float responsibilityUsd = 0.0f;
				if(responsibilityAllowanceUsd != null){
					responsibilityUsd = responsibilityAllowanceUsd.getAllowanceAmount();
				}
				
				float grossSalaryUsd = basicSalaryAfterLeaveInfoUsd + responsibilityUsd;
				ForeignCurrencyExchangeRate forEx = ForeignCurrencyExchangeRate.getForeignCurrencyExchangeRateForCurrency("1 USD");
				forExRate = forEx.getEtbEquivalentAmount();
				float totalInBirr = grossSalaryUsd * forExRate;
				float basicSalaryEtb = (salary != null ? salary.getEtbAmount() : 0.0f);
				//now get any absent day information from the database and deduct that...
				float oneDayIncomeEtb = salary.getEtbAmount() / 30;
				AbsentDayInformation absentDayInformationEtb = AbsentDayInformation.getAbsentDayInformationForEmployeeDuringThisYearAndMonth(expatTeacherEmployee.getId(),year,payrollMonth);
				float basicSalaryAfterLeaveInfoEtb = salary.getEtbAmount();
				if(absentDayInformationEtb != null){
					basicSalaryAfterLeaveInfoEtb = salary.getUsdAmount() - (oneDayIncomeEtb * absentDayInformation.getNumberOfDaysToBeDeducted());
				}
				
				EmployeeAllowance responsibilityAllowanceEtb = EmployeeAllowance.getEmployeeAllowanceForThisEmployeeAndType(expatTeacherEmployee.getId(), "Responsibility Allowance");
				float responsibilityEtb = 0.0f;
				if(responsibilityAllowanceEtb != null){
					responsibilityEtb = responsibilityAllowanceEtb.getAllowanceAmount();
				}
				float convertedHardCurrencyAmount = 0.0f;
				ConvertedHardCurrency convertedHardCurrency = ConvertedHardCurrency.getMostRecentConvertedHardCurrencyForEmployee(expatTeacherEmployee.getId());
				if(convertedHardCurrency != null){
					convertedHardCurrencyAmount = convertedHardCurrency.getConvHrdCurrencyAmount();
				}
				
				EmployeeAllowance houseRentAllowance = EmployeeAllowance.getEmployeeAllowanceForThisEmployeeAndType(expatTeacherEmployee.getId(), "Housing Allowance");
				float houseRent = 0.0f;
				if(houseRentAllowance != null){
					houseRent = houseRentAllowance.getAllowanceAmount();
				}
				float grossSalaryEtb = basicSalaryAfterLeaveInfoEtb + responsibilityEtb + houseRent;
				float grandInBirr = totalInBirr + grossSalaryEtb;
				float loan = EmployeeLoan.getTotalMonthlyPaymentAmountSumForThisEmployee(expatTeacherEmployee.getId());
				float advancePayment = 0.0f;		
				advancePayment = Advance.getAllAdvancePaymentsForEmployeePaiedDuring(expatTeacherEmployee.getId(),startDate,lastDate);
				float advanceAndLoans = advancePayment + loan;
				
				
				float taxableIncome = totalInBirr + basicSalaryAfterLeaveInfoEtb + responsibilityEtb + houseRent;
				TaxRate taxRate = TaxRate.getTaxRateForThisBasicSalary(taxableIncome);
				float toBeAdded = (taxableIncome * taxRate.getTaxRatePercentage()) - taxRate.getOtherDeduction();
				float grandTaxableIncome = taxableIncome + toBeAdded;			
				taxRate = TaxRate.getTaxRateForThisBasicSalary(grandTaxableIncome);
				float incomeTax = (grandTaxableIncome * taxRate.getTaxRatePercentage()) - taxRate.getOtherDeduction();			
				
				EmployeeDeduction telAndElectDeduction = EmployeeDeduction.getEmployeeDeductionForThisEmployeeAndType(expatTeacherEmployee.getId(),"Telephone and Electricity");
				float telAndElect = 0.0f;
				if(telAndElectDeduction != null){
					if(telAndElectDeduction.getDeductionType().equalsIgnoreCase("percentage")){
						telAndElect = basicSalaryEtb * telAndElectDeduction.getDeductionAmount();
					}else{
						telAndElect = telAndElectDeduction.getDeductionAmount();
					}
				}
							
				float totalDeduction = advanceAndLoans + houseRent + telAndElect;			
						
				float netPay = (grossSalaryEtb - totalDeduction) + convertedHardCurrencyAmount;
				//now define the control names in here...
				String employeeIdControlName = "employeeId" + ctr;
				String basicSalaryUsdControlName = "basicSalaryUsd" + ctr;
				String responsibilityAllowanceUsdControlName = "responsibilityAllowanceUsd" + ctr;
				String grossSalaryUsdControlName = "grossSalaryUsd" + ctr;
				String exchangeRateControlName = "exchangeRate" + ctr;
				String totalInBirrControlName = "totalInBirr" + ctr;
				String basicSalaryEtbControlName = "basicSalaryEtb" + ctr;
				String responsibilityAllowanceEtbControlName = "responsibilityAllowanceEtb" + ctr;
				String convertedHrdCurrencyControlName = "convertedHrdCurrency" + ctr;
				String houseRentAllownaceControlName = "houseRentAllowance" + ctr;
				String grossSalaryEtbControlName = "grossSalaryEtb" + ctr;
				String grandInBirrControlName = "grandInBirr" + ctr;
				String advanceAndLoansControlName = "advanceAndLoans" + ctr;
				String houseRentDeductionsControlName = "houseRentDeductions" + ctr;
				String taxableIncomeControlName = "taxableIncome" + ctr;
				String incomeTaxControlName = "incomeTax" + ctr;
				String telAndElectControlName = "telAndElect" + ctr;
				String totalDeductionsControlName = "totalDeductions" + ctr;
				String netPayControlName = "netPay" + ctr;
				String gratuityControlName = "gratuity" + ctr;
				String loanControlName = "loan" + ctr;			
				%>
					<tr>
						<td><%=ctr++ %></td>
						<td><%=fullName %><input type="hidden" name="<%=employeeIdControlName %>" id="<%=employeeIdControlName %>" value="<%=expatTeacherEmployee.getId() %>"/></td>
						<td><%=twoDigit.format(basicSalaryUsd) %><input type="hidden" name="<%=basicSalaryUsdControlName %>" id="<%=basicSalaryUsdControlName %>" value="<%=twoDigit.format(basicSalaryUsd) %>"/></td>
						<td><%=twoDigit.format(responsibilityUsd) %><input type="hidden" name="<%=responsibilityAllowanceUsdControlName %>" id="<%=responsibilityAllowanceUsdControlName %>" value="<%=twoDigit.format(responsibilityUsd) %>"/></td>
						<td><%=twoDigit.format(grossSalaryUsd) %><input type="hidden" name="<%=grossSalaryUsdControlName %>" id="<%=grossSalaryUsdControlName %>" value="<%=grossSalaryUsd %>"/></td>
						<td><%=twoDigit.format(forExRate) %><input type="hidden" name="<%=exchangeRateControlName %>" id="<%=exchangeRateControlName %>" value="<%=twoDigit.format(forExRate) %>"/></td>
						<td><%=twoDigit.format(totalInBirr) %><input type="hidden" name="<%=totalInBirrControlName %>" id="<%=totalInBirrControlName %>" value="<%=twoDigit.format(totalInBirr) %>"/></td>
						
						<td><%=twoDigit.format(basicSalaryEtb) %><input type="hidden" name="<%=basicSalaryEtbControlName %>" id="<%=basicSalaryEtbControlName %>" value="<%=twoDigit.format(basicSalaryEtb) %>"/></td>
						<td><%=twoDigit.format(responsibilityEtb) %><input type="hidden" name="<%=responsibilityAllowanceEtbControlName %>" id="<%=responsibilityAllowanceEtbControlName %>" value="<%=twoDigit.format(responsibilityEtb) %>"/></td>
						<td><%=twoDigit.format(convertedHardCurrencyAmount) %> 
							<a href="#.jsp" onclick="showAddConvertedHardCurrencyFormForThisEmployee(<%=expatTeacherEmployee.getId() %>,'<%=datePrepared%>','<%=payrollMonth%>');">+</a>
							<input type="hidden" name="<%=convertedHrdCurrencyControlName %>" id="<%=convertedHrdCurrencyControlName %>" value="<%=twoDigit.format(convertedHardCurrencyAmount) %>"/>
							<%
								String divId = "convertedHrdCurrencyDiv" + expatTeacherEmployee.getId();
							%>
							<div id="<%=divId %>"></div>
						</td>
						<td><%=twoDigit.format(houseRent) %><input type="hidden" name="<%=houseRentAllownaceControlName %>" id="<%=houseRentAllownaceControlName %>" value="<%=twoDigit.format(houseRent) %>"/></td>					
						<td><%=twoDigit.format(grossSalaryEtb) %><input type="hidden" name="<%=grossSalaryEtbControlName %>" id="<%=grossSalaryEtbControlName %>" value="<%=twoDigit.format(grossSalaryEtb) %>"/></td>
						<td><%=twoDigit.format(grandInBirr) %><input type="hidden" name="<%=grandInBirrControlName %>" id="<%=grandInBirrControlName %>" value="<%=twoDigit.format(grandInBirr) %>"/></td>
						<td><%=twoDigit.format(advanceAndLoans) %>
							<input type="hidden" name="<%=advanceAndLoansControlName %>" id="<%=advanceAndLoansControlName %>" value="<%=twoDigit.format(advanceAndLoans) %>"/>
							<input type="hidden" name="<%=loanControlName %>" id="<%=loanControlName %>" value="<%=loan %>"/>
						</td>
						<td><%=twoDigit.format(houseRent) %><input type="hidden" name="<%=houseRentDeductionsControlName %>" id="<%=houseRentDeductionsControlName %>" value="<%=twoDigit.format(houseRent) %>"/></td>
						<td><%=twoDigit.format(taxableIncome) %><input type="hidden" name="<%=taxableIncomeControlName %>" id="<%=taxableIncomeControlName %>" value="<%=twoDigit.format(taxableIncome) %>"/></td>
						<td><%=twoDigit.format(incomeTax) %><input type="hidden" name="<%=incomeTaxControlName %>" id="<%=incomeTaxControlName %>" value="<%=twoDigit.format(incomeTax) %>"/></td>
						<td><%=twoDigit.format(telAndElect) %><input type="hidden" name="<%=telAndElectControlName %>" id="<%=telAndElectControlName %>" value="<%=twoDigit.format(telAndElect) %>"/></td>
						<td><%=twoDigit.format(totalDeduction) %><input type="hidden" name="<%=totalDeductionsControlName %>" id="<%=totalDeductionsControlName %>" value="<%=twoDigit.format(totalDeduction) %>"/></td>
						<td><%=twoDigit.format(netPay) %><input type="hidden" name="<%=netPayControlName %>" id="<%=netPayControlName %>" value="<%=twoDigit.format(netPay) %>"/></td>
					</tr>
				<%
				//now do the grand total calcualtion here...
				totalBasicSalaryUsd += basicSalaryUsd;
				totalResponsibilityAllowanceUsd += responsibilityUsd;
				totalgrossSalaryUsd += grossSalaryUsd;
				totalAmountInBirr += totalInBirr;
				totalBasicSalaryEtb += basicSalaryEtb;
				totalResponsibilityAllowanceEtb += responsibilityEtb;
				totalConvertedHardCurrency += convertedHardCurrencyAmount;
				totalHouseRentAllowance += (houseRentAllowance != null ? houseRentAllowance.getAllowanceAmount() : 0.0f);			
				totalGrossSalaryEtb += grossSalaryEtb;
				totalGrandInBirr += grandInBirr;
				totalAdvanceAndLoans += advanceAndLoans;
				totalHouseRentDeductions += houseRent;
				totalTaxableIncome += taxableIncome;
				totalIncomeTax += incomeTax;
				totalTelAndElect += telAndElect;
				totalDeductionsAmount += totalDeduction;
				totalNetPay += netPay;
			}//end if salary null checker condition...
		}//end while loop
	%>
	<tr style="background:#eee;font-weight:bolder">
		<td></td>
		<td>Total</td>
		<td><%=twoDigit.format(totalBasicSalaryUsd) %></td>
		<td><%=twoDigit.format(totalResponsibilityAllowanceUsd) %></td>
		<td><%=twoDigit.format(totalgrossSalaryUsd) %></td>
		<td><%=twoDigit.format(forExRate) %></td>
		<td><%=twoDigit.format(totalAmountInBirr) %></td>
		<td><%=twoDigit.format(totalBasicSalaryEtb) %></td>
		<td><%=twoDigit.format(totalResponsibilityAllowanceEtb) %></td>
		<td><%=twoDigit.format(totalConvertedHardCurrency) %></td>
		<td><%=twoDigit.format(totalHouseRentAllowance) %></td>		
		<td><%=twoDigit.format(totalGrossSalaryEtb) %></td>
		<td><%=twoDigit.format(totalGrandInBirr) %></td>
		<td><%=twoDigit.format(totalAdvanceAndLoans) %></td>
		<td><%=twoDigit.format(totalHouseRentDeductions) %></td>
		<td><%=twoDigit.format(totalTaxableIncome) %></td>
		<td><%=twoDigit.format(totalIncomeTax) %></td>
		<td><%=twoDigit.format(totalTelAndElect) %></td>
		<td><%=twoDigit.format(totalDeductionsAmount) %></td>
		<td><%=twoDigit.format(totalNetPay) %></td>
	</tr>
	<tr>
		<td colspan="21" align="right">
			<input type="button" value="Save" class="input-submit" id="btnsave"/>			
		</td>
	</tr>
</table>
<%
	}else{
%>
	<p class="msg warning">No national employee is found in the database!</p>
<%
	}
%>
<script type="text/javascript">
	function showAddConvertedHardCurrencyFormForThisEmployee(employeeId,datePrepared,payrollMonth){
		var divId = "convertedHrdCurrencyDiv" + employeeId;
		$('#'+divId).load("showaddconvertedhardcurrencyformforthisemployee.jsp?employeeId="+
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
				var exchangeRateControlName = "exchangeRate" + i;
				var totalInBirrControlName = "totalInBirr" + i;
				var basicSalaryEtbControlName = "basicSalaryEtb" + i;
				var responsibilityAllowanceEtbControlName = "responsibilityAllowanceEtb" + i;
				var convertedHrdCurrencyControlName = "convertedHrdCurrency" + i;
				var houseRentAllownaceControlName = "houseRentAllowance" + i;
				var grossSalaryEtbControlName = "grossSalaryEtb" + i;
				var grandInBirrControlName = "grandInBirr" + i;
				var advanceAndLoansControlName = "advanceAndLoans" + i;
				var houseRentDeductionsControlName = "houseRentDeductions" + i;
				var taxableIncomeControlName = "taxableIncome" + i;
				var incomeTaxControlName = "incomeTax" + i;
				var telAndElectControlName = "telAndElect" + i;
				var totalDeductionsControlName = "totalDeductions" + i;
				var netPayControlName = "netPay" + i;
				var loanControlName = "loan" + i;
				var gratuityControlName = "gratuity" + i;
				//now get the values of these controls....
				var employeeId = $('#'+employeeIdControlName).val();
				var basicSalaryUsd = $('#'+basicSalaryUsdControlName).val();
				var responsibilityAllowanceUsd = $('#'+responsibilityAllowanceUsdControlName).val();
				var grossSalaryUsd = $('#'+grossSalaryUsdControlName).val();
				var exchangeRate = $('#'+exchangeRateControlName).val();
				var totalInBirr = $('#'+totalInBirrControlName).val();
				var basicSalaryEtb = $('#'+basicSalaryEtbControlName).val();
				var responsibilityAllowanceEtb = $('#'+responsibilityAllowanceEtbControlName).val();
				var convertedHrdCurrency = $('#'+convertedHrdCurrencyControlName).val();
				var houseRentAllowance = $('#'+houseRentAllownaceControlName).val();
				var grossSalaryEtb = $('#'+grossSalaryEtbControlName).val();
				var grandInBirr = $('#'+grandInBirrControlName).val();
				var advanceAndLoans = $('#'+advanceAndLoansControlName).val();
				var houseRentDeductions = $('#'+houseRentDeductionsControlName).val();
				var taxableIncome = $('#'+taxableIncomeControlName).val();
				var incomeTax = $('#'+incomeTaxControlName).val();
				var telAndElect = $('#'+telAndElectControlName).val();
				var totalDeductions = $('#'+totalDeductionsControlName).val();
				var netPay = $('#'+netPayControlName).val();
				var loan = $('#'+loanControlName).val();
				var gratuity = $('#'+gratuityControlName).val();
				//now build the dataString object here....
				dataString += "&" + employeeIdControlName +"="+ employeeId +"&"+ basicSalaryUsdControlName +"="+ basicSalaryUsd +"&"+ responsibilityAllowanceUsdControlName +"="+ responsibilityAllowanceUsd +
				"&"+ grossSalaryUsdControlName +"="+ grossSalaryUsd +"&"+ exchangeRateControlName +"="+ exchangeRate +"&"+ totalInBirrControlName +"="+ totalInBirr +
				"&"+ basicSalaryEtbControlName +"="+ basicSalaryEtb +"&"+ responsibilityAllowanceEtbControlName +"="+ responsibilityAllowanceEtb +"&"+ convertedHrdCurrencyControlName +"="+
				convertedHrdCurrency +"&"+ houseRentAllownaceControlName +"="+ houseRentAllowance +"&"+ grossSalaryEtbControlName +"="+ grossSalaryEtb +
				"&"+ grandInBirrControlName +"="+ grandInBirr +"&"+ advanceAndLoansControlName +"="+ advanceAndLoans +"&"+ houseRentDeductionsControlName +"="+ houseRentDeductions +
				"&"+ taxableIncomeControlName +"="+ taxableIncome +"&"+ incomeTaxControlName +"="+ incomeTax +"&"+ telAndElectControlName +"="+ telAndElect +"&"+ 
				totalDeductionsControlName +"="+ totalDeductions +"&"+ netPayControlName +"="+ netPay+
				"&"+ loanControlName +"="+ loan + "&" + gratuityControlName +"="+ gratuity;
			}//end for...loop
			dataString += "&ctr="+ctr+"&payrollName="+payrollName+"&payrollMonth="+payrollMonth+"&datePrepared="+datePrepared;
			
			$.ajax({
			    url: 'saveexpatriateteacherspayrollsheet.jsp',		
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