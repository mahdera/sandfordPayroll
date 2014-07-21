<%@page import="com.payrolladmin.server.classes.*"%>
<form style="background:#eee">
	<table border="0" width="100%">
		<tr>
			<td><font color="red">*</font> Lower Boundary:</td>
			<td>
				<input type="text" name="txtlowerboundary" id="txtlowerboundary" size="30"/>
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> Upper Boundary:</td>
			<td>
				<input type="text" name="txtupperboundary" id="txtupperboundary" size="30"/>
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> Tax Rate Percentage:</td>
			<td>
				<input type="text" name="txttaxratepercentage" id="txttaxratepercentage" size="30"/>
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> Other Deduction:</td>
			<td>
				<input type="text" name="txtotherdeduction" id="txtotherdeduction" size="30"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="Save" id="btnsave" class="input-submit"/>
				<input type="reset" value="Clear" class="input-submit"/>
			</td>			
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		$('#txtlowerboundary').focus();
		
		$('#btnsave').click(function(){
			var lowerBoundary = $('#txtlowerboundary').val();
			var upperBoundary = $('#txtupperboundary').val();
			var taxRatePercentage = $('#txttaxratepercentage').val();
			var otherDeduction = $('#txtotherdeduction').val();
			
			if(lowerBoundary != "" && upperBoundary != "" && taxRatePercentage != "" && otherDeduction != ""){
				
				var dataString = "lowerBoundary="+lowerBoundary+"&upperBoundary="+upperBoundary+
				"&taxRatePercentage="+taxRatePercentage+"&otherDeduction="+otherDeduction;
				
				$.ajax({
				    url: 'savetaxrate.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#subTabDetailDiv').load('showaddtaxrateform.jsp');					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready funciton
</script>