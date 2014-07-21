<%@page import="com.payrolladmin.server.classes.*" %>
<%
	int langId = Integer.parseInt(session.getAttribute("langId").toString());
%>
<div>	
	<!-- Tabs --> 
			<h3 class="tit">Administrator Fields Tab </h3> 
 
			<div class="tabs box"> 
				<ul>					
					<li><a href="#.jsp" id="allowanceLink"><span>Allowance</span></a></li>
					<li><a href="#.jsp" id="currencyLink"><span>Currency</span></a></li>
					<li><a href="#.jsp" id="deductionLink"><span>Deduction</span></a></li>
					<li><a href="#.jsp" id="foreignExchangeCurrencyRateLink"><span>ForEx Rate</span></a></li>
					<!-- <li><a href="#.jsp" id="gratuityLink"><span>Gratuity</span></a></li>-->
					<li><a href="#.jsp" id="payrollEmployeeTypeMappingLink"><span>Employee Type Mapping</span></a></li>
					<li><a href="#.jsp" id="retainedWithSchoolLink"><span>Retained with School</span></a></li>
					<li><a href="#.jsp" id="taxPayerLink"><span>Tax Payer</span></a></li>
					<li><a href="#.jsp" id="taxRateLink"><span>Tax Rate</span></a></li>																									
				</ul> 
			</div> <!-- /tabs --> 
			 
			<div id="tabDetailDiv"> 			
				<p class="msg info">Click on the administrator fields tab for manipulating fields</p>			
			</div>			
			<div id="subTabDetailDiv"></div>
			<div class="fix"></div> 
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#allowanceLink').click(function(){
			$('#tabDetailDiv').load('showallowanceinnermenu.jsp');
		});
		
		$('#currencyLink').click(function(){
			$('#tabDetailDiv').load('showcurrencyinnermenu.jsp');
		});
		
		$('#deductionLink').click(function(){
			$('#tabDetailDiv').load('showdeductioninnermenu.jsp');
		});
		
		$('#taxRateLink').click(function(){
			$('#tabDetailDiv').load('showtaxrateinnermenu.jsp');
		});
		
		$('#payrollEmployeeTypeMappingLink').click(function(){
			$('#tabDetailDiv').load('showpayrollemployeetypemappinginnermenu.jsp');	
		});
		
		$('#foreignExchangeCurrencyRateLink').click(function(){
			$('#tabDetailDiv').load('showforexrateinnermenu.jsp');
		});
		
		$('#gratuityLink').click(function(){
			$('#tabDetailDiv').load('showgratuityinnermenu.jsp');
		});
		
		$('#taxPayerLink').click(function(){
			$('#tabDetailDiv').load('showtaxpayerinnermenu.jsp');
		});
		
		$('#retainedWithSchoolLink').click(function(){
			$('#tabDetailDiv').load('showretainedwithschoolinnermenu.jsp');
		});
	});//end document.ready function
</script>