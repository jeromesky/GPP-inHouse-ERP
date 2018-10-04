<!---  <cfquery datasource="#dsnP21#" name="logo">SELECT id, company FROM logos ORDER BY company</cfquery>--->
<cfparam name="form.functionID" default="0">
<cfparam name="form.list" default="0">
<cfinclude template="qry_function.cfm">
<script type="text/javascript">
$("#functiondate").datepicker({dateFormat: 'dd MM yy'});
//$(".numeric").numeric({ decimal : ":" });
<cfif qryFunction.functionType NEQ 1>
$("#meals").css("visibility" , "hidden");</cfif>


$("#functionType").change(function(){
	var thisVal = $(this).val();
	
	if( thisVal == 0 ){
		$("#meals").css("visibility" , "hidden");
		$("#menuOptions").val("");
	}else if ( thisVal == 1 ){
		$("#meals").css("visibility" , "visible");
	}else if ( thisVal == 2 ){
		$("#meals").css("visibility" , "hidden");
		$("#menuOptions").val("");
	}
});
</script>
<cfoutput>
<input type="hidden" name="eventid" value="#form.eventid#" id="eventid" />
<input type="hidden" name="functionID" value="#form.functionID#" id="functionID" />
<input type="hidden" name="parentID" value="#form.parentID#" id="functionID" />
	<b></b>
    <i class="NoFormat" style="font-weight:bold">#formLabel#</i>
    
    <b>Selectable</b>
    <i class="NoFormat"><input type="checkbox" name="functionTrack" <cfif qryFunction.functionTrack EQ 1 >checked="checked" </cfif>/> for attendance count</i>
    
    <b>Type</b>
    <i class="NoFormat">
    	<select name="functionType" id="functionType" class="ui-corner-all">
        	<option value="0" <cfif qryFunction.functionType EQ 0>selected</cfif>>Select Function Type</option>
            <option value="1" <cfif qryFunction.functionType EQ 1>selected</cfif>>Meals</option>
            <option value="2" <cfif qryFunction.functionType EQ 2>selected</cfif>>Drinks</option>
            <option value="3" <cfif qryFunction.functionType EQ 3>selected</cfif>>Corporate ShowCase</option>
        </select>
    </i>
    <b>Title</b>
    <i class="NoFormat"><input type="text" name="functionTitle" maxlength="70" value="#qryFunction.functionTitle#" class="ui-corner-all" /></i>
    
    <b>Date</b>
    <i class="NoFormat"><input type="text" name="functiondate" id="functiondate" maxlength="60" value="#dateFormat(qryFunction.functionDate, "dd mmm yyyy")#" class="ui-corner-all" /></i>
    
    
    
    <b>Time start</b>
    <i class="NoFormat"><input type="text" name="functionTime" id="functionTime" maxlength="5" value="#qryFunction.functionTime#" class="ui-corner-all numeric" /></i>
    
    <b>Time end</b>
    <i class="NoFormat"><input type="text" name="functionTimeEnd" id="functionTimeEnd" maxlength="5" value="#qryFunction.functionTimeEnd#" class="ui-corner-all numeric" /></i>
    
    <b>Venue</b>
    <i class="NoFormat"><input type="text" name="functionVenue" id="functionVenue" maxlength="60" value="#qryFunction.functionVenue#" class="ui-corner-all" /></i>
    
    <b>Blurb</b>
    <i class="NoFormat"><textarea name="functionDetails" id="functionDetails" style="height:120px;" class="ui-corner-all">#qryFunction.functionDetails#</textarea></i>
    
    <b>Sponsor</b>
    <i class="NoFormat"><cfmodule template="../../my-officeX/_modules/module_companies_solo_id.cfm" textValue="#qryFunction.companyName#" hiddenValue="#qryFunction.companyID#">
    <!---<input type="text" name="companyName" id="companyName" value="#qryFunction.companyName#" class="ui-corner-all" /><input type="hidden" name="companyID" id="companyID" value="#qryFunction.companyID#" />---></i>
     <cfif qryFunction.companyID NEQ 0>
     <b></b>
    <i class="NoFormat">  <img src="http://www.petro21.com/_files/business/#qryFunction.mediaFile#"></i></cfif>
    
    <div id="meals">
    	<b>Meals</b>
    	<i class="NoFormat"><input type="text" name="menuOptions" id="menuOptions" value="#qryFunction.menuOptions#" class="ui-corner-all" maxlength="40" /><br />separate meals with a comma</i>
    </div>
    <b></b>
    <i class="NoFormat"><input name="submit" type="submit" value="submit" class="ui-corner-all"/></i>
</cfoutput>