<%@page import="com.payrolladmin.server.classes.*"%>
<%
	long employeeId = Long.parseLong(request.getParameter("employeeId"));
%>
<table border="0" width="100%">
	<tr style="background:#ccc;font-weight:bolder">
		<td><a href="#.jsp" id="addAllowanceLink">Add Allowance</a></td>
		<td><a href="#.jsp" id="viewAllowancesLink">View Allowances</a></td>
		<td><a href="#.jsp" id="showListOfAllowancesForEditLink">Edit Allowance</a></td>
		<td><a href="#.jsp" id="showListOfAllowancesForDeleteLink">Delete Allowance</a></td>
	</tr>
</table>
<%
	String divId = "employeeAllowanceManagementDiv" + employeeId;
%>
<div id="<%=divId %>"></div>
<script type="text/javascript">
	$(document).ready(function(){
		var employeeId = "<%=employeeId%>";
		var divId = "employeeAllowanceManagementDiv" + employeeId;
		
		$('#addAllowanceLink').click(function(){
			$('#'+divId).load('showaddallowanceformforemployee.jsp?employeeId='+employeeId);
		});
		
		$('#viewAllowancesLink').click(function(){
			$('#'+divId).load('showlistofallowancesforemployee.jsp?employeeId='+employeeId);
		});
		
		$('#showListOfAllowancesForEditLink').click(function(){
			$('#'+divId).load('showlistofallowancesforemployeeforedit.jsp?employeeId='+employeeId);
		});
		
		$('#showListOfAllowancesForDeleteLink').click(function(){
			$('#'+divId).load('showlistofallowancesforemployeefordelete.jsp?employeeId='+employeeId);
		});
	});//end document.ready function
</script>