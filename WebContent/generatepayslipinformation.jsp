<%@page import="java.text.DecimalFormat"%>
<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*" %>
<div id="printReportDiv">
<%	
	String payrollName = request.getParameter("payrollName");
	String payrollMonth = request.getParameter("payrollMonth");	
	int payrollYear = Integer.parseInt(request.getParameter("payrollYear"));
	DecimalFormat twoDigit = new DecimalFormat("0.00");

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
		if(payrollName.equalsIgnoreCase("admin_staff_payroll_detail")){
			//now get all employees of this payroll type
			PayrollEmptype payrollEmptype = PayrollEmptype.getPayrollEmptypeForEmployeeType("Administrative Staff");
			List<Employee> adminEmployeeList = EmployeePayrollTypeMap.getAllEmployeesOfThisPayrollEmpType(payrollEmptype.getId());
			if(!adminEmployeeList.isEmpty()){
				Iterator<Employee> adminEmployeeItr = adminEmployeeList.iterator();
				while(adminEmployeeItr.hasNext()){
					Employee adminEmployee = adminEmployeeItr.next();
					AdminStaffPayrollSheet adminStaffPayrollSheet = AdminStaffPayrollSheet.getAllAdminStaffPayrollSheetsForThisPayrollAndEmployee(payroll.getId(),adminEmployee.getId());
					if(adminStaffPayrollSheet != null){
					String fullName = adminEmployee.getFirstName()+" "+adminEmployee.getMiddleName()+" "+adminEmployee.getLastName();
					WorksAt worksAt = WorksAt.getWorksAtForEmployee(adminEmployee.getId());
					Department department = Department.getDepartment(worksAt.getDepartmentId());
					%>
					<table border="2" width="100%" style="border: 3px solid #2779aa;" rules="all">
						<tr>
							<td width="50%">
								<strong>Employee:</strong> <u><%=fullName %></u>
							</td>
							<td width="50%">
								<strong>Id Number:</strong> <u><%=adminEmployee.getEmployeeIdNumber() %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Department:</strong> <u><%=department.getDepartmentName() %></u>
							</td>
							<td>
								<strong>Payroll Month:</strong> <u><%=payrollMonthName %>, <%=payrollYear %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Basic Salary:</strong> <u><%=twoDigit.format(adminStaffPayrollSheet.getBasicSalary()) %></u>
							</td>
							<td>
								<strong>Allowance/Other:</strong> <u><%=twoDigit.format(adminStaffPayrollSheet.getAllowanceOther()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Overtime:</strong> <u><%=twoDigit.format(adminStaffPayrollSheet.getOvertime()) %></u>
							</td>
							<td>
								<strong>Gross Salary:</strong> <u><%=twoDigit.format(adminStaffPayrollSheet.getGrossSalary()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>PF-ER:</strong> <u><%=twoDigit.format(adminStaffPayrollSheet.getRetirementPfEr()) %></u>
							</td>
							<td>
								<strong>Taxable Income:</strong> <u><%=twoDigit.format(adminStaffPayrollSheet.getTaxableIncome()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Income Tax:</strong> <u><%=twoDigit.format(adminStaffPayrollSheet.getIncomeTax()) %></u>
							</td>
							<td>
								<strong>PF-ER Deduction:</strong> <u><%=twoDigit.format(adminStaffPayrollSheet.getRetirementPfErDeduction()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>PF-EE:</strong> <u><%=twoDigit.format(adminStaffPayrollSheet.getRetirementPfEe()) %></u>
							</td>
							<td>
								<strong>Pension:</strong> <u><%=twoDigit.format(adminStaffPayrollSheet.getPension()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Loan:</strong> <u><%=twoDigit.format(adminStaffPayrollSheet.getLoanPfLoan()) %></u>
							</td>
							<td>
								<strong>Other Deductions:</strong> <u><%=twoDigit.format(adminStaffPayrollSheet.getOther()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Credit Association:</strong> <u><%=twoDigit.format(adminStaffPayrollSheet.getCreditAssociation()) %></u>
							</td>
							<td>
								<strong>Labor Union:</strong> <u><%=twoDigit.format(adminStaffPayrollSheet.getLaborUnion()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Total Deductions:</strong> <u><%=twoDigit.format(adminStaffPayrollSheet.getTotalDeduction()) %></u>
							</td>
							<td>
								<strong>Net Pay:</strong> <u><%=twoDigit.format(adminStaffPayrollSheet.getNetPay()) %></u>
							</td>
						</tr>						
					</table>
					<br/><br/><br/>
					<%
					}//end if condition...
				}//end while loop
			}else{
				%>
					<p class="msg warining">There is/are no Administrative Staff employee type saved in the database!</p>
				<%
			}
		}else if(payrollName.equalsIgnoreCase("general_service_staff_payroll_detail")){
			//now get all employees of this payroll type
			PayrollEmptype payrollEmptype = PayrollEmptype.getPayrollEmptypeForEmployeeType("General Service");
			List<Employee> generalServiceEmployeeList = EmployeePayrollTypeMap.getAllEmployeesOfThisPayrollEmpType(payrollEmptype.getId());
			if(!generalServiceEmployeeList.isEmpty()){
				Iterator<Employee> generalServiceEmployeeItr = generalServiceEmployeeList.iterator();
				while(generalServiceEmployeeItr.hasNext()){
					Employee generalServiceEmployee = generalServiceEmployeeItr.next();
					GeneralServiceStaffPayrollSheet generalServiceStaffPayrollSheet = GeneralServiceStaffPayrollSheet.getAllGeneralServicePayrollSheetsForThisPayrollAndEmployee(payroll.getId(),generalServiceEmployee.getId());
					if(generalServiceStaffPayrollSheet != null){
					String fullName = generalServiceEmployee.getFirstName()+" "+generalServiceEmployee.getMiddleName()+" "+generalServiceEmployee.getLastName();
					WorksAt worksAt = WorksAt.getWorksAtForEmployee(generalServiceEmployee.getId());
					Department department = Department.getDepartment(worksAt.getDepartmentId());
					%>
					<table border="2" width="100%" style="border: 3px solid #2779aa;" rules="all">
						<tr>
							<td width="50%">
								<strong>Employee:</strong> <u><%=fullName %></u>
							</td>
							<td width="50%">
								<strong>Id Number:</strong> <u><%=generalServiceEmployee.getEmployeeIdNumber() %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Department:</strong> <u><%=department.getDepartmentName() %></u>
							</td>
							<td>
								<strong>Payroll Month:</strong> <u><%=payrollMonthName %>, <%=payrollYear %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Basic Salary:</strong> <u><%=twoDigit.format(generalServiceStaffPayrollSheet.getBasicSalary()) %></u>
							</td>
							<td>
								<strong>Allowance/Other:</strong> <u><%=twoDigit.format(generalServiceStaffPayrollSheet.getAllowanceOther()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Overtime:</strong> <u><%=twoDigit.format(generalServiceStaffPayrollSheet.getOvertime()) %></u>
							</td>
							<td>
								<strong>Gross Salary:</strong> <u><%=twoDigit.format(generalServiceStaffPayrollSheet.getGrossSalary()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>PF-ER:</strong> <u><%=twoDigit.format(generalServiceStaffPayrollSheet.getRetirementPfEr()) %></u>
							</td>
							<td>
								<strong>Taxable Income:</strong> <u><%=twoDigit.format(generalServiceStaffPayrollSheet.getTaxableIncome()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Income Tax:</strong> <u><%=twoDigit.format(generalServiceStaffPayrollSheet.getIncomeTax()) %></u>
							</td>
							<td>
								<strong>PF-ER Deduction:</strong> <u><%=twoDigit.format(generalServiceStaffPayrollSheet.getRetirementPfErDeduction()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>PF-EE:</strong> <u><%=twoDigit.format(generalServiceStaffPayrollSheet.getRetirementPfEe()) %></u>
							</td>
							<td>
								<strong>Pension:</strong> <u><%=twoDigit.format(generalServiceStaffPayrollSheet.getPension()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Loan:</strong> <u><%=twoDigit.format(generalServiceStaffPayrollSheet.getLoanPfLoan()) %></u>
							</td>
							<td>
								<strong>Other Deductions:</strong> <u><%=twoDigit.format(generalServiceStaffPayrollSheet.getOther()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Credit Association:</strong> <u><%=twoDigit.format(generalServiceStaffPayrollSheet.getCreditAssociation()) %></u>
							</td>
							<td>
								<strong>Labor Union:</strong> <u><%=twoDigit.format(generalServiceStaffPayrollSheet.getLaborUnion()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Total Deductions:</strong> <u><%=twoDigit.format(generalServiceStaffPayrollSheet.getTotalDeduction()) %></u>
							</td>
							<td>
								<strong>Net Pay:</strong> <u><%=twoDigit.format(generalServiceStaffPayrollSheet.getNetPay()) %></u>
							</td>
						</tr>						
					</table>
					<br/><br/><br/>
					<%
				}//end if condition...
				}//end while loop
			}else{
				%>
					<p class="msg warining">There is/are no General Service Staff employee type saved in the database!</p>
				<%
			}
		}else if(payrollName.equalsIgnoreCase("local_teachers_payroll_detail")){
			//now get all employees of this payroll type
			PayrollEmptype payrollEmptype = PayrollEmptype.getPayrollEmptypeForEmployeeType("Local Teacher");
			List<Employee> localTeacherEmployeeList = EmployeePayrollTypeMap.getAllEmployeesOfThisPayrollEmpType(payrollEmptype.getId());
			if(!localTeacherEmployeeList.isEmpty()){
				Iterator<Employee> localTeacherEmployeeItr = localTeacherEmployeeList.iterator();
				while(localTeacherEmployeeItr.hasNext()){
					Employee localTeacherEmployee = localTeacherEmployeeItr.next();
					LocalTeachersPayrollSheet localTeachersPayrollSheet = LocalTeachersPayrollSheet.getAllLocalTeachersPayrollSheetsForThisPayrollAndEmployee(payroll.getId(),localTeacherEmployee.getId());
					if(localTeachersPayrollSheet != null){
					String fullName = localTeacherEmployee.getFirstName()+" "+localTeacherEmployee.getMiddleName()+" "+localTeacherEmployee.getLastName();
					WorksAt worksAt = WorksAt.getWorksAtForEmployee(localTeacherEmployee.getId());
					Department department = Department.getDepartment(worksAt.getDepartmentId());
					%>
					<table border="2" width="100%" style="border: 3px solid #2779aa;" rules="all">
						<tr>
							<td width="50%">
								<strong>Employee:</strong> <u><%=fullName %></u>
							</td>
							<td width="50%">
								<strong>Id Number:</strong> <u><%=localTeacherEmployee.getEmployeeIdNumber() %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Department:</strong> <u><%=department.getDepartmentName() %></u>
							</td>
							<td>
								<strong>Payroll Month:</strong> <u><%=payrollMonthName %>, <%=payrollYear %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Basic Salary:</strong> <u><%=twoDigit.format(localTeachersPayrollSheet.getBasicSalary()) %></u>
							</td>
							<td>
								<strong>Allowance/Other:</strong> <u><%=twoDigit.format(localTeachersPayrollSheet.getAllowanceOther()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Overtime:</strong> <u><%=twoDigit.format(localTeachersPayrollSheet.getOvertime()) %></u>
							</td>
							<td>
								<strong>Gross Salary:</strong> <u><%=twoDigit.format(localTeachersPayrollSheet.getGrossSalary()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>PF-ER:</strong> <u><%=twoDigit.format(localTeachersPayrollSheet.getRetirementPfEr()) %></u>
							</td>
							<td>
								<strong>Taxable Income:</strong> <u><%=twoDigit.format(localTeachersPayrollSheet.getTaxableIncome()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Income Tax:</strong> <u><%=twoDigit.format(localTeachersPayrollSheet.getIncomeTax()) %></u>
							</td>
							<td>
								<strong>PF-ER Deduction:</strong> <u><%=twoDigit.format(localTeachersPayrollSheet.getRetirementPfErDeduction()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>PF-EE:</strong> <u><%=twoDigit.format(localTeachersPayrollSheet.getRetirementPfEe()) %></u>
							</td>
							<td>
								<strong>Pension:</strong> <u><%=twoDigit.format(localTeachersPayrollSheet.getPension()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Loan:</strong> <u><%=twoDigit.format(localTeachersPayrollSheet.getLoanPfLoan()) %></u>
							</td>
							<td>
								<strong>Other Deductions:</strong> <u><%=twoDigit.format(localTeachersPayrollSheet.getOther()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Credit Association:</strong> <u><%=twoDigit.format(localTeachersPayrollSheet.getCreditAssociation()) %></u>
							</td>
							<td>
								<strong>Labor Union:</strong> <u><%=twoDigit.format(localTeachersPayrollSheet.getLaborUnion()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Total Deductions:</strong> <u><%=twoDigit.format(localTeachersPayrollSheet.getTotalDeduction()) %></u>
							</td>
							<td>
								<strong>Net Pay:</strong> <u><%=twoDigit.format(localTeachersPayrollSheet.getNetPay()) %></u>
							</td>
						</tr>						
					</table>
					<br/><br/><br/>
					<%
				}//end if condition...
				}//end while loop
			}else{
				%>
					<p class="msg warining">There is/are no Local Teacher Staff employee type saved in the database!</p>
				<%
			}
		}else if(payrollName.equalsIgnoreCase("locally_recruited_expatriate_partime_teachers_payroll_detail")){
			//now get all employees of this payroll type
			PayrollEmptype payrollEmptype = PayrollEmptype.getPayrollEmptypeForEmployeeType("Locally Recruited Expatriate Parttime Teacher");
			List<Employee> locallyRecruitedExpatPartimeEmployeeList = EmployeePayrollTypeMap.getAllEmployeesOfThisPayrollEmpType(payrollEmptype.getId());
			if(!locallyRecruitedExpatPartimeEmployeeList.isEmpty()){
				Iterator<Employee> locallyRecruitedExpatPartimeEmployeeItr = locallyRecruitedExpatPartimeEmployeeList.iterator();
				while(locallyRecruitedExpatPartimeEmployeeItr.hasNext()){
					Employee locallyRecruitedExpatPartimeEmployee = locallyRecruitedExpatPartimeEmployeeItr.next();
					LocallyRecruitedExpatPayrollSheet locallyRecruitedExpatPayrollSheet = LocallyRecruitedExpatPayrollSheet.getAllLocallyRecruitedExpatPayrollSheetsForThisPayrollAndEmployee(payroll.getId(),locallyRecruitedExpatPartimeEmployee.getId());
					if(locallyRecruitedExpatPayrollSheet != null){
					String fullName = locallyRecruitedExpatPartimeEmployee.getFirstName()+" "+locallyRecruitedExpatPartimeEmployee.getMiddleName()+" "+locallyRecruitedExpatPartimeEmployee.getLastName();
					WorksAt worksAt = WorksAt.getWorksAtForEmployee(locallyRecruitedExpatPartimeEmployee.getId());
					Department department = Department.getDepartment(worksAt.getDepartmentId());
					%>
					<table border="2" width="100%" style="border: 3px solid #2779aa;" rules="all">
						<tr>
							<td width="50%">
								<strong>Employee:</strong> <u><%=fullName %></u>
							</td>
							<td width="50%">
								<strong>Id Number:</strong> <u><%=locallyRecruitedExpatPartimeEmployee.getEmployeeIdNumber() %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Department:</strong> <u><%=department.getDepartmentName() %></u>
							</td>
							<td>
								<strong>Payroll Month:</strong> <u><%=payrollMonthName %>, <%=payrollYear %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Basic Salary:</strong> <u><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getBasicSalary()) %></u>
							</td>
							<td>
								<strong>Provident Fund:</strong> <u><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getProvidentFund()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Transportation Allowance:</strong> <u><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getTransportationAllowance()) %></u>
							</td>
							<td>
								<strong>Responsibility Allowance:</strong> <u><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getResponsibilityAllowance()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Gross Salary:</strong> <u><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getGrossSalary()) %></u>
							</td>
							<td>
								<strong>Income Tax Exp:</strong> <u><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getIncomeTaxExp()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Advance and Loans:</strong> <u><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getAdvanceAndLoans()) %></u>
							</td>
							<td>
								<strong>Other Deductions:</strong> <u><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getOtherDeductions()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Income Tax:</strong> <u><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getIncomeTax()) %></u>
							</td>
							<td>
								<strong>Tel And Fax:</strong> <u><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getTelAndFax()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Retained with School:</strong> <u><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getRetainedWithSchool()) %></u>
							</td>
							<td>
								<strong>Total Deductions:</strong> <u><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getTotalDeduction()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Net Pay:</strong> <u><%=twoDigit.format(locallyRecruitedExpatPayrollSheet.getNetPay()) %></u>
							</td>
							<td>
								
							</td>
						</tr>												
					</table>
					<br/>
					<%
				}//end if condition...
				}//end while loop
			}else{
				%>
					<p class="msg warining">There is/are no Local Teacher Staff employee type saved in the database!</p>
				<%
			}
		}else if(payrollName.equalsIgnoreCase("expatriate_teachers_etb_payroll_detail")){
			//now get all employees of this payroll type
			PayrollEmptype payrollEmptype = PayrollEmptype.getPayrollEmptypeForEmployeeType("Expatriate Teacher");
			List<Employee> expatEmployeeList = EmployeePayrollTypeMap.getAllEmployeesOfThisPayrollEmpType(payrollEmptype.getId());
			if(!expatEmployeeList.isEmpty()){
				Iterator<Employee> expatEmployeeItr = expatEmployeeList.iterator();
				while(expatEmployeeItr.hasNext()){
					Employee expatEmployee = expatEmployeeItr.next();
					ExpatTeachersEtbPayrollSheet expatTeachersEtbPayrollSheet = ExpatTeachersEtbPayrollSheet.getAllExpatTeachersEtbPayrollSheetsForThisPayrollAndEmployee(payroll.getId(),expatEmployee.getId());
					if(expatTeachersEtbPayrollSheet != null){
					String fullName = expatEmployee.getFirstName()+" "+expatEmployee.getMiddleName()+" "+expatEmployee.getLastName();
					WorksAt worksAt = WorksAt.getWorksAtForEmployee(expatEmployee.getId());
					Department department = Department.getDepartment(worksAt.getDepartmentId());
					%>
					<table border="2" width="100%" style="border: 3px solid #2779aa;" rules="all">
						<tr>
							<td width="50%">
								<strong>Employee:</strong> <u><%=fullName %></u>
							</td>
							<td width="50%">
								<strong>Id Number:</strong> <u><%=expatEmployee.getEmployeeIdNumber() %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Department:</strong> <u><%=department.getDepartmentName() %></u>
							</td>
							<td>
								<strong>Payroll Month:</strong> <u><%=payrollMonthName %>, <%=payrollYear %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Basic Salary (USD):</strong> <u><%=twoDigit.format(expatTeachersEtbPayrollSheet.getUsdBasicSalary()) %></u>
							</td>
							<td>
								<strong>Responsibility Allowance (USD):</strong> <u><%=twoDigit.format(expatTeachersEtbPayrollSheet.getResponsibilityAllowance()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Gross Salary (USD):</strong> <u><%=twoDigit.format(expatTeachersEtbPayrollSheet.getUsdGrossSalary()) %></u>
							</td>
							<td>
								<strong>Exchange Rate:</strong> <u><%=twoDigit.format(expatTeachersEtbPayrollSheet.getExchangeRate()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Total in Birr:</strong> <u><%=twoDigit.format(expatTeachersEtbPayrollSheet.getTotalInBirr()) %></u>
							</td>
							<td>
								<strong>Basic Salary (ETB):</strong> <u><%=twoDigit.format(expatTeachersEtbPayrollSheet.getEtbBasicSalary()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Responsibility Allowance (ETB):</strong> <u><%=twoDigit.format(expatTeachersEtbPayrollSheet.getEtbResponsibilityAllowance()) %></u>
							</td>
							<td>
								<strong>Converted Hard Currency:</strong> <u><%=twoDigit.format(expatTeachersEtbPayrollSheet.getConvertedHardCurrency()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>House Rent Allowance:</strong> <u><%=twoDigit.format(expatTeachersEtbPayrollSheet.getHouseRentAllowance()) %></u>
							</td>
							<td>
								<strong>Gratuity:</strong> <u><%=twoDigit.format(expatTeachersEtbPayrollSheet.getGratuityAmount()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Gross Salary (ETB):</strong> <u><%=twoDigit.format(expatTeachersEtbPayrollSheet.getEtbGrossSalary()) %></u>
							</td>
							<td>
								<strong>Grand in Birr:</strong> <u><%=twoDigit.format(expatTeachersEtbPayrollSheet.getGrandInBirr()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Advance and Loans:</strong> <u><%=twoDigit.format(expatTeachersEtbPayrollSheet.getAdvanceAndLoans()) %></u>
							</td>
							<td>
								<strong>House Rent Deductions:</strong> <u><%=twoDigit.format(expatTeachersEtbPayrollSheet.getHouseRentDeduction()) %></u>
							</td>
						</tr>												
						<tr>							
							<td>
								<strong>Taxable Income:</strong> <u><%=twoDigit.format(expatTeachersEtbPayrollSheet.getTaxableIncome()) %></u>
							</td>
							<td>
								<strong>Income Tax:</strong> <u><%=twoDigit.format(expatTeachersEtbPayrollSheet.getIncomeTax()) %></u>
							</td>
						</tr>
						<tr>							
							<td>
								<strong>Tel and Elec:</strong> <u><%=twoDigit.format(expatTeachersEtbPayrollSheet.getTelAndElec()) %></u>
							</td>
							<td>
								<strong>Total Deductions:</strong> <u><%=twoDigit.format(expatTeachersEtbPayrollSheet.getTotalDeduction()) %></u>
							</td>
						</tr>
						<tr>
							<td>
								<strong>Net Pay:</strong> <u><%=twoDigit.format(expatTeachersEtbPayrollSheet.getNetPay()) %></u>
							</td>
							<td></td>
						</tr>
					</table>
					<br/>
					<%
				}//end if condition...
				}//end while loop
			}else{
				%>
					<p class="msg warining">There is/are no Local Teacher Staff employee type saved in the database!</p>
				<%
			}
		}else if(payrollName.equalsIgnoreCase("expatriate_teachers_usd_payroll_detail")){
			
		}
	}else{
		%>
		<p class="msg warning">No payroll information is found!</p>
	<%
}
%>
</div>
<table border="0" width="100%">
	<tr>
		<td align="right">
			<a href="#.jsp" onclick="printDiv('printReportDiv')"><img src="images/printer.jpg" align="absmiddle"/> Print</a>
		</td>
	</tr>
</table>
<script type="text/javascript">
	$(document).ready(function(){
		$('#loadingDiv').hide();
	});//end document.ready function
</script>