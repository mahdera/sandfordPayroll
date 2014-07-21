<%@page import="com.payrolladmin.server.classes.*" %>
<div>	
	<!-- Tabs --> 
			<h3 class="tit">Employee Overtime Management Tab </h3> 
 
			<div class="tabs box"> 
				<ul>					
					<li><a href="#.jsp" id="addOvertimeLink"><span>Add Overtime</span></a></li>
					<li><a href="#.jsp" id="viewOvertimeLink"><span>View Overtime</span></a></li>
					<li><a href="#.jsp" id="editOvertimeLink"><span>Edit Overtime</span></a></li>
					<li><a href="#.jsp" id="deleteOvertimeLink"><span>Delete Overtime</span></a></li>																									
				</ul> 
			</div> <!-- /tabs --> 
			 
			<div id="tabDetailDiv"> 			
				<p class="msg info">Click on the overtime fields tab for manipulating fields</p>			
			</div>			
			<div id="subTabDetailDiv"></div>
			<div class="fix"></div> 
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#addOvertimeLink').click(function(){
			$('#tabDetailDiv').load('showaddovertimeform.jsp');
		});
		
		$('#viewOvertimeLink').click(function(){
			$('#tabDetailDiv').load('showlistofovertime.jsp');
		});
		
		$('#editOvertimeLink').click(function(){
			$('#tabDetailDiv').load('showlistofovertimeforedit.jsp');
		});
		
		$('#deleteOvertimeLink').click(function(){
			$('#tabDetailDiv').load('showlistofovertimefordelete.jsp');
		});
	});//end document.ready function
</script>