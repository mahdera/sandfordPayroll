<%@page import="com.payrolladmin.server.classes.*" %>
<div>	
	<!-- Tabs --> 
			<h3 class="tit">Advance Payment Process Management Tab </h3> 
 
			<div class="tabs box"> 
				<ul>					
					<li><a href="#.jsp" id="newAdvancePaymentLink"><span>New Advance Payment</span></a></li>
					<li><a href="#.jsp" id="viewAdvancePaymentsLink"><span>View Advance Payments</span></a></li>
					<li><a href="#.jsp" id="editAdvancePaymentLink"><span>Edit Advance Payment</span></a></li>
					<li><a href="#.jsp" id="deleteAdvancePaymentLink"><span>Delete Advance Payment</span></a></li>																									
				</ul> 
			</div> <!-- /tabs --> 
			 
			<div id="tabDetailDiv"> 			
				<p class="msg info">Click on the advance payment fields tab for manipulating fields</p>			
			</div>			
			<div id="subTabDetailDiv"></div>
			<div class="fix"></div> 
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#newAdvancePaymentLink').click(function(){
			$('#tabDetailDiv').load('shownewadvancepaymentform.jsp');
		});
		
		$('#viewAdvancePaymentsLink').click(function(){
			$('#tabDetailDiv').load('showlistofadvancepayments.jsp');
		});
		
		$('#editAdvancePaymentLink').click(function(){
			$('#tabDetailDiv').load('showlistofadvancepaymentforedit.jsp');
		});
		
		$('#deleteAdvancePaymentLink').click(function(){
			$('#tabDetailDiv').load('showlistofadvancepaymentfordelete.jsp');
		});
	});//end document.ready function
</script>