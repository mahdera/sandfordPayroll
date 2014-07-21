<div class="padding box"> 
 
				<!-- Logo (Max. width = 200px) --> 
				<p id="logo"><a href="#"><img src="design/juticeogo.PNG" alt="Our logo"/></a></p> 
 
				<!-- Search --> 
				    
					<fieldset> 
						<legend><font color="#5872a7" size="2"><b><u>Search</u></b></font></legend>
 						
						<p><input type="text" size="17" name="txtsearchquery" id="txtsearchquery" class="input-text" />&nbsp;
						<input type="button" value="OK" class="input-submit-02" id="btngenericsearch"/><br /> 
						<a href="javascript:toggle('search-options');" class="ico-drop"></a></p> 
 						<font size="1" color="#5872a7"><strong>
 							Searches Employee by [First name, father name, grand father name or
 							id number]</strong>
 						</font>
					</fieldset> 
				<!-- Create a new project --> 
				<p id="btn-create" class="box"><a href="userhome.jsp"><span id="selectedFunctionalitySpan">User Home</span></a></p> 
				
			</div> <!-- /padding --> 
<script type="text/javascript">
	$(document).ready(function(){
		$('#btngenericsearch').click(function(){
			var searchItem = $('#txtsearchquery').val();
			if(searchItem != ""){
				$('#content').load('showsearchresult.jsp?searchItem='+searchItem);
			}
		});
	});//end document.ready function
</script>