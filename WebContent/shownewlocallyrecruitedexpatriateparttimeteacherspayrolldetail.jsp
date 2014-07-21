<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.*" %>
<%	
	int payrollMonth = Integer.parseInt(request.getParameter("payrollMonth"));
	String monthName = null;
	int ctr=1;
	String payrollName = "locally_recruited_expatriate_partime_teachers_payroll_detail";
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
	PayrollEmptype payrollEmptype = PayrollEmptype.getPayrollEmptypeForEmployeeType("Locally Recruited Expatriate Parttime Teacher");
	List<Employee> locallyRecruitedExpatParttimeEmployeeList = EmployeePayrollTypeMap.getAllEmployeesOfThisPayrollEmpType(payrollEmptype.getId());
	
	if(!locallyRecruitedExpatParttimeEmployeeList.isEmpty()){
%>
<div style="text-align:center;background:lightyellow">
	<h5>SANDFORD INTERNATIONAL SCHOOL<br/>PAYROLL SHEET (LOCALLY RECRUITED EXPATRIATES AND PARTTIME TEACHERS)<br/>FOR THE MONTH OF <%=monthName %></h5>
</div>
<table border="" width="100%" style="border: 1px solid #2779aa" rules="all">
	<tr style="background:#eee;font-weight:bolder">
		<td></td>
		<td colspan="6">
			Earnings
		</td>
		<td colspan="7">
			Deductions
		</td>
		<td></td>
	</tr>
	<tr style="background:#eee;font-weight:bolder">
		<td>No.</td>
		<td>Employee</td>
		<td>Basic Salary</td>
		<td>Provident Fund</td>		
		<td>Transportation Allowance</td>
		<td>Responsibility Allowance</td>		
		<td>Gross Salary</td>
		<td>Income Tax Exp.</td>
		<td>Advance & Loans</td>		
		<td>Other Deductions</td>
		<td>Income Tax</td>
		<td>Tel & Fax</td>
		<td>Retained with School</td>		
		<td>Total Deduction</td>		
		<td>Net Pay</td>
	</tr>
	<%
		Iterator<Employee> locallyRecruitedExpatParttimeEmployeeItr = locallyRecruitedExpatParttimeEmployeeList.iterator();
		//now define the total value holder variables...
		float totalBasicSalary = 0.0f;
		float totalProvidentFund = 0.0f;
		float totalTransportationAllowance = 0.0f;
		float totalResponsibilityAllowance = 0.0f;
		float totalGrossSalary = 0.0f;
		float totalIncomeTaxExp = 0.0f;
		float totalAdvanceAndLoans = 0.0f;
		float totalOtherDeductions = 0.0f;
		float totalIncomeTax = 0.0f;
		float totalTelAndFax = 0.0f;
		float totalRetainedWithSchool = 0.0f;
		float totalDeductionAmount = 0.0f;
		float totalNetPay = 0.0f;
		
		while(locallyRecruitedExpatParttimeEmployeeItr.hasNext()){
			Employee locallyRecruitedExpatParttimeEmployee = locallyRecruitedExpatParttimeEmployeeItr.next();
			String fullName = locallyRecruitedExpatParttimeEmployee.getFirstName()+" "+locallyRecruitedExpatParttimeEmployee.getMiddleName()+" "+locallyRecruitedExpatParttimeEmployee.getLastName();
			//passed
			EmployeeSalary employeeSalary = EmployeeSalary.getEmployeeSalaryForThisEmployee(locallyRecruitedExpatParttimeEmployee.getId());
			if(employeeSalary != null){			
				
				SalaryInternational salary = SalaryInternational.getSalary((employeeSalary != null ? employeeSalary.getSalaryId() : 0));
				//now get any absent day information from the database and deduct that...
				float oneDayIncome = salary.getEtbAmount() / 30;
				AbsentDayInformation absentDayInformation = AbsentDayInformation.getAbsentDayInformationForEmployeeDuringThisYearAndMonth(locallyRecruitedExpatParttimeEmployee.getId(),year,payrollMonth);
				float basicSalaryAfterLeaveInfo = salary.getEtbAmount();
				//System.out.println("absent day info : "+absentDayInformation);
				if(absentDayInformation != null){
					basicSalaryAfterLeaveInfo = salary.getEtbAmount() - (oneDayIncome * absentDayInformation.getNumberOfDaysToBeDeducted());
				}
				
				EmployeeAllowance transportationAllowance = EmployeeAllowance.getEmployeeAllowanceForThisEmployeeAndType(locallyRecruitedExpatParttimeEmployee.getId(),"Transportation Allowance");
				float transportation = 0.0f;
				if(transportationAllowance != null){					
					transportation = transportationAllowance.getAllowanceAmount();
				}
				
				EmployeeAllowance providentFundAllowance = EmployeeAllowance.getEmployeeAllowanceForThisEmployeeAndType(locallyRecruitedExpatParttimeEmployee.getId(), "Provident Fund");
				float providentFund = 0.0f;
				if(providentFundAllowance != null){					
					providentFund = providentFundAllowance.getAllowanceAmount();
				}
				
				EmployeeAllowance responsibilityAllowance = EmployeeAllowance.getEmployeeAllowanceForThisEmployeeAndType(locallyRecruitedExpatParttimeEmployee.getId(),"Responsibility Allowance");
				float responsibility = 0.0f;
				if(responsibilityAllowance != null){
					responsibility = responsibilityAllowance.getAllowanceAmount();
				}			
				
				float grossSalary = (salary != null ? basicSalaryAfterLeaveInfo : 0) + transportation + responsibility + providentFund;
				System.out.println("basic sal after leave info: "+basicSalaryAfterLeaveInfo);
				System.out.println("gross salary: "+grossSalary);
				TaxRate taxRate = TaxRate.getTaxRateForThisBasicSalary(grossSalary);
								
				float toBeAddedToGross = (grossSalary * taxRate.getTaxRatePercentage()) - taxRate.getOtherDeduction();
				float taxableIncome = 0.0f;
				float incomeTaxExp = 0.0f;
				float incomeTax = 0.0f;
				
				WhoIsTaxPayer whoIsTaxPayer = WhoIsTaxPayer.getWhoIsTaxPayerForThisEmployee(locallyRecruitedExpatParttimeEmployee.getId());
				String whoIsTheTaxPayer = "School";
				if(whoIsTaxPayer != null){
					whoIsTheTaxPayer = whoIsTaxPayer.getTaxPayer();
				}
				
				if(whoIsTheTaxPayer.equalsIgnoreCase("school")){
					taxableIncome = (grossSalary + toBeAddedToGross);
					incomeTaxExp = (taxableIncome * taxRate.getTaxRatePercentage()) - taxRate.getOtherDeduction();
				}else{					
					incomeTax = toBeAddedToGross;
				}
				
				
				
				
				RetainedWithSchool retainedWithSchool = RetainedWithSchool.getRetainedWithSchoolForThisEmployee(locallyRecruitedExpatParttimeEmployee.getId());
				float retainedWithSchoolAmount = 0.0f;
				if(retainedWithSchool != null){
					retainedWithSchoolAmount = (salary != null ? salary.getEtbAmount() : 0.0f) * retainedWithSchool.getPercentValue();
				}
				
				EmployeeDeduction pensionDeduction = EmployeeDeduction.getEmployeeDeductionForThisEmployeeAndType(locallyRecruitedExpatParttimeEmployee.getId(),"Pension");
				float pension = 0.0f;
				if(pensionDeduction != null){
					if(pensionDeduction.getDeductionType().equalsIgnoreCase("percentage")){
						pension = grossSalary * pensionDeduction.getDeductionAmount();
					}else{
						pension = pensionDeduction.getDeductionAmount();
					}
				}
				
				float advancePayment = 0.0f;				
				advancePayment = Advance.getAllAdvancePaymentsForEmployeePaiedDuring(locallyRecruitedExpatParttimeEmployee.getId(),startDate,lastDate);
				float loan = EmployeeLoan.getTotalMonthlyPaymentAmountSumForThisEmployee(locallyRecruitedExpatParttimeEmployee.getId());
				float advanceAndLoan = advancePayment + loan;
				
				EmployeeDeduction otherDeduction = EmployeeDeduction.getEmployeeDeductionForThisEmployeeAndType(locallyRecruitedExpatParttimeEmployee.getId(), "Other");
				float other = 0.0f;
				if(otherDeduction != null){
					if(otherDeduction.getDeductionType().equalsIgnoreCase("percentage")){
						other = grossSalary * otherDeduction.getDeductionAmount();
					}else{
						other = otherDeduction.getDeductionAmount();
					}
				}
				
				EmployeeDeduction telAndFaxDeduction = EmployeeDeduction.getEmployeeDeductionForThisEmployeeAndType(locallyRecruitedExpatParttimeEmployee.getId(), "Telephone and Fax");
				float telAndFax = 0.0f;
				if(telAndFaxDeduction != null){
					if(telAndFaxDeduction.getDeductionType().equalsIgnoreCase("percentage")){
						telAndFax = grossSalary * telAndFaxDeduction.getDeductionAmount();
					}else{
						telAndFax = telAndFaxDeduction.getDeductionAmount();
					}
				}
				float totalDeduction = 0.0f;
				if(whoIsTheTaxPayer.equalsIgnoreCase("school")){
					totalDeduction = telAndFax + advanceAndLoan + other + retainedWithSchoolAmount;	
				}else{
					totalDeduction = telAndFax + advanceAndLoan + other + retainedWithSchoolAmount + incomeTax;
				}
				
				float netPay = grossSalary - totalDeduction;
				
				//now define the control names in here...
				String employeeIdControlName = "employeeId" + ctr;
				String basicSalaryControlName = "basicSalary" + ctr;
				String providentFundControlName = "providentFund" + ctr;
				String transportationAllowanceControlName = "transportation" + ctr;
				String responsibilityAllowanceControlName = "responsibilityAllowance" + ctr;
				String grossSalaryControlName = "grossSalary" + ctr;
				String incomeTaxExpControlName = "incomeTaxExp" + ctr;
				String advanceAndLoanControlName = "advanceAndLoans" + ctr;				
				String otherDeductionsControlName = "otherDeductions" + ctr;
				String incomeTaxControlName = "incomeTax" + ctr;
				String retainedWithSchoolControlName = "retainedWithSchool" + ctr;
				String totalDeductionsControlName = "totalDeductions" + ctr;
				String netPayControlName = "netPay" + ctr;
				String telAndFaxControlName = "telAndFax" + ctr;
				String loanControlName = "loan" + ctr;
				%>
					<tr>
						<td><%=ctr++ %></td>
						<td><%=fullName %><input type="hidden" name="<%=employeeIdControlName %>" id="<%=employeeIdControlName %>" value="<%=locallyRecruitedExpatParttimeEmployee.getId() %>"/></td>
						<td><%=twoDigit.format(salary.getEtbAmount())%><input type="hidden" name="<%=basicSalaryControlName %>" id="<%=basicSalaryControlName %>" value="<%=twoDigit.format(salary.getEtbAmount()) %>"/></td>
						<td><%=twoDigit.format(providentFund) %><input type="hidden" name="<%=providentFundControlName %>" id="<%=providentFundControlName %>" value="<%=twoDigit.format(providentFund) %>"/></td>
						<td><%=twoDigit.format(transportation) %><input type="hidden" name="<%=transportationAllowanceControlName %>" id="<%=transportationAllowanceControlName %>" value="<%=twoDigit.format(transportation) %>"/></td>
						<td><%=twoDigit.format(responsibility) %><input type="hidden" name="<%=responsibilityAllowanceControlName %>" id="<%=responsibilityAllowanceControlName %>" value="<%=twoDigit.format(responsibility) %>"/></td>
						<td><%=twoDigit.format(grossSalary) %><input type="hidden" name="<%=grossSalaryControlName %>" id="<%=grossSalaryControlName %>" value="<%=twoDigit.format(grossSalary) %>"/></td>
						<td>
							<%
								if(whoIsTheTaxPayer.equalsIgnoreCase("school")){									
									out.print(twoDigit.format(incomeTaxExp));
									%>										
										<input type="hidden" name="<%=incomeTaxExpControlName %>" id="<%=incomeTaxExpControlName %>" value="<%=twoDigit.format(incomeTaxExp) %>"/>
									<%
								}else{
									incomeTaxExp = 0.0f;
									out.print(twoDigit.format(incomeTaxExp));
									%>
										<input type="hidden" name="<%=incomeTaxExpControlName %>" id="<%=incomeTaxExpControlName %>" value="<%=twoDigit.format(incomeTaxExp) %>"/>	
									<%
								}
							%>
							
						</td>						
						<td><%=twoDigit.format(advanceAndLoan) %>
							<input type="hidden" name="<%=advanceAndLoanControlName %>" id="<%=advanceAndLoanControlName %>" value="<%=twoDigit.format(advanceAndLoan) %>"/>
							<input type="hidden" name="<%=loanControlName %>" id="<%=loanControlName %>" value="<%=loan %>"/>
						</td>
						<td><%=twoDigit.format(other) %><input type="hidden" name="<%=otherDeductionsControlName %>" id="<%=otherDeductionsControlName %>" value="<%=twoDigit.format(other) %>"/></td>
						<td>							
							<%
								if(whoIsTheTaxPayer.equalsIgnoreCase("school")){
									incomeTax = 0.0f;
									out.print(twoDigit.format(incomeTax));
									%>
										<input type="hidden" name="<%=incomeTaxControlName %>" id="<%=incomeTaxControlName %>" value="<%=twoDigit.format(0.0) %>"/>			
									<%
								}else{
									out.print(twoDigit.format(incomeTax));
									%>
										<input type="hidden" name="<%=incomeTaxControlName %>" id="<%=incomeTaxControlName %>" value="<%=twoDigit.format(incomeTax) %>"/>
									<%
								}								 
							%>
						</td>
						<td><%=twoDigit.format(telAndFax) %><input type="hidden" name="<%=telAndFaxControlName %>" id="<%=telAndFaxControlName %>" value="<%=twoDigit.format(telAndFax) %>"/></td>
						<td><%=twoDigit.format(retainedWithSchoolAmount) %><input type="hidden" name="<%=retainedWithSchoolControlName %>" id="<%=retainedWithSchoolControlName %>" value="<%=retainedWithSchoolAmount %>"/></td>
						<td><%=twoDigit.format(totalDeduction) %><input type="hidden" name="<%=totalDeductionsControlName %>" id="<%=totalDeductionsControlName %>" value="<%=twoDigit.format(totalDeduction) %>"/></td>
						<td><%=twoDigit.format(netPay) %><input type="hidden" name="<%=netPayControlName %>" id="<%=netPayControlName %>" value="<%=twoDigit.format(netPay) %>"/></td>					
					</tr>
				<%
			//now do the total value calculation in here...	
			 totalBasicSalary += (salary != null ? salary.getEtbAmount() : 0.0f);
			 totalProvidentFund += providentFund;
			 totalTransportationAllowance += transportation;
			 totalResponsibilityAllowance += responsibility;
			 totalGrossSalary += grossSalary;
			 totalIncomeTaxExp += incomeTaxExp;
			 totalAdvanceAndLoans += advanceAndLoan;
			 totalOtherDeductions += other;
			 totalIncomeTax += incomeTax;
			 totalTelAndFax += telAndFax;
			 totalRetainedWithSchool += retainedWithSchoolAmount;
			 totalDeductionAmount += totalDeduction;
			 totalNetPay += netPay;
			}//end if condition
		}//end while loop		
	%>
	<tr style="background:#eee;font-weight:bolder">
		<td></td>
		<td>Total</td>
		<td><%=twoDigit.format(totalBasicSalary) %></td>
		<td><%=twoDigit.format(totalProvidentFund) %></td>
		<td><%=twoDigit.format(totalTransportationAllowance) %></td>
		<td><%=twoDigit.format(totalResponsibilityAllowance) %></td>
		<td><%=twoDigit.format(totalGrossSalary) %></td>
		<td><%=twoDigit.format(totalIncomeTaxExp) %></td>
		<td><%=twoDigit.format(totalAdvanceAndLoans) %></td>
		<td><%=twoDigit.format(totalOtherDeductions) %></td>
		<td><%=twoDigit.format(totalIncomeTax) %></td>
		<td><%=twoDigit.format(totalTelAndFax) %></td>
		<td><%=twoDigit.format(totalRetainedWithSchool) %></td>
		<td><%=twoDigit.format(totalDeductionAmount) %></td>
		<td><%=twoDigit.format(totalNetPay) %></td>		
	</tr>
	<tr>
		<td colspan="15" align="right">
			<input type="button" value="Save" class="input-submit" id="btnsave"/>			
		</td>
	</tr>
</table>
<%
	}else{
%>
	<p class="msg warning">No locally recruited expatriate and part time employee is found in the database!</p>
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
				var employeeIdControlName = "employeeId" + ctr;
				var basicSalaryControlName = "basicSalary" + ctr;
				var providentFundControlName = "providentFund" + ctr;
				var transportationAllowanceControlName = "transportation" + ctr;
				var responsibilityAllowanceControlName = "responsibilityAllowance" + ctr;
				var grossSalaryControlName = "grossSalary" + ctr;
				var incomeTaxExpControlName = "incomeTaxExp" + ctr;
				var advanceAndLoanControlName = "advanceAndLoans" + ctr;				
				var otherDeductionsControlName = "otherDeductions" + ctr;
				var incomeTaxControlName = "incomeTax" + ctr;
				var retainedWithSchoolControlName = "retainedWithSchool" + ctr;
				var totalDeductionsControlName = "totalDeductions" + ctr;
				var netPayControlName = "netPay" + ctr;
				var telAndFaxControlName = "telAndFax" + ctr;
				var loanControlName = "loan" + ctr;
				//now get the values of these controls....
				var employeeId = $('#'+employeeIdControlName).val();
				var basicSalary = $('#'+basicSalaryControlName).val();
				var providentFund = $('#'+providentFundControlName).val();
				var transportationAllowance = $('#'+transportationAllowanceControlName).val();
				var responsibilityAllowance = $('#'+responsibilityAllowanceControlName).val();				
				var grossSalary = $('#'+grossSalaryControlName).val();
				var incomeTaxExp = $('#'+incomeTaxExpControlName).val();
				var advanceAndLoans = $('#'+advanceAndLoanControlName).val();				
				var otherDeductions = $('#'+otherDeductionsControlName).val();
				var incomeTax = $('#'+incomeTaxControlName).val();
				var telAndFax = $('#'+telAndFaxControlName).val();
				var retainedWithSchool = $('#'+retainedWithSchoolControlName).val();				
				var totalDeduction = $('#'+totalDeductionsControlName).val();
				var netPay = $('#'+netPayControlName).val();
				var loan = $('#'+loanControlName).val();
				//now build the dataString object here....
				dataString += "&" + employeeIdControlName +"="+ employeeId +"&"+ basicSalaryControlName +"="+ basicSalary +"&"+
				"&"+ providentFundControlName +"="+ providentFund +"&"+ grossSalaryControlName +"="+ grossSalary +
				"&"+ responsibilityAllowanceControlName +"="+ responsibilityAllowance +"&"+ incomeTaxExpControlName +"="+ incomeTaxExp +"&"+ advanceAndLoanControlName +"="+
				advanceAndLoans +"&"+ transportationAllowanceControlName +"="+ transportationAllowance +"&"+ otherDeductionsControlName +"="+ otherDeductions +
				"&"+ incomeTaxControlName +"="+ incomeTax +"&"+ retainedWithSchoolControlName +"="+ retainedWithSchool +
				"&"+ totalDeductionsControlName +"="+ totalDeduction +"&"+ netPayControlName +"="+ netPay+
				"&"+ loanControlName +"="+ loan + "&" + telAndFaxControlName +"="+ telAndFax;
			}//end for...loop
			dataString += "&ctr="+ctr+"&payrollName="+payrollName+"&payrollMonth="+payrollMonth+"&datePrepared="+datePrepared;
			
			$.ajax({
			    url: 'savelocallyrecruitedexpatriateparttimetteacherspayrollsheet.jsp',		
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