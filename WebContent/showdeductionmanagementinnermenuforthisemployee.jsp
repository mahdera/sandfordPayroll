<%@page import="com.payrolladmin.server.classes.*"%>
<%
	long employeeId = Long.parseLong(request.getParameter("employeeId"));
%>
<table border="0" width="100%">
	<tr style="background:#ccc;font-weight:bolder">
		<td><a href="#.jsp" id="addDeductionLink">Add Deduction</a></td>
		<td><a href="#.jsp" id="viewDeductionsLink">View Deductions</a></td>
		<td><a href="#.jsp" id="showListOfDeductionsForEditLink">Edit Deduction</a></td>
		<td><a href="#.jsp" id="showListOfDeductionsForDeleteLink">Delete Deduction</a></td>
	</tr>
</table>
<%
	String divId = "employeeDeductionManagementDiv" + employeeId;
%>
<div id="<%=divId %>"></div>
<script type="text/javascript">
	$(document).ready(function(){
		var employeeId = "<%=employeeId%>";
		var divId = "employeeDeductionManagementDiv" + employeeId;
		
		$('#addDeductionLink').click(function(){
			$('#'+divId).load('showadddeductionformforemployee.jsp?employeeId='+employeeId);
		});
		
		$('#viewDeductionsLink').click(function(){
			$('#'+divId).load('showlistofdeductionsforemployee.jsp?employeeId='+employeeId);
		});
		
		$('#showListOfDeductionsForEditLink').click(function(){
			$('#'+divId).load('showlistofdeductionsforemployeeforedit.jsp?employeeId='+employeeId);
		});
		
		$('#showListOfDeductionsForDeleteLink').click(function(){
			$('#'+divId).load('showlistofdeductionsforemployeefordelete.jsp?employeeId='+employeeId);
		});
	});//end document.ready function
</script>