<cfinclude template="qry_branch2area.cfm">
<!---<script type="text/javascript">
$('.branch2area:checkbox').live('change', function(){
			var get_ThisArea 	= $(this).attr("checked") ? $(this).val() : 0
			var get_areaID 		= $(this).val();
			var get_branchID 	= $(this).attr("id");
			
			
				//alert(get_areaID);
				$.post("../areas/qry_branch2area_update.cfm", {"branchID" : get_branchID, "areaID": get_areaID, "value" : get_ThisArea }, function(rdata){ 
						//growl  
						
						if(get_ThisArea != 0 ){
						 $(this).parent().css('background-color', '#66FF99'); 
						 $(this).parent().css('background-color', '#FFCC66');
						}else{
										
						}
						
						});
});
</script>--->
<ul class="listMenu">
		<cfoutput query="qry_areas"><li><!---<label class="SelectArea" >---><input type="checkbox" name="" class="branch2area" id="#form.value#" value="#qry_areas.areaID#" <cfif qry_areas.area NEQ ""> checked="checked" </cfif> />#qry_areas.areaName#</li><!---</label>---></cfoutput></ul>
<!---</fieldset>--->