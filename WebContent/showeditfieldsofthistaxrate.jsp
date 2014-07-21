<%@page import="com.payrolladmin.server.classes.*"%>
<%
	int taxRateId = Integer.parseInt(request.getParameter("taxRateId"));
	TaxRate taxRate = TaxRate.getTaxRate(taxRateId);
	//now define the control names in here...
	String lowerBoundaryControlName = "txtlowerboundary" + taxRateId;
	String upperBoundaryControlName = "txtupperboundary" + taxRateId;
	String taxRatePercentageControlName = "txttaxratepercentage" + taxRateId;
	String otherDeductionControlName = "txtotherdeduction" + taxRateId;
%>
<form style="background:#eee">
	<table border="0" width="100%">
		<tr>
			<td><font color="red">*</font> Lower Boundary:</td>
			<td>
				<input type="text" name="<%=lowerBoundaryControlName %>" id="<%=lowerBoundaryControlName %>" size="30" value="<%=taxRate.getLowerBounday() %>"/>
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> Upper Boundary:</td>
			<td>
				<input type="text" name="<%=upperBoundaryControlName %>" id="<%=upperBoundaryControlName %>" size="30" value="<%=taxRate.getUpperBoundary() %>"/>
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> Tax Rate Percentage:</td>
			<td>
				<input type="text" name="<%=taxRatePercentageControlName %>" id="<%=taxRatePercentageControlName %>" size="30" value="<%=taxRate.getTaxRatePercentage() %>"/>
			</td>
		</tr>
		<tr>
			<td><font color="red">*</font> Other Deduction:</td>
			<td>
				<input type="text" name="<%=otherDeductionControlName %>" id="<%=otherDeductionControlName %>" size="30" value="<%=taxRate.getOtherDeduction() %>"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<%
					String buttonId = "btnupdate" + taxRateId;
				%>
				<input type="button" value="Update" id="<%=buttonId %>" class="input-submit"/>
				<input type="reset" value="Clear" class="input-submit"/>
			</td>			
		</tr>
	</table>
</form>
<script type="text/javascript">
	$(document).ready(function(){
		var taxRateId = "<%=taxRateId%>";
		var buttonId = "btnupdate" + taxRateId;
		
		$('#'+buttonId).click(function(){
			//now define the control names in here...
			var lowerBoundaryControlName = "txtlowerboundary" + taxRateId;
			var upperBoundaryControlName = "txtupperboundary" + taxRateId;
			var taxRatePercentageControlName = "txttaxratepercentage" + taxRateId;
			var otherDeductionControlName = "txtotherdeduction" + taxRateId;
			/////now get the values of the controls you have defined just above...
			var lowerBoundary = $('#'+lowerBoundaryControlName).val();
			var upperBoundary = $('#'+upperBoundaryControlName).val();
			var taxRatePercentage = $('#'+taxRatePercentageControlName).val();
			var otherDeduction = $('#'+otherDeductionControlName).val();
			
			if(taxRateId != "" && lowerBoundary != "" && upperBoundary != "" && taxRatePercentage != "" && otherDeduction != ""){
				
				var dataString = "lowerBoundary="+lowerBoundary+"&upperBoundary="+upperBoundary+
				"&taxRatePercentage="+taxRatePercentage+"&otherDeduction="+otherDeduction+
				"&taxRateId="+taxRateId;
				
				$.ajax({
				    url: 'updatetaxrate.jsp',		
				    data: dataString,
				    type:'POST',
				    success:function(response){
				    		$('#subTabDetailDiv').load('showlistoftaxratesforedit.jsp');					
				    },
				    error:function(error){
						alert(error);
				    }
				});
			}
		});
	});//end document.ready funciton
</script>