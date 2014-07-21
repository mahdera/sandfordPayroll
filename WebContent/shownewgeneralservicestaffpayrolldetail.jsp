<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.*" %>
<%	
	int payrollMonth = Integer.parseInt(request.getParameter("payrollMonth"));
	String monthName = null;
	DecimalFormat twoDigit = new DecimalFormat("0.00");
	int ctr=1;
	String payrollName = "general_service_staff_payroll_detail";
	
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
	PayrollEmptype payrollEmptype = PayrollEmptype.getPayrollEmptypeForEmployeeType("General Service");
	List<Employee> generalServiceEmployeeList = EmployeePayrollTypeMap.getAllEmployeesOfThisPayrollEmpType(payrollEmptype.getId());
	
	if(!generalServiceEmployeeList.isEmpty()){
%>
<div style="text-align:center;background:lightyellow">
	<h5>SANDFORD INTERNATIONAL SCHOOL<br/>PAYROLL SHEET (GENERAL SERVICE STAFF)<br/>FOR THE MONTH OF <%=monthName %></h5>
</div>
<table border="" width="100%" style="border: 1px solid #2779aa" rules="all">
	<tr style="background:#eee;font-weight:bolder">
		<td colspan="8" align="center">
			Earnings in ETB
		</td>
		<td colspan="9" align="center">
			Deductions
		</td>
		<td></td>
	</tr>
	<tr style="background:#eee;font-weight:bolder">
		<td>No.</td>
		<td>Employee</td>
		<td>Basic Salary</td>
		<td>Overtime</td>
		<td>Retirement / PF-ER Cont</td>
		<td>Allowance / Other</td>
		<td>Gross Salary</td>
		<td>Taxable Income</td>
		<td>Income Tax</td>
		<td>Retirement / PF-ER Cont</td>
		<td>Retirement / PF-EE Cont</td>
		<td>Pension Con.</td>
		<td>Loan/PF Loan</td>
		<td>Other/Advance</td>
		<td>Credit Association</td>
		<td>Labor Union</td>
		<td>Total Deduction</td>
		<td>Net Pay</td>		
	</tr>
	<%
		Iterator<Employee> generalServiceEmployeeItr = generalServiceEmployeeList.iterator();
		//now define the total value holder variables...
		float totalBaiscSalary = 0.0f;
		float totalOvertime = 0.0f;
		float totalPfEr = 0.0f;
		float totalAllowanceOther = 0.0f;
		float totalGrossSalary = 0.0f;
		float totalTaxableIncome = 0.0f;
		float totalIncomeTax = 0.0f;
		float totalPfErDeduction = 0.0f;
		float totalPfEe = 0.0f;
		float totalPension = 0.0f;
		float totalLoan = 0.0f;
		float totalOtherDeductions = 0.0f;
		float totalCreditAssociation = 0.0f;
		float totalLaborUnion = 0.0f;
		float totalDeductionAmount = 0.0f;
		float totalNetPay = 0.0f;
		
		while(generalServiceEmployeeItr.hasNext()){
			Employee generalServiceEmployee = generalServiceEmployeeItr.next();
			String fullName = generalServiceEmployee.getFirstName()+" "+generalServiceEmployee.getMiddleName()+" "+generalServiceEmployee.getLastName();
			EmployeeSalary employeeSalary = EmployeeSalary.getEmployeeSalaryForThisEmployee(generalServiceEmployee.getId());
			if(employeeSalary != null){
				Salary salary = Salary.getSalary(employeeSalary.getSalaryId());	
				//now get any absent day information from the database and deduct that...
				float oneDayIncome = salary.getAmount() / 30;
				AbsentDayInformation absentDayInformation = AbsentDayInformation.getAbsentDayInformationForEmployeeDuringThisYearAndMonth(generalServiceEmployee.getId(),year,payrollMonth);
				float basicSalaryAfterLeaveInfo = salary.getAmount();
				if(absentDayInformation != null){
					basicSalaryAfterLeaveInfo = salary.getAmount() - (oneDayIncome * absentDayInformation.getNumberOfDaysToBeDeducted());
				}
				float employeeOvertimeSum = EmployeeOvertime.getOvertimeSumForThisEmployeeBetweenDates(generalServiceEmployee.getId(),startDate,lastDate);			
				float employeeAllowanceSum = EmployeeAllowance.getEmployeeAllowanceSumForThisEmployee(generalServiceEmployee.getId());
							
				EmployeeDeduction providentFundERDeduction = EmployeeDeduction.getEmployeeDeductionForThisEmployeeAndType(generalServiceEmployee.getId(),"Provident Fund - ER");
				float pfER = 0.0f;
				if(providentFundERDeduction != null){
					if(providentFundERDeduction.getDeductionType().equalsIgnoreCase("Percentage")){
						pfER = salary.getAmount() * providentFundERDeduction.getDeductionAmount();
					}else{
						pfER = providentFundERDeduction.getDeductionAmount();
					}
				}
				
				EmployeeDeduction providentFundEEDeduction = EmployeeDeduction.getEmployeeDeductionForThisEmployeeAndType(generalServiceEmployee.getId(),"Provident Fund - EE");
				float pfEE = 0.0f;
				if(providentFundEEDeduction != null){
					if(providentFundEEDeduction.getDeductionType().equalsIgnoreCase("Percentage")){
						pfEE = salary.getAmount() * providentFundEEDeduction.getDeductionAmount();
					}else{
						pfEE = providentFundEEDeduction.getDeductionAmount();
					}
				}
				
				EmployeeDeduction pensionDeduction = EmployeeDeduction.getEmployeeDeductionForThisEmployeeAndType(generalServiceEmployee.getId(),"Pension");
				float pension = 0.0f;
				if(pensionDeduction != null){
					if(pensionDeduction.getDeductionType().equalsIgnoreCase("Percentage")){
						pension = salary.getAmount() * pensionDeduction.getDeductionAmount();
					}else{
						pension = pensionDeduction.getDeductionAmount();
					}
				}
				
				float loan = EmployeeLoan.getTotalMonthlyPaymentAmountSumForThisEmployee(generalServiceEmployee.getId());
				
				EmployeeDeduction otherDeduction = EmployeeDeduction.getEmployeeDeductionForThisEmployeeAndType(generalServiceEmployee.getId(), "Other");
				float other = 0.0f;
				if(otherDeduction != null){
					if(otherDeduction.getDeductionType().equalsIgnoreCase("Percentage")){
						other = salary.getAmount() * otherDeduction.getDeductionAmount();
					}else{
						other = otherDeduction.getDeductionAmount();
					}
				}
				
				EmployeeDeduction creditAssociationDeduction = EmployeeDeduction.getEmployeeDeductionForThisEmployeeAndType(generalServiceEmployee.getId(), "Credit Association");
				float creditAssociation = 0.0f;
				if(creditAssociationDeduction != null){
					if(creditAssociationDeduction.getDeductionType().equalsIgnoreCase("Percentage")){
						creditAssociation = salary.getAmount() * creditAssociationDeduction.getDeductionAmount();
					}else{
						creditAssociation = creditAssociationDeduction.getDeductionAmount();
					}
				}
				
				EmployeeDeduction laborUnionDeduction = EmployeeDeduction.getEmployeeDeductionForThisEmployeeAndType(generalServiceEmployee.getId(), "Labor Union");
				float laborUnion = 0.0f;
				if(laborUnionDeduction != null){
					if(laborUnionDeduction.getDeductionType().equalsIgnoreCase("Percentage")){
						laborUnion = salary.getAmount() * laborUnionDeduction.getDeductionAmount();
					}else{
						laborUnion = laborUnionDeduction.getDeductionAmount();
					}
				}
				
				EmployeeDeduction pfLoanDeducation = EmployeeDeduction.getEmployeeDeductionForThisEmployeeAndType(generalServiceEmployee.getId(), "PF Loan");
				
				float advancePayment = 0.0f;				
				advancePayment = Advance.getAllAdvancePaymentsForEmployeePaiedDuring(generalServiceEmployee.getId(),startDate,lastDate);
				other += advancePayment;
								
				float grossSalary = basicSalaryAfterLeaveInfo + employeeOvertimeSum + pfER + employeeAllowanceSum;
				float taxableIncome = salary.getAmount() + employeeOvertimeSum + employeeAllowanceSum;
				TaxRate taxRate = TaxRate.getTaxRateForThisBasicSalary(taxableIncome);
				float incomeTax = (taxableIncome * taxRate.getTaxRatePercentage()) - taxRate.getOtherDeduction();
				
				float totalDeduction = incomeTax + pfER + pfEE + pension + loan + other +  creditAssociation + laborUnion;
				
				float netPay = grossSalary - totalDeduction;
				//now define the control names in here...			
				String employeeIdControlName = "employeeId" + ctr;
				String basicSalaryControlName = "basicSalary" + ctr;
				String overtimeControlName = "overtime" + ctr;
				String retirementPfErControlName = "retirementPfEr" + ctr;
				String allowanceControlName = "allowance" + ctr;
				String grossSalaryControlName = "grossSalary" + ctr;
				String taxableIncomeControlName = "taxableIncome" + ctr;
				String incomeTaxControlName = "incomeTax" + ctr;
				String retirementPfErDeductionControlName = "retirementPfErDeduction" + ctr;
				String retirementPfEeControlName = "retirementPfEe" + ctr;
				String pensionControlName = "pension" + ctr;
				String loanPfLoanControlName = "loanPfLoan" + ctr;
				String otherControlName = "other" + ctr;
				String creditAssociationControlName = "creditAssociation" + ctr;
				String laborUnionControlName = "laborUnion" + ctr;
				String totalDeductionControlName = "totalDeduction" + ctr;
				String netPayControlName = "netPay" + ctr;
				String loanControlName = "loan" + ctr;
				%>
					<tr>
						<td><%=ctr++ %></td>
						<td><%=fullName %><input type="hidden" name="<%=employeeIdControlName %>" id="<%=employeeIdControlName %>" value="<%=generalServiceEmployee.getId() %>"/></td>
						<td><%=twoDigit.format(salary.getAmount()) %><input type="hidden" name="<%=basicSalaryControlName %>" id="<%=basicSalaryControlName %>" value="<%=twoDigit.format(salary.getAmount()) %>"/></td>
						<td><%=twoDigit.format(employeeOvertimeSum) %><input type="hidden" name="<%=overtimeControlName %>" id="<%=overtimeControlName %>" value="<%=twoDigit.format(employeeOvertimeSum) %>"/></td>
						<td><%=twoDigit.format(pfER) %><input type="hidden" name="<%=retirementPfErControlName %>" id="<%=retirementPfErControlName %>" value="<%=twoDigit.format(pfER) %>"/></td>
						<td><%=twoDigit.format(employeeAllowanceSum) %><input type="hidden" name="<%=allowanceControlName %>" id="<%=allowanceControlName %>" value="<%=twoDigit.format(employeeAllowanceSum) %>"/></td>
						<td><%=twoDigit.format(grossSalary) %><input type="hidden" name="<%=grossSalaryControlName %>" id="<%=grossSalaryControlName %>" value="<%=twoDigit.format(grossSalary) %>"/></td>
						<td><%=twoDigit.format(taxableIncome) %><input type="hidden" name="<%=taxableIncomeControlName %>" id="<%=taxableIncomeControlName %>" value="<%=twoDigit.format(taxableIncome) %>"/></td>
						
						<td><%=twoDigit.format(incomeTax) %><input type="hidden" name="<%=incomeTaxControlName %>" id="<%=incomeTaxControlName %>" value="<%=twoDigit.format(incomeTax) %>"/></td>
						<td><%=twoDigit.format(pfER) %><input type="hidden" name="<%=retirementPfErDeductionControlName %>" id="<%=retirementPfErDeductionControlName %>" value="<%=twoDigit.format(pfER) %>"/></td>
						<td><%=twoDigit.format(pfEE) %><input type="hidden" name="<%=retirementPfEeControlName %>" id="<%=retirementPfEeControlName %>" value="<%=twoDigit.format(pfEE) %>"/></td>
						<td><%=twoDigit.format(pension) %><input type="hidden" name="<%=pensionControlName %>" id="<%=pensionControlName %>" value="<%=twoDigit.format(pension) %>"/></td>
						<td><%=twoDigit.format(loan) %>
							<input type="hidden" name="<%=loanPfLoanControlName %>" id="<%=loanPfLoanControlName %>" value="<%=twoDigit.format(loan) %>"/>
							<input type="hidden" name="<%=loanControlName %>" id="<%=loanControlName %>" value="<%=loan %>"/>
						</td>
						<td><%=twoDigit.format(other) %><input type="hidden" name="<%=otherControlName %>" id="<%=otherControlName %>" value="<%=twoDigit.format(other) %>"/></td>
						<td><%=twoDigit.format(creditAssociation) %><input type="hidden" name="<%=creditAssociationControlName %>" id="<%=creditAssociationControlName %>" value="<%=twoDigit.format(creditAssociation) %>"/></td>
						<td><%=twoDigit.format(laborUnion) %><input type="hidden" name="<%=laborUnionControlName %>" id="<%=laborUnionControlName %>" value="<%=twoDigit.format(laborUnion) %>"/></td>
						<td><%=twoDigit.format(totalDeduction) %><input type="hidden" name="<%=totalDeductionControlName %>" id="<%=totalDeductionControlName %>" value="<%=twoDigit.format(totalDeduction) %>"/></td>					
						<td><%=twoDigit.format(netPay) %><input type="hidden" name="<%=netPayControlName %>" id="<%=netPayControlName %>" value="<%=twoDigit.format(netPay) %>"/></td>
					</tr>
				<%
				//now do the total calculation in here...
				 totalBaiscSalary += (salary != null ? salary.getAmount() : 0.0f);
				 totalOvertime += employeeOvertimeSum;
				 totalPfEr += pfER;
				 totalAllowanceOther += employeeAllowanceSum;
				 totalGrossSalary += grossSalary;
				 totalTaxableIncome += taxableIncome;
				 totalIncomeTax += incomeTax;
				 totalPfErDeduction += pfER;
				 totalPfEe += pfEE;
				 totalPension += pension;
				 totalLoan += loan;
				 totalOtherDeductions += other;
				 totalCreditAssociation += creditAssociation;
				 totalLaborUnion += laborUnion;
				 totalDeductionAmount += totalDeduction;
				 totalNetPay += netPay;
			}//end employeeSalary checking if condition...
		}//end while loop
	%>
	<tr style="background:#eee;font-weight:bolder">
		<td></td>
		<td>Total</td>
		<td><%=twoDigit.format(totalBaiscSalary) %></td>
		<td><%=twoDigit.format(totalOvertime) %></td>
		<td><%=twoDigit.format(totalPfEr) %></td>
		<td><%=twoDigit.format(totalAllowanceOther) %></td>
		<td><%=twoDigit.format(totalGrossSalary) %></td>
		<td><%=twoDigit.format(totalTaxableIncome) %></td>
		<td><%=twoDigit.format(totalIncomeTax) %></td>
		<td><%=twoDigit.format(totalPfEr) %></td>
		<td><%=twoDigit.format(totalPfEe) %></td>
		<td><%=twoDigit.format(totalPension) %></td>
		<td><%=twoDigit.format(totalLoan) %></td>
		<td><%=twoDigit.format(totalOtherDeductions) %></td>
		<td><%=twoDigit.format(totalCreditAssociation) %></td>
		<td><%=twoDigit.format(totalLaborUnion) %></td>
		<td><%=twoDigit.format(totalDeductionAmount) %></td>
		<td><%=twoDigit.format(totalNetPay) %></td>
	</tr>
	<tr>
		<td colspan="18" align="right">
			<input type="button" value="Save" class="input-submit" id="btnsave"/>			
		</td>
	</tr>
</table>
<%
	}else{
%>
		<p class="msg warning">No general service staff is mapped by the administrator. Please finish mapping payroll employee types first!</p>
<%
	}
%>
<script type="text/javascript">
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
				var basicSalaryControlName = "basicSalary" + i;
				var overtimeControlName = "overtime" + i;
				var retirementPfErControlName = "retirementPfEr" + i;
				var allowanceControlName = "allowance" + i;
				var grossSalaryControlName = "grossSalary" + i;
				var taxableIncomeControlName = "taxableIncome" + i;
				var incomeTaxControlName = "incomeTax" + i;
				var retirementPfErDeductionControlName = "retirementPfErDeduction" + i;
				var retirementPfEeControlName = "retirementPfEe" + i;
				var pensionControlName = "pension" + i;
				var loanPfLoanControlName = "loanPfLoan" + i;
				var otherControlName = "other" + i;
				var creditAssociationControlName = "creditAssociation" + i;
				var laborUnionControlName = "laborUnion" + i;
				var totalDeductionControlName = "totalDeduction" + i;
				var netPayControlName = "netPay" + i;
				var loanControlName = "loan" + i;
				//now get the values of these controls....
				var employeeId = $('#'+employeeIdControlName).val();
				var basicSalary = $('#'+basicSalaryControlName).val();
				var overtime = $('#'+overtimeControlName).val();
				var retirementPfEr = $('#'+retirementPfErControlName).val();
				var allowance = $('#'+allowanceControlName).val();
				var grossSalary = $('#'+grossSalaryControlName).val();
				var taxableIncome = $('#'+taxableIncomeControlName).val();
				var incomeTax = $('#'+incomeTaxControlName).val();
				var retirementPfErDeduction = $('#'+retirementPfErDeductionControlName).val();
				var retirementPfEe = $('#'+retirementPfEeControlName).val();
				var pension = $('#'+pensionControlName).val();
				var loanPfLoan = $('#'+loanPfLoanControlName).val();
				var other = $('#'+otherControlName).val();
				var creditAssociation = $('#'+creditAssociationControlName).val();
				var laborUnion = $('#'+laborUnionControlName).val();
				var totalDeduction = $('#'+totalDeductionControlName).val();
				var netPay = $('#'+netPayControlName).val();			
				var loan = $('#'+loanControlName).val();
				//now build the dataString object here....
				dataString += "&" + employeeIdControlName +"="+ employeeId +"&"+ basicSalaryControlName +"="+ basicSalary +"&"+ overtimeControlName +"="+ overtime +
				"&"+ retirementPfErControlName +"="+ retirementPfEr +"&"+ allowanceControlName +"="+ allowance +"&"+ grossSalaryControlName +"="+ grossSalary +
				"&"+ taxableIncomeControlName +"="+ taxableIncome +"&"+ incomeTaxControlName +"="+ incomeTax +"&"+ retirementPfErDeductionControlName +"="+
				retirementPfErDeduction +"&"+ retirementPfEeControlName +"="+ retirementPfEe +"&"+ pensionControlName +"="+ pension +
				"&"+ loanPfLoanControlName +"="+ loanPfLoan +"&"+ otherControlName +"="+ other +"&"+ creditAssociationControlName +"="+ creditAssociation +
				"&"+ laborUnionControlName +"="+ laborUnion +"&"+ totalDeductionControlName +"="+ totalDeduction +"&"+ netPayControlName +"="+ netPay +
				"&"+ loanControlName +"="+ loan;
			}//end for...loop
			dataString += "&ctr="+ctr+"&payrollName="+payrollName+"&payrollMonth="+payrollMonth+"&datePrepared="+datePrepared;
			
			$.ajax({
			    url: 'savegeneralservicestaffpayrollsheet.jsp',		
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