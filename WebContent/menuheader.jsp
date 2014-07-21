<%@page import="com.payrolladmin.server.classes.*"%>
<%@page import="java.util.*" %>
<!-- Menu --> 
	<div id="menu" class="box">		 
		<%
			List<PayrollFunctionality> functionalityList = PayrollFunctionality.getAllFunctionalities();
			Iterator<PayrollFunctionality> functionalityItr = functionalityList.iterator();
			//Account acct = (Account)session.getAttribute("account");			
		%> 
		<ul class="box"> 
			<%
			while(functionalityItr.hasNext()){
				PayrollFunctionality functionality = functionalityItr.next();				
			%>
				<li><strong><a href="#.jsp" title="<%=functionality.getDescription()%>" onclick="performThisFunction('<%=functionality.getFunctionalityName() %>')"><span><%=functionality.getMenuName()%></span></a></strong></li>
			<%				
			}//end while loop
			%>			 
		</ul>  
</div> <!-- /header --> 
<script type="text/javascript">
function performThisFunction(menuName) {
	if (menuName == "adminFieldsManagement") {		
		$('#content').load('showadminfieldsmanagement.jsp');
	} else if (menuName == "employeeAllowanceManagement") {		
		$('#content').load('showemployeeallowancemanagement.jsp');
	} else if (menuName == "employeeDeductionManagement") {		
		$('#content').load('showemployeedeductionmanagement.jsp');
	} else if(menuName == "employeeOvertimeManagement"){
		$('#content').load('showemployeeovertimemanagement.jsp');
	} else if(menuName == "payrollProcessManagement"){
		$('#content').load('showpayrollprocessmanagement.jsp');
	} else if(menuName == "advanceManagement"){
		$('#content').load('showadvancemanagement.jsp');
	} else if(menuName == "employeeLoanManagement"){
		$('#content').load('showemployeeloanmanagement.jsp');
	} else if(menuName == "payslipManagement"){
		$('#content').load('showemployeepayslipmanagement.jsp');
	} else if(menuName == "accountManagement"){
		$('#content').load('accountmanagement.jsp');
	} else if(menuName == "userManagement"){
		$('#content').load('usermanagement.jsp');
	}
}
</script>