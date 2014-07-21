<%@page import="com.payrolladmin.server.classes.*" %>
<div>	
	<!-- Tabs --> 
			<h3 class="tit">Employee Loan Management Tab </h3> 
 
			<div class="tabs box"> 
				<ul>					
					<li><a href="#.jsp" id="newEmployeeLoanLink"><span>New Employee Loan</span></a></li>
					<li><a href="#.jsp" id="viewEmployeeLoanLink"><span>View Employee Loans</span></a></li>
					<li><a href="#.jsp" id="editEmployeeLoanLink"><span>Edit Employee Loan</span></a></li>
					<li><a href="#.jsp" id="deleteEmployeeLoanLink"><span>Delete Employee Loan</span></a></li>																									
				</ul> 
			</div> <!-- /tabs --> 
			 
			<div id="tabDetailDiv"> 			
				<p class="msg info">Click on the employee loan fields tab for manipulating fields</p>			
			</div>			
			<div id="subTabDetailDiv"></div>
			<div class="fix"></div> 
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#newEmployeeLoanLink').click(function(){
			$('#tabDetailDiv').load('shownewemployeeloanform.jsp');
		});
		
		$('#viewEmployeeLoanLink').click(function(){
			$('#tabDetailDiv').load('showlistofemployeeloans.jsp');
		});
		
		$('#editEmployeeLoanLink').click(function(){
			$('#tabDetailDiv').load('showlistofemployeeloanforedit.jsp');
		});
		
		$('#deleteEmployeeLoanLink').click(function(){
			$('#tabDetailDiv').load('showlistofemployeeloanfordelete.jsp');
		});
	});//end document.ready function
</script>