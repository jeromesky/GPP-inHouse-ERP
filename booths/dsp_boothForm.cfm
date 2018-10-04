<cfparam name="form.boothID" default="0">
<cfparam name="form.sponsorID" default="0">

<cfinclude template="qry_boothForm.cfm">
<cfoutput>
<script type="text/javascript">
	<!---var boothID = #form.boothID#;--->
	var sponsorID = #form.sponsorID#;

$(document).ready(function() {
 $('##boothForm').submit( function() { 
		$(this).ajaxSubmit({ clearForm : false, success : function(){ $('##buttonSaveBooth').css({ 'visibility' : 'hidden'  });   } }); 
		return false; 
		
    });
)};
</script>

<fieldset >
	<legend> Exhibit</legend>
<form action="../booths/qry_booth_Save.cfm" method="post" id="boothForm">
<input type="hidden" name="boothID" id="boothID" value="#get_booth.boothID#"  />
<input type="hidden" name="sponsorID" id="sponsorID" value="#form.sponsorID#"  />
<b>Client Status</b>
<i class="NoFormat">
<cf_status name="boothStatusExternalID" cat="3" id="#get_booth.boothStatusExternalID#">
</i>

<b>GPP Status</b>
<i class="NoFormat"> 
<cf_status name="boothStatusInternalID" cat="4" id="#get_booth.boothStatusInternalID#">
</i>

 
  <b>Description</b> 
<i class="NoFormat">
 <input type="text" name="boothLabel" id="boothLabel" value="#get_booth.boothLabel#"  class="ui-corner-all" />
 </i>

 <b>Size</b>
<i class="NoFormat">
  <input type="text" name="boothSize" id="boothSize" value="#get_booth.boothSize#"   class="ui-corner-all"/>
 </i>
 
  <b>location</b>
<i class="NoFormat">
 <input type="text" name="boothLocation" id="boothLocation" value="#get_booth.boothLocation#"  class="ui-corner-all" />
 </i>
 
 <b>Booked dated</b>
<i class="NoFormat">
 <input type="text" name="bookedDated" id="bookedDated" value="#DateFormat(get_booth.bookedDated, "ddd mmm yyyy")#"  class="ui-corner-all" />
 </i>
 
 <b>Booth Floor</b>
<i class="NoFormat">
   <input type="radio" name="boothFloor" value="1" <cfif get_booth.boothFloor EQ 1> checked="checked" <cfelseif get_booth.boothFloor NEQ 2> checked="checked"</cfif> />
    ground  
  <input type="radio" name="boothFloor" value="2"  <cfif get_booth.boothFloor EQ 2> checked="checked"</cfif> />
    first
 </i>
 
<!--- <b>file</b>
 <i class="NoFormat">
Add file / select file	
 </i>--->

 <b>Comments</b>
 <i class="NoFormat">
<textarea  name="boothComments" id="boothComments"  class="ui-corner-all" />#get_booth.boothComments#</textarea>
 </i>
 
  <b></b>
 <i class="NoFormat">
<button id="buttonSaveBooth" >Save</button>
 </i>
</form>
</fieldset>
</cfoutput>