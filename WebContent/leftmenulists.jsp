<%@page import="com.payrolladmin.server.classes.*"%>
<div id="leftMenuDiv">
	<%
		int langId = Integer.parseInt(session.getAttribute("langId").toString());
	%>
	<ul class="box">	
		<li><a href="#" onclick="performThisFunction('adminFieldsManagement');"><img src="images/admin.jpg" align="absmiddle"/> <strong>	<label id="">Fields</label></strong></a></li>
		<li><a href="#" onclick="performThisFunction('employeeAllowanceManagement');"><img src="images/division.jpg" align="absmiddle"/> <strong><label id="lbldivision">Employee Allowance</label></strong></a></li>
		<li><a href="#" onclick="performThisFunction('employeeDeductionManagement');"><img src="images/dept.jpg" align="absmiddle"/> <strong>	<label id="lbldepartment">Employee Deduction</label></strong></a></li>
		<li><a href="#" onclick="performThisFunction('employeeOvertimeManagement');"><img src="images/employee.jpg" align="absmiddle"/> <strong><label id="lblemployee">Overtime</label></strong></a></li>
		<li><a href="#" onclick="performThisFunction('advanceManagement');"><img src="design/attendance.jpeg" align="absmiddle"/> <strong><label id="lblemployee">Advance</label></strong></a></li>
		<li><a href="#" onclick="performThisFunction('employeeLoanManagement');"><img src="images/account.jpg" align="absmiddle"/> <strong><label id="lblmanageaccount">Employee Loan</label></strong></a></li>
		<li><a href="#" onclick="performThisFunction('payrollProcessManagement');"><img src="images/module.jpg" align="absmiddle"/> <strong><label id="lblhrmodule">Payroll</label></strong></a></li>		
		<li><a href="#" onclick="performThisFunction('payslipManagement');"><img src="images/role.jpg" align="absmiddle"/> <strong><label id="">Pay Slip</label></strong></a></li>				
	</ul>
</div>

