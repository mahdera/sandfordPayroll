<%@page import="com.payrolladmin.server.classes.*" %>
<div>	
	<!-- Tabs --> 
			<h3 class="tit">Employee Pay Slip Management Tab </h3> 
 
			<div class="tabs box"> 
				<ul>					
					<li><a href="#.jsp" id="generatePaySlipLink"><span>Generate Pay Slip</span></a></li>																														
				</ul> 
			</div> <!-- /tabs --> 
			 
			<div id="tabDetailDiv"> 			
				<p class="msg info">Click on the employee pay slip generate tab to generate pay slip for employees.</p>			
			</div>			
			<div id="subTabDetailDiv"></div>
			<div class="fix"></div> 
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#generatePaySlipLink').click(function(){
			$('#tabDetailDiv').load('showpayslipgeneratorparameterselectionbar.jsp');
		});		
	});//end document.ready function
</script>