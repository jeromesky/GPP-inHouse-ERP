<cfinclude template="../contract/qry_contracts.cfm">
<cfoutput>
<!---<cfset eventID = form.eventID>
<cfset contractTypeGroup = form.contractTypeGroup>--->

    
    
<div id="contractForm"></div>
<!---
<fieldset>
	<legend>Contracts</legend>
	<input type="hidden" name="contractTypeGroup" id="contractTypeGroup" value="#form.contractTypeGroup#" />   ---> 



<div class="tableContainer">
	<div class="tableRow">
    		<div class="tableColData">added on</div>
            <div class="tableColData">packages for</div>
            <!---<div class="tableColData">packages</div>--->
            <div class="tableColAction">Status</div>
            <div class="tableColAction">edit</div>
            <cfif  Listcontains("jerome",  trim(Session.username), ",")  >
            <div class="tableColAction">delete</div></cfif>
            <div class="tableColAction">files</div>
            <div class="tableColAction">logo</div>
            
    </div>
  <cfloop query="get_contracts">
	<div class="tableRow" id="contractID_#get_contracts.contractid#">
    		<div class="tableColData">#dateFormat(get_contracts.contractDateAdded, "d.mm.yyyy")#</div>
            <div class="tableColData"><a href="javascript:openWindow({ url:'../contract/packages.cfm', param: {'contractID': #get_contracts.contractid#}, Args:modals.packages});">#get_contracts.companyName#</a></div>
            <!---<div class="tableColData">(#get_contracts.packagesCount#)</div>--->
            <div class="tableColAction">#get_contracts.statusInternal#</div>
            <div class="tableColAction">
            	<a href="javascript:loadContractForm(#get_contracts.contractid#);">
                	<div class="ui-state-default ui-corner-all" style="padding: 0pt 0.1em;">
                    <em class="ui-icon ui-icon-arrowthick-1-e"></em>
                    </div>
                </a>
            </div>
            <cfif  Listcontains("jerome",  trim(Session.username), ",")  >
            <div class="tableColAction">
            	<a href="javascript:deleteContract(#get_contracts.contractid#);">
                	<div class="ui-state-error ui-corner-all" style="padding: 0pt 0.1em;">
                    <em class="ui-icon ui-icon-circle-close"></em>
                    </div>
                </a>
            </div>
            </cfif>
            <div class="tableColAction">
            	<cfif get_contracts.contractFile NEQ "">Contact Files</cfif>
            </div>
            <div class="tableColData"><img src="http://www.petro21.com/_files/business/#trim(get_contracts.logo)#"  border="0" width="66" height="28" /></div>
    </div>
</cfloop>
</div>
<!---</fieldset>--->
</cfoutput>