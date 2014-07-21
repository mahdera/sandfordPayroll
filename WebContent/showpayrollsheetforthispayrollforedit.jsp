<%@page import="java.text.DecimalFormat"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*" %>
<div id="printReportDiv">
<%
	String payrollName = request.getParameter("payrollName");
	System.out.println("The payroll name is : "+payrollName);
	int payrollId = Integer.parseInt(request.getParameter("payrollId"));
	Payroll payroll = Payroll.getPayroll(payrollId);
	int payrollMonth = Integer.parseInt(payroll.getPayrollMonth());
	String monthName = "";
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
	
	if(payrollName.equalsIgnoreCase("admin_staff_payroll_detail")){
		List<AdminStaffPayrollSheet> adminStaffPayrollSheetList = AdminStaffPayrollSheet.getAllAdminStaffPayrollSheetsForThisPayroll(payrollId);
		if(!adminStaffPayrollSheetList.isEmpty()){
			Iterator<AdminStaffPayrollSheet> adminStaffPayrollSheetItr = adminStaffPayrollSheetList.iterator();
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
			%>				
				<table border="0" width="100%" style="border: 0px solid #2779aa;" rules="all">
					<tr style="background:#eee">
						<td colspan="18">
							<div style="text-align:center">
								<h5>SANDFORD INTERNATIONAL SCHOOL<br/>PAYROLL SHEET (ADMINISTRATIVE STAFF)<br/>FOR THE MONTH OF <%=monthName %></h5>
							</div>				
						</td>
					</tr>
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
						<td>Other</td>                                                           
						<td>Credit Association</td>
						<td>Labor Union</td>
						<td>Total Deduction</td>
						<td>Net Pay</td>		
					</tr>
					<%
						int ctr=1;
						while(adminStaffPayrollSheetItr.hasNext()){
							AdminStaffPayrollSheet adminStaffPayrollSheet = adminStaffPayrollSheetItr.next();
							Employee adminEmployee = Employee.getEmployee(adminStaffPayrollSheet.getEmployeeId());
							String fullName = adminEmployee.getFirstName()+" "+adminEmployee.getMiddleName()+" "+adminEmployee.getLastName();
							%>
								<tr>
									<td><%=ctr++ %></td>
									<td><%=fullName %></td>
									<td><%=adminStaffPayrollSheet.getBasicSalary() %></td>
									<td><%=adminStaffPayrollSheet.getOvertime() %></td>
									<td><%=adminStaffPayrollSheet.getRetirementPfEr() %></td>
									<td><%=adminStaffPayrollSheet.getAllowanceOther() %></td>
									<td><%=adminStaffPayrollSheet.getGrossSalary() %></td>
									<td><%=adminStaffPayrollSheet.getTaxableIncome() %></td>
									<td><%=adminStaffPayrollSheet.getIncomeTax() %></td>
									<td><%=adminStaffPayrollSheet.getRetirementPfErDeduction()%></td>
									<td><%=adminStaffPayrollSheet.getRetirementPfEe() %></td>
									<td><%=adminStaffPayrollSheet.getPension() %></td>
									<td><%=adminStaffPayrollSheet.getLoanPfLoan() %></td>
									<td><%=adminStaffPayrollSheet.getOther() %></td>
									<td><%=adminStaffPayrollSheet.getCreditAssociation() %></td>
									<td><%=adminStaffPayrollSheet.getLaborUnion() %></td>
									<td><%=adminStaffPayrollSheet.getTotalDeduction() %></td>
									<td><%=adminStaffPayrollSheet.getNetPay() %></td>
								</tr>
							<%
							//now do the total calculation in here...
							 totalBaiscSalary += adminStaffPayrollSheet.getBasicSalary();
							 totalOvertime += adminStaffPayrollSheet.getOvertime();
							 totalPfEr += adminStaffPayrollSheet.getRetirementPfEr();
							 totalAllowanceOther += adminStaffPayrollSheet.getAllowanceOther();
							 totalGrossSalary += adminStaffPayrollSheet.getGrossSalary();
							 totalTaxableIncome += adminStaffPayrollSheet.getTaxableIncome();
							 totalIncomeTax += adminStaffPayrollSheet.getIncomeTax();
							 totalPfErDeduction += adminStaffPayrollSheet.getRetirementPfErDeduction();
							 totalPfEe += adminStaffPayrollSheet.getRetirementPfEe();
							 totalPension += adminStaffPayrollSheet.getPension();
							 totalLoan += adminStaffPayrollSheet.getLoanPfLoan();
							 totalOtherDeductions += adminStaffPayrollSheet.getOther();
							 totalCreditAssociation += adminStaffPayrollSheet.getCreditAssociation();
							 totalLaborUnion += adminStaffPayrollSheet.getLaborUnion();
							 totalDeductionAmount += adminStaffPayrollSheet.getTotalDeduction();
							 totalNetPay += adminStaffPayrollSheet.getNetPay();
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
				</table>
			<%
		}else{
			%>
				<p class="msg warning">There is/are no admin staff payroll detail saved in the database!</p>
			<%
		}
	}else if(payrollName.equalsIgnoreCase("general_service_staff_payroll_detail")){
		List<GeneralServiceStaffPayrollSheet> generalServiceStaffPayrollSheetList = GeneralServiceStaffPayrollSheet.getAllGeneralStaffPayrollSheetsForThisPayroll(payrollId);
		if(!generalServiceStaffPayrollSheetList.isEmpty()){
			Iterator<GeneralServiceStaffPayrollSheet> generalServiceStaffPayrollSheetItr = generalServiceStaffPayrollSheetList.iterator();
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
			%>				
				<table border="0" width="100%" style="border: 0px solid #2779aa;" rules="all">
					<tr style="background:#eee">
						<td colspan="18">
							<div style="text-align:center">
								<h5>SANDFORD INTERNATIONAL SCHOOL<br/>PAYROLL SHEET (GENERAL SERVICE STAFF)<br/>FOR THE MONTH OF <%=monthName %></h5>
							</div>				
						</td>
					</tr>
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
						<td>Other</td>                                                           
						<td>Credit Association</td>
						<td>Labor Union</td>
						<td>Total Deduction</td>
						<td>Net Pay</td>		
					</tr>
					<%
						int ctr=1;
						while(generalServiceStaffPayrollSheetItr.hasNext()){
							GeneralServiceStaffPayrollSheet generalServiceStaffPayrollSheet = generalServiceStaffPayrollSheetItr.next();
							Employee adminEmployee = Employee.getEmployee(generalServiceStaffPayrollSheet.getEmployeeId());
							String fullName = adminEmployee.getFirstName()+" "+adminEmployee.getMiddleName()+" "+adminEmployee.getLastName();
							%>
								<tr>
									<td><%=ctr++ %></td>
									<td><%=fullName %></td>
									<td><%=generalServiceStaffPayrollSheet.getBasicSalary() %></td>
									<td><%=generalServiceStaffPayrollSheet.getOvertime() %></td>
									<td><%=generalServiceStaffPayrollSheet.getRetirementPfEr() %></td>
									<td><%=generalServiceStaffPayrollSheet.getAllowanceOther() %></td>
									<td><%=generalServiceStaffPayrollSheet.getGrossSalary() %></td>
									<td><%=generalServiceStaffPayrollSheet.getTaxableIncome() %></td>
									<td><%=generalServiceStaffPayrollSheet.getIncomeTax() %></td>
									<td><%=generalServiceStaffPayrollSheet.getRetirementPfErDeduction()%></td>
									<td><%=generalServiceStaffPayrollSheet.getRetirementPfEe() %></td>
									<td><%=generalServiceStaffPayrollSheet.getPension() %></td>
									<td><%=generalServiceStaffPayrollSheet.getLoanPfLoan() %></td>
									<td><%=generalServiceStaffPayrollSheet.getOther() %></td>
									<td><%=generalServiceStaffPayrollSheet.getCreditAssociation() %></td>
									<td><%=generalServiceStaffPayrollSheet.getLaborUnion() %></td>
									<td><%=generalServiceStaffPayrollSheet.getTotalDeduction() %></td>
									<td><%=generalServiceStaffPayrollSheet.getNetPay() %></td>
								</tr>
							<%
							//now do the total calculation in here...
							 totalBaiscSalary += generalServiceStaffPayrollSheet.getBasicSalary();
							 totalOvertime += generalServiceStaffPayrollSheet.getOvertime();
							 totalPfEr += generalServiceStaffPayrollSheet.getRetirementPfEr();
							 totalAllowanceOther += generalServiceStaffPayrollSheet.getAllowanceOther();
							 totalGrossSalary += generalServiceStaffPayrollSheet.getGrossSalary();
							 totalTaxableIncome += generalServiceStaffPayrollSheet.getTaxableIncome();
							 totalIncomeTax += generalServiceStaffPayrollSheet.getIncomeTax();
							 totalPfErDeduction += generalServiceStaffPayrollSheet.getRetirementPfErDeduction();
							 totalPfEe += generalServiceStaffPayrollSheet.getRetirementPfEe();
							 totalPension += generalServiceStaffPayrollSheet.getPension();
							 totalLoan += generalServiceStaffPayrollSheet.getLoanPfLoan();
							 totalOtherDeductions += generalServiceStaffPayrollSheet.getOther();
							 totalCreditAssociation += generalServiceStaffPayrollSheet.getCreditAssociation();
							 totalLaborUnion += generalServiceStaffPayrollSheet.getLaborUnion();
							 totalDeductionAmount += generalServiceStaffPayrollSheet.getTotalDeduction();
							 totalNetPay += generalServiceStaffPayrollSheet.getNetPay();
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
				</table>
			<%
		}else{
			%>
				<p class="msg warning">There is/are no general service staff payroll detail saved in the database!</p>
			<%
		}
	}else if(payrollName.equalsIgnoreCase("local_teachers_payroll_detail")){
		List<LocalTeachersPayrollSheet> localTeachersPayrollSheetList = LocalTeachersPayrollSheet.getAllLocalTeachersPayrollSheetsForThisPayroll(payrollId);
		if(!localTeachersPayrollSheetList.isEmpty()){
			Iterator<LocalTeachersPayrollSheet> localTeachersPayrollSheetItr = localTeachersPayrollSheetList.iterator();
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
			%>				
				<table border="0" width="100%" style="border: 0px solid #2779aa;" rules="all">
					<tr style="background:#eee">
						<td colspan="18">
							<div style="text-align:center">
								<h5>SANDFORD INTERNATIONAL SCHOOL<br/>PAYROLL SHEET (LOCAL TEACHERS)<br/>FOR THE MONTH OF <%=monthName %></h5>
							</div>				
						</td>
					</tr>
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
						<td>Cover</td>
						<td>Retirement / PF-ER Cont</td>
						<td>Allowance / Other</td>
						<td>Gross Salary</td>
						<td>Taxable Income</td>
						<td>Income Tax</td>
						<td>Retirement / PF-ER Cont</td>
						<td>Retirement / PF-EE Cont</td>
						<td>Pension Con.</td>
						<td>Loan/PF Loan</td>
						<td>Other</td>
						<td>Credit Association</td>
						<td>Labor Union</td>
						<td>Total Deduction</td>
						<td>Net Pay</td>	
					</tr>
					<%
						int ctr=1;
						while(localTeachersPayrollSheetItr.hasNext()){
							LocalTeachersPayrollSheet localTeachersPayrollSheet = localTeachersPayrollSheetItr.next();
							Employee adminEmployee = Employee.getEmployee(localTeachersPayrollSheet.getEmployeeId());
							String fullName = adminEmployee.getFirstName()+" "+adminEmployee.getMiddleName()+" "+adminEmployee.getLastName();
							%>
								<tr>
									<td><%=ctr++ %></td>
									<td><%=fullName %></td>
									<td><%=localTeachersPayrollSheet.getBasicSalary() %></td>
									<td><%=localTeachersPayrollSheet.getOvertime() %></td>
									<td><%=localTeachersPayrollSheet.getRetirementPfEr() %></td>
									<td><%=localTeachersPayrollSheet.getAllowanceOther() %></td>
									<td><%=localTeachersPayrollSheet.getGrossSalary() %></td>
									<td><%=localTeachersPayrollSheet.getTaxableIncome() %></td>
									<td><%=localTeachersPayrollSheet.getIncomeTax() %></td>
									<td><%=localTeachersPayrollSheet.getRetirementPfErDeduction()%></td>
									<td><%=localTeachersPayrollSheet.getRetirementPfEe() %></td>
									<td><%=localTeachersPayrollSheet.getPension() %></td>
									<td><%=localTeachersPayrollSheet.getLoanPfLoan() %></td>
									<td><%=localTeachersPayrollSheet.getOther() %></td>
									<td><%=localTeachersPayrollSheet.getCreditAssociation() %></td>
									<td><%=localTeachersPayrollSheet.getLaborUnion() %></td>
									<td><%=localTeachersPayrollSheet.getTotalDeduction() %></td>
									<td><%=localTeachersPayrollSheet.getNetPay() %></td>
								</tr>
							<%
							//now do the total calculation in here...
							 totalBaiscSalary += localTeachersPayrollSheet.getBasicSalary();
							 totalOvertime += localTeachersPayrollSheet.getOvertime();
							 totalPfEr += localTeachersPayrollSheet.getRetirementPfEr();
							 totalAllowanceOther += localTeachersPayrollSheet.getAllowanceOther();
							 totalGrossSalary += localTeachersPayrollSheet.getGrossSalary();
							 totalTaxableIncome += localTeachersPayrollSheet.getTaxableIncome();
							 totalIncomeTax += localTeachersPayrollSheet.getIncomeTax();
							 totalPfErDeduction += localTeachersPayrollSheet.getRetirementPfErDeduction();
							 totalPfEe += localTeachersPayrollSheet.getRetirementPfEe();
							 totalPension += localTeachersPayrollSheet.getPension();
							 totalLoan += localTeachersPayrollSheet.getLoanPfLoan();
							 totalOtherDeductions += localTeachersPayrollSheet.getOther();
							 totalCreditAssociation += localTeachersPayrollSheet.getCreditAssociation();
							 totalLaborUnion += localTeachersPayrollSheet.getLaborUnion();
							 totalDeductionAmount += localTeachersPayrollSheet.getTotalDeduction();
							 totalNetPay += localTeachersPayrollSheet.getNetPay();
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
				</table>
			<%
		}else{
			%>
				<p class="msg warning">There is/are no local teachers payroll detail saved in the database!</p>
			<%
		}
	}else if(payrollName.equalsIgnoreCase("locally_recruited_expatriate_partime_teachers_payroll_detail")){
		List<LocallyRecruitedExpatPayrollSheet> locallyRecruitedExpatPayrollSheetList = LocallyRecruitedExpatPayrollSheet.getAllLocallyRecruitedExpatPayrollSheetsForThisPayroll(payrollId);
		if(!locallyRecruitedExpatPayrollSheetList.isEmpty()){
			Iterator<LocallyRecruitedExpatPayrollSheet> locallyRecruitedExpatPayrollSheetItr = locallyRecruitedExpatPayrollSheetList.iterator();
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
			%>				
				<table border="0" width="100%" style="border: 0px solid #2779aa;" rules="all">
					<tr style="background:#eee">
						<td colspan="18">
							<div style="text-align:center">
								<h5>SANDFORD INTERNATIONAL SCHOOL<br/>PAYROLL SHEET (LOCALLY RECRUITED EXPATRIATES AND PARTTIME TEACHERS)<br/>FOR THE MONTH OF <%=monthName %></h5>
							</div>				
						</td>
					</tr>
					<tr style="background:#eee;font-weight:bolder">
						<td></td>
						<td colspan="6" align="center">
							Earnings
						</td>
						<td colspan="7" align="center">
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
						<td>Res. Allowance</td>		
						<td>Gross Salary</td>
						<td>Income Tax Exp.</td>
						<td>Advance & Loans</td>						
						<td>Other Deductions</td>
						<td>Income Tax</td>
						<td>Tele and Elect</td>
						<td>Retained with School</td>		
						<td>Total Deduction</td>		
						<td>Net Pay</td>						
					</tr>
					<%
						int ctr=1;
						while(locallyRecruitedExpatPayrollSheetItr.hasNext()){
							LocallyRecruitedExpatPayrollSheet locallyRecruitedExpatPayrollSheet = locallyRecruitedExpatPayrollSheetItr.next();
							Employee expatEmployee = Employee.getEmployee(locallyRecruitedExpatPayrollSheet.getEmployeeId());
							String fullName = expatEmployee.getFirstName()+" "+expatEmployee.getMiddleName()+" "+expatEmployee.getLastName();
							%>
								<tr>
									<td><%=ctr++ %></td>
									<td><%=fullName %></td>
									<td><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getBasicSalary()) %></td>
									<td><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getProvidentFund()) %></td>
									<td><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getTransportationAllowance()) %></td>
									<td><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getResponsibilityAllowance()) %></td>
									<td><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getGrossSalary()) %></td>
									<td><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getIncomeTaxExp()) %></td>
									<td><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getAdvanceAndLoans()) %></td>									
									<td><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getOtherDeductions()) %></td>
									<td><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getIncomeTax()) %></td>
									<td><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getTelAndFax()) %></td>
									<td><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getRetainedWithSchool()) %></td>
									<td><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getTotalDeduction()) %></td>
									<td><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getNetPay()) %></td>																		
								</tr>
							<%
							//now do the total value calculation in here...	
							 totalBasicSalary += locallyRecruitedExpatPayrollSheet.getBasicSalary();
							 totalProvidentFund += locallyRecruitedExpatPayrollSheet.getProvidentFund();
							 totalTransportationAllowance += locallyRecruitedExpatPayrollSheet.getTransportationAllowance();
							 totalResponsibilityAllowance += locallyRecruitedExpatPayrollSheet.getResponsibilityAllowance();
							 totalGrossSalary += locallyRecruitedExpatPayrollSheet.getGrossSalary();
							 totalIncomeTaxExp += locallyRecruitedExpatPayrollSheet.getIncomeTaxExp();
							 totalAdvanceAndLoans += locallyRecruitedExpatPayrollSheet.getAdvanceAndLoans();
							 totalOtherDeductions += locallyRecruitedExpatPayrollSheet.getOtherDeductions();
							 totalIncomeTax += locallyRecruitedExpatPayrollSheet.getIncomeTax();
							 totalTelAndFax += locallyRecruitedExpatPayrollSheet.getTelAndFax();
							 totalRetainedWithSchool += locallyRecruitedExpatPayrollSheet.getRetainedWithSchool();
							 totalDeductionAmount += locallyRecruitedExpatPayrollSheet.getTotalDeduction();
							 totalNetPay += locallyRecruitedExpatPayrollSheet.getNetPay();
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
				</table>
			<%
		}else{
			%>
				<p class="msg warning">There is/are no locally recruited partime teachers payroll detail saved in the database!</p>
			<%
		}
	}else if(payrollName.equalsIgnoreCase("expatriate_teachers_etb_payroll_detail")){
		List<ExpatTeachersEtbPayrollSheet> expatTeachersEtbPayrollSheetList = ExpatTeachersEtbPayrollSheet.getAllExpatTeachersEtbPayrollSheetsForThisPayroll(payrollId);
		if(!expatTeachersEtbPayrollSheetList.isEmpty()){
			Iterator<ExpatTeachersEtbPayrollSheet> expatTeachersEtbPayrollSheetItr = expatTeachersEtbPayrollSheetList.iterator();
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
			%>				
				<table border="0" width="100%" style="border: 0px solid #2779aa;" rules="all">
					<tr style="background:#eee">
						<td colspan="20">
							<div style="text-align:center">
								<h5>SANDFORD INTERNATIONAL SCHOOL<br/>PAYROLL SHEET (EXPATRIATE TEACHERS ETB SALARY)<br/>FOR THE MONTH OF <%=monthName %></h5>
							</div>				
						</td>
					</tr>
					<tr style="background:#eee;font-weight:bolder">
						<td colspan="7" align="center">
							USD
						</td>
						<td colspan="9" align="center">
							ETB
						</td>
						<td colspan="4"></td>
					</tr>
					<tr style="background:#eee;font-weight:bolder">
						<td>No.</td>
						<td>Employee</td>
						<td>Basic Salary</td>
						<td>Resp. Allow.</td>
						<td>Gross Salary</td>
						<td>Exchange Rate</td>
						<td>Total in Birr</td>
						<td>Basic Salary</td>
						<td>Resp. Allow.</td>
						<td>Covrtd Hrd Curr.</td>
						<td>House Rent Allow.</td>
						<td>Gratuity</td>
						<td>Gross Salary</td>
						<td>Grand in Birr</td>
						<td>Advance & Loans</td>
						<td>House Rent Deduct.</td>
						<td>Taxable Income.</td>
						<td>Income Tax</td>
						<td>Tel. & Elect.</td>
						<td>Total Deduction</td>
						<td>Net Pay</td>	
					</tr>
					<%
						int ctr=1;
						while(expatTeachersEtbPayrollSheetItr.hasNext()){
							ExpatTeachersEtbPayrollSheet expatTeachersEtbPayrollSheet = expatTeachersEtbPayrollSheetItr.next();
							Employee adminEmployee = Employee.getEmployee(expatTeachersEtbPayrollSheet.getEmployeeId());
							String fullName = adminEmployee.getFirstName()+" "+adminEmployee.getMiddleName()+" "+adminEmployee.getLastName();
							%>
								<tr>
									<td><%=ctr++ %></td>
									<td><%=fullName %></td>
									<td><%=twoDigit.format(expatTeachersEtbPayrollSheet.getUsdBasicSalary()) %></td>
									<td><%=twoDigit.format(expatTeachersEtbPayrollSheet.getResponsibilityAllowance()) %></td>
									<td><%=twoDigit.format(expatTeachersEtbPayrollSheet.getUsdGrossSalary()) %></td>
									<td><%=twoDigit.format(expatTeachersEtbPayrollSheet.getExchangeRate()) %></td>
									<td><%=twoDigit.format(expatTeachersEtbPayrollSheet.getTotalInBirr()) %></td>
									<td><%=twoDigit.format(expatTeachersEtbPayrollSheet.getEtbBasicSalary()) %></td>
									<td><%=twoDigit.format(expatTeachersEtbPayrollSheet.getEtbResponsibilityAllowance()) %></td>
									<td><%=twoDigit.format(expatTeachersEtbPayrollSheet.getConvertedHardCurrency()) %></td>
									<td><%=twoDigit.format(expatTeachersEtbPayrollSheet.getHouseRentAllowance()) %></td>
									<td><%=twoDigit.format(expatTeachersEtbPayrollSheet.getGratuityAmount()) %></td>
									<td><%=twoDigit.format(expatTeachersEtbPayrollSheet.getEtbGrossSalary()) %></td>
									<td><%=twoDigit.format(expatTeachersEtbPayrollSheet.getGrandInBirr()) %></td>
									<td><%=twoDigit.format(expatTeachersEtbPayrollSheet.getAdvanceAndLoans()) %></td>
									<td><%=twoDigit.format(expatTeachersEtbPayrollSheet.getHouseRentDeduction()) %></td>
									<td><%=twoDigit.format(expatTeachersEtbPayrollSheet.getTaxableIncome()) %></td>
									<td><%=twoDigit.format(expatTeachersEtbPayrollSheet.getIncomeTax()) %></td>
									<td><%=twoDigit.format(expatTeachersEtbPayrollSheet.getTelAndElec()) %></td>
									<td><%=twoDigit.format(expatTeachersEtbPayrollSheet.getTotalDeduction()) %></td>
									<td><%=twoDigit.format(expatTeachersEtbPayrollSheet.getNetPay()) %></td>									
								</tr>
							<%
							//now do the grand total calcualtion here...
							totalBasicSalaryUsd += expatTeachersEtbPayrollSheet.getUsdBasicSalary();
							totalResponsibilityAllowanceUsd += expatTeachersEtbPayrollSheet.getResponsibilityAllowance();
							totalgrossSalaryUsd += expatTeachersEtbPayrollSheet.getUsdGrossSalary();
							totalAmountInBirr += expatTeachersEtbPayrollSheet.getTotalInBirr();
							totalBasicSalaryEtb += expatTeachersEtbPayrollSheet.getEtbBasicSalary();
							totalResponsibilityAllowanceEtb += expatTeachersEtbPayrollSheet.getEtbResponsibilityAllowance();
							totalConvertedHardCurrency += expatTeachersEtbPayrollSheet.getConvertedHardCurrency();
							totalHouseRentAllowance += expatTeachersEtbPayrollSheet.getHouseRentAllowance();
							totalGratuity += expatTeachersEtbPayrollSheet.getGratuityAmount();
							totalGrossSalaryEtb += expatTeachersEtbPayrollSheet.getEtbGrossSalary();
							totalGrandInBirr += expatTeachersEtbPayrollSheet.getGrandInBirr();
							totalAdvanceAndLoans += expatTeachersEtbPayrollSheet.getAdvanceAndLoans();
							totalHouseRentDeductions += expatTeachersEtbPayrollSheet.getHouseRentDeduction();
							totalTaxableIncome += expatTeachersEtbPayrollSheet.getTaxableIncome();
							totalIncomeTax += expatTeachersEtbPayrollSheet.getIncomeTax();
							totalTelAndElect += expatTeachersEtbPayrollSheet.getTelAndElec();
							totalDeductionsAmount += expatTeachersEtbPayrollSheet.getTotalDeduction();
							totalNetPay += expatTeachersEtbPayrollSheet.getNetPay();
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
						<td><%=twoDigit.format(totalGratuity) %></td>
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
				</table>
			<%
		}else{
			%>
				<p class="msg warning">There is/are no expatriate teachers payroll detail saved in the database!</p>
			<%
		}
	}else if(payrollName.equalsIgnoreCase("expatriate_teachers_usd_payroll_detail")){		
		System.out.println("got here mahder...");
		List<ExpatTeachersUsdPayrollSheet> expatTeachersUsdPayrollSheetList = ExpatTeachersUsdPayrollSheet.getAllExpatTeachersUsdPayrollSheetsForThisPayroll(payrollId);
		if(!expatTeachersUsdPayrollSheetList.isEmpty()){
			Iterator<ExpatTeachersUsdPayrollSheet> expatTeachersUsdPayrollSheetItr = expatTeachersUsdPayrollSheetList.iterator();
			%>				
				<table border="0" width="100%" style="border: 0px solid #2779aa;" rules="all">
					<tr style="background:#eee">
						<td colspan="20">
							<div style="text-align:center">
								<h5>SANDFORD INTERNATIONAL SCHOOL<br/>PAYROLL SHEET (EXPATRIATE TEACHERS USD SALARY)<br/>FOR THE MONTH OF <%=monthName %></h5>
							</div>				
						</td>
					</tr>
					<tr style="background:#eee;font-weight:bolder">
						<td colspan="5" align="center">
							Earnings
						</td>
						<td colspan="5" align="center">
							Deductions
						</td>		
						<td></td>
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
						<td>Edit</td>
					</tr>
					<%
						int ctr=1;
						while(expatTeachersUsdPayrollSheetItr.hasNext()){
							ExpatTeachersUsdPayrollSheet expatTeachersUsdPayrollSheet = expatTeachersUsdPayrollSheetItr.next();
							Employee adminEmployee = Employee.getEmployee(expatTeachersUsdPayrollSheet.getEmployeeId());
							String fullName = adminEmployee.getFirstName()+" "+adminEmployee.getMiddleName()+" "+adminEmployee.getLastName();
							%>
								<tr>
									<td><%=ctr++ %></td>
									<td><%=fullName %></td>
									<td><%=expatTeachersUsdPayrollSheet.getBasicSalary() %></td>
									<td><%=expatTeachersUsdPayrollSheet.getResponsibilityAllowance() %></td>
									<td><%=expatTeachersUsdPayrollSheet.getGrossSalary() %></td>									
									<td><%=expatTeachersUsdPayrollSheet.getConvertedIntoBirr() %></td>
									<td><%=expatTeachersUsdPayrollSheet.getAdvanceAndLoans() %></td>
									<td><%=expatTeachersUsdPayrollSheet.getRetainedWithSchool() %></td>
									<td><%=expatTeachersUsdPayrollSheet.getTelFaxElect() %></td>
									<td><%=expatTeachersUsdPayrollSheet.getTotalDeduction() %></td>
									<td><%=expatTeachersUsdPayrollSheet.getNetPay() %></td>		
									<td>
										<a href="#.jsp" onclick="showEditFieldsOfThisExpatTeachersUsdPayrollSheet(<%=expatTeachersUsdPayrollSheet.getId() %>);">Edit</a> |
										<a href="#.jsp" onclick="hideThisExpatTeachersUsdPayrollSheet(<%=expatTeachersUsdPayrollSheet.getId() %>);">Hide</a>
									</td>																
								</tr>
								<%
									String divId = "expatTeachersUsdPayrollSheetEditDiv" + expatTeachersUsdPayrollSheet.getId();
								%>
								<tr>
									<td colspan="12">
										<div id="<%=divId %>"></div>
									</td>
								</tr>
							<%
						}//end while loop
					%>
				</table>
			<%
		}else{
			%>
				<p class="msg warning">There is/are no expatriate teachers payroll detail saved in the database!</p>
			<%
		}
	}
%>
</div>
<script type="text/javascript">
	function showEditFieldsOfThisExpatTeachersUsdPayrollSheet(expatTeachersUsdPayrollSheetId){
		var divId = "expatTeachersUsdPayrollSheetEditDiv" + expatTeachersUsdPayrollSheetId;
		$('#'+divId).load('showeditfieldsofthisexpatteachersusdpayrollsheet.jsp?expatTeachersUsdPayrollSheetId='+expatTeachersUsdPayrollSheetId);
	}
	
	function hideThisExpatTeachersUsdPayrollSheet(expatTeachersUsdPayrollSheetId){
		var divId = "expatTeachersUsdPayrollSheetEditDiv" + expatTeachersUsdPayrollSheetId;
		$('#'+divId).html("");
	}
	
	$(document).ready(function(){
		$('#loadingDiv').hide();
	});//end document.ready function
</script>