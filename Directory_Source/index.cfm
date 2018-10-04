<cfinclude template="../areas/qry_areas.cfm">
<script type="text/javascript">

 $(document).ready(function() {
 		$("#DirectoryDate").datepicker( {dateFormat: "d MM yy" });	 
		$('#areaDirectory_list').load("../Directory_Source/dsp_directoryList.cfm");
		
		
		    $('#new_Directory').submit(function() { 
				$(this).ajaxSubmit({
											clearform	: true,
											success	: function(data){
											 					$("#directoryList_table tr:first").html(data);
															}
											}); 
				return false; 
		});
 });
 </script>
 <form id="new_Directory"  method="post" action="../Directory_Source/qry_directorySave.cfm">
<div class="ui-corner-all marginBottom15  ui-widget ui-widget-content  podForm c4">
 	<b>Name</b>
    <i class="NoFormat"> <input type="text" name="strSource_Code_Description" id="strSource_Code_Description" class="ui-corner-all" maxlength="50" />  </i>
    
    <b>Publication Source</b>
    <i class="NoFormat"><input type="text" name="DirectorySource" id="DirectorySource" class="ui-corner-all"  maxlength="100" /></i>
    
    <b>Publication Date</b>
    <i class="NoFormat"><input type="text" name="DirectoryDate" class="ui-corner-all"  id="DirectoryDate" /></i>
    
    <b></b>
    <i class="NoFormat"><button class="ui-corner-all" >Add</button></i>
    <div class="clear"></div>
    <fieldset>
    	<legend>Areas of interest</legend>
        
        <ul class="listMenu">
        	<cfoutput query="qry_areas">
        	<li><input type="checkbox" name="areaList" value="#qry_areas.areaID#">#qry_areas.areaName#</li>
            </cfoutput>
        </ul>
        
   </fieldset>
 
</div>
</form>
<!---<div style=" border:2px solid #CCCCCC; padding:5px">
<table border="0" cellspacing="3" cellpadding="0" >
  <tr>
    <td>Directory Name</td>
    <td>
      <input type="text" name="strSource_Code_Description" id="strSource_Code_Description" maxlength="50" />    </td>
    <td rowspan="5">Directory Region of Interest</td>
    <td rowspan="5" valign="top">
    	<cfloop startrow="1" endrow="#(qry_areas.recordCount/2)#" query="qry_areas"><cfoutput>
    	<label><input type="checkbox" name="areaList" value="#qry_areas.areaID#">#qry_areas.areaName#</label>
    	</cfoutput></cfloop>    </td>
        <td rowspan="5" valign="top">
    	<cfloop startrow="#(qry_areas.recordCount/2)#" endrow="#qry_areas.recordCount#" query="qry_areas"><cfoutput>
    	<label><input type="checkbox" name="areaList" value="#qry_areas.areaID#">#qry_areas.areaName#</label>
    	</cfoutput></cfloop>    </td>
  </tr>
  <tr>
    <td>Directory Publication Source</td>
    <td><input type="text" name="DirectorySource" id="DirectorySource" maxlength="100" /></td>
    </tr>
  <tr>
    <td>Directory Publication Date</td>
    <td><input type="text" name="DirectoryDate" id="DirectoryDate" /></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input name="" value="Add" type="submit" /></td>
    </tr>
</table>
</form>

</div>--->
<div id="areaDirectory_list" class="ui-corner-all marginBottom15  ui-widget ui-widget-content  c5">

</div>
<!---<div id="areaDirectory_list" style=" overflow:auto">
</div>--->