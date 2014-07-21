<%@page import="com.payrolladmin.server.classes.*"%>
<%
	long retainedWithSchoolId = Long.parseLong(request.getParameter("retainedWithSchoolId"));
	RetainedWithSchool retainedWithSchool = RetainedWithSchool.getRetainedWithSchool(retainedWithSchoolId);
	//now define the control names in here...
	String percentValueControlName = "txtpercentvalue"+retainedWithSchoolId;
	String balanceControlName = "txtbalance"+retainedWithSchoolId;
%>
<form style="background:lightyellow">
	<table border="0" width="100%">
		<tr>
			<td><font color="red">*</font> Percent Value:</td>
			<td>
				<input type="text" name="<%=percentValueControlName %>" id="<%=percentValueControlName%>" size="30" value="<%=retainedWithSchool.getPercentValue() %>"/> %
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> Balance:</td>
			<td>
				<input type="text" name="<%=balanceControlName %>" id="<%=balanceControlName %>" size="30" value="<%=retainedWithSchool.getBalance() %>"/>
			</td>
		</tr>
		<tr>			
			<td colspan="2" align="right">
				<%
					String buttonId = "btnupdate" + retainedWithSchoolId;
				%>
				<input type="button" value="Update" class="input-submit" id="<%=buttonId %>"/>
				<input type="reset" value="Undo" class="input-submit"/>
			</td>
		</tr>
	</table>	
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var retainedWithSchoolId = "<%=retainedWithSchoolId %>";
		var buttonId = "btnupdate"+retainedWithSchoolId;
		
		$('#'+buttonId).click(function(){
			//now define the control names in here...
			var percentValueControlName = "txtpercentvalue"+retainedWithSchoolId;
			var balanceControlName = "txtbalance"+retainedWithSchoolId;
			//get the values using the control names you have defined just above....
			var percentValue = $('#'+percentValueControlName).val();
			var balance = $('#'+balanceControlName).val();
			
			if(retainedWithSchoolId != "" && percentValue != "" && balance != ""){
				var dataString = "retainedWithSchoolId="+retainedWithSchoolId+"&percentValue="+percentValue+"&balance="+balance;
				
				$.ajax({
				    url: 'updateretainedwithschool.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#subTabDetailDiv').load('showlistofretainedwithschoolforedit.jsp');					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready function
</script>