<cfinclude template="qry_sponsors.cfm">

<fieldset>
	<legend>Sponsorships</legend>
	<!---<input type="hidden" name="contractTypeGroup" id="contractTypeGroup" value="#form.contractTypeGroup#" />    --->



<div class="tableContainer">
	<div class="tableRow">
    		<div class="tableColData">Event</div>
    		<div class="tableColData">Description</div>
            <div class="tableColData">sponsorType</div>
            <div class="tableColAction"></div>
    </div>
  <cfoutput query="get_sponsors">
	<div class="tableRow">
    		<div class="tableColData">#get_sponsors.eventName#</div>
    		<div class="tableColData">#get_sponsors.sponsorLabel#</div>
            <div class="tableColData">#get_sponsors.typeLabel#</div>
            <div class="tableColAction">
            	<a href="javascript:loadSponsorForm(#get_sponsors.contractID#, '#get_sponsors.typeGroup#', #get_sponsors.sponsorID#);">
                	<div class="ui-state-default ui-corner-all" style="padding: 0pt 0.1em;">
                    <em class="ui-icon ui-icon-arrowthickstop-1-s"></em>
                    </div>
                </a>
            </div>
    </div>
</cfoutput>
</div>
</fieldset>
