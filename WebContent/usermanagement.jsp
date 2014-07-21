<!-- Now comes the tabs section mahder -->
<div>	
	<!-- Tabs --> 
	<h3 class="tit">User's Detail Tab</h3> 

	<div class="tabs box"> 
		<ul> 
			<li><a href="#.jsp" id="createUserLink"><span>Create User</span></a></li>
			<li><a href="#.jsp" id="showListOfUsersLink"><span>View Users</span></a></li> 
			<li><a href="#.jsp" id="showListOfUsersForEditLink"><span>Edit User</span></a></li> 
			<li><a href="#.jsp" id="showListOfUsersForDeleteLink"><span>Delete User</span></a></li> 
		</ul> 
	</div> <!-- /tabs --> 
	 
	<div id="tabDetailDiv"> 			
		<p class="msg info">Click on the user's tab for manipulating user details</p>			
	</div>			
	
	<div class="fix"></div> 
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#createUserLink').click(function(){
			$('#tabDetailDiv').load('createuser.jsp');
		});
		
		$('#showListOfUsersLink').click(function(){
			$('#tabDetailDiv').load('showlistofusers.jsp');
		});
		
		$('#showListOfUsersForEditLink').click(function(){
			$('#tabDetailDiv').load('showlistofusersforedit.jsp');
		});
		
		$('#showListOfUsersForDeleteLink').click(function(){
			$('#tabDetailDiv').load('showlistofusersfordelete.jsp');
		});
	});//end document.ready function
</script>
