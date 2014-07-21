<%@page import="com.payrolladmin.server.classes.*" %>
<div>	
	<!-- Tabs --> 
			<h3 class="tit">Payroll Process Management Tab </h3> 
 
			<div class="tabs box"> 
				<ul>					
					<li><a href="#.jsp" id="newPayrollLink"><span>New Payroll</span></a></li>
					<li><a href="#.jsp" id="viewPayrollLink"><span>View Payrolls</span></a></li>
					<li><a href="#.jsp" id="editPayrollLink"><span>Edit Payroll</span></a></li>
					<!-- <li><a href="#.jsp" id="deletePayrollLink"><span>Delete Payroll</span></a></li>-->																									
				</ul> 
			</div> <!-- /tabs --> 
			 
			<div id="tabDetailDiv"> 			
				<p class="msg info">Click on the payroll fields tab for manipulating fields</p>			
			</div>			
			<div id="subTabDetailDiv"></div>
			<div class="fix"></div> 
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#newPayrollLink').click(function(){
			$('#tabDetailDiv').load('shownewpayrollform.jsp');
		});
		
		$('#viewPayrollLink').click(function(){
			$('#tabDetailDiv').load('showlistofpayrolls.jsp');
		});
		
		$('#editPayrollLink').click(function(){
			$('#tabDetailDiv').load('showlistofpayrollsforedit.jsp');
		});
		
		$('#deletePayrollLink').click(function(){
			$('#tabDetailDiv').load('showlistofpayrollsfordelete.jsp');
		});
	});//end document.ready function
</script>