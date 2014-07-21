<%@page import="com.payrolladmin.server.classes.*" %>
<div>	
	<!-- Tabs --> 
			<h3 class="tit">Account Management Tab</h3> 
 
			<div class="tabs box"> 
				<ul> 
					<li><a href="#.jsp" id="changeUsernameLink"><span>Change Username</span></a></li>					 
					<li><a href="#.jsp" id="changePasswordLink"><span>Change Password</span></a></li>
					<%
					Account acct = (Account)session.getAttribute("account");
					if(acct.getMemberType().equals("Administrator")){
					%> 
						<li><a href="#.jsp" id="showResetUsersAccountLink"><span>Reset Users Account</span></a></li>
					<%
					}
					%>
				</ul>				
			</div> <!-- /tabs --> 
			 
			<div id="tabDetailDiv"> 			
				<p class="msg info">Click on the account management tabs for manipulating fields</p>			
			</div>			
			<div id="subTabDetailDiv"></div>
			<div class="fix"></div> 
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#changeUsernameLink').click(function(){
			$('#tabDetailDiv').load('showchangeusernameform.jsp');
		});
		
		$('#changePasswordLink').click(function(){
			$('#tabDetailDiv').load('showchangepasswordform.jsp');
		});
		
		$('#showResetUsersAccountLink').click(function(){
			$('#tabDetailDiv').load('showaccountsforreset.jsp');
		});
	});//end document.ready function
</script>