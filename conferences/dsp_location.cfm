<cfinclude template="qry_location.cfm">
<cfscript>
 Rid = createObject("component", "Officecfc.randomID");
 randomID = Rid.randomID();
</cfscript>
<cfoutput>
<script type="text/javascript">
	var eventLocation = {};
	eventLocation.eventID 		= #form.eventID#;
	eventLocation.thisWindow 	= $("##eventLocation").parent().attr("id");
	
	$(document).ready(function() {
    $('##formEventLocation').submit(function() { 
		$(this).ajaxSubmit( { clearForm: false, success: actionEventLocationSave(#randomID#)	}); 
		return false; 	
		}); 
	});
	
	
	
</script>
<div class="ui-corner-bottom ui-widget ui-widget-content podForm" id="eventLocation" >
<form action="../conferences/qry_location_update.cfm" method="post" id="formEventLocation">

<fieldset>
    	<legend class="ui-corner-all">Edit event location</legend>
        <input type="hidden" value="#form.eventID#" name="eventID">
        <cf_country_suggest  country="#qryEventLocation.countryName#" countryfieldname="eventLocation_countryName"  countryID="#qryEventLocation.countryID#"  fieldname="countryID" random="#randomID#">
        
        <cf_city_suggest  city="#qryEventLocation.cityName#" cityfieldname="eventLocation_cityName" cityID="#qryEventLocation.cityID#"  fieldname="cityID" countryFieldname="countryID" random="#randomID#" >

        <cf_venue_suggest textName="eventLocation_venue"  textValue="#qryEventLocation.VenueName#" hidID="hotel" hidName="hotel" hidValue="#qryEventLocation.venueID#" countryID="#qryEventLocation.countryID#" random="#randomID#" >
        
        <b>Room name</b>
        <i class="NoFormat"><input type="text" class="ui-corner-all" value="#qryEventLocation.venuRoom#" id="eventLocation_venuRoom" name="venuRoom" /></i>
        <b></b>
        <i class="NoFormat"><button class="ui-corner-all">Save</button></i>
</fieldset>
</form></div>
</cfoutput>