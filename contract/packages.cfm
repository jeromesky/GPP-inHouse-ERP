<cfparam name="form.contractID" default="0">
<cfinclude template="../contract/qry_contractForm.cfm">
<!---<cfscript>
 Rid = createObject("component", "Officecfc.randomID");
 randomID = Rid.randomID();
</cfscript>--->
<cfoutput>
<script type="text/javascript">
delete packages;
var packages = {};
	packages.contractID = #form.contractID#;
</script>
<div class="c4">



	<div  class="ui-corner-all marginBottom15  ui-widget ui-widget-content  podForm podBgFade_bl">
    	<fieldset >
        	<input type="hidden"  id="contractID" value="#form.contractID#" />
        	<legend class="ui-corner-all">Add package Type to events</legend>
            	<b>event</b>
                <i class="NoFormat">
                		<cf_events_dropDown eventID="0" fieldName="packageEventID" elapse="0" operator="=" eventType="week" multiple="0"  >
                 </i>
                 
                 <b>package Type</b>
                 <i class="NoFormat">
                 	<cf_Types name="packagetypeID" cat="package" catid="0" id="0"> 
                 </i>
            	<b></b>
                <i class="NoFormat"><button id="button_addPackage" onclick="javascript:createPackage();" class="ui-corner-all">Add package</button></i>
                <b></b>
                <i class="NoFormat" id="packageProcess"></i>
    		</fieldset>
    </div>
    
    <div class="ui-corner-all marginBottom15  ui-widget ui-widget-content  podForm podBgFade">
    	<fieldset >
        	<legend class="ui-corner-all">Packages</legend>
            <ul id="contract2packages" class="listMenu">
            	<li></li>
            	<cfinclude template="dsp_packages.cfm">
            </ul>     
        </fieldset>
    </div>
    
    	<div  class="ui-corner-all marginBottom15  ui-widget ui-widget-content  podForm">
    	<fieldset >
        	<legend class="ui-corner-all">Add package for contract</legend>
            <b>Company</b>
            <i class="NoFormat">#qryContract.companyName#</i>
            
            <cfif qryContract.AKA_companyName NEQ "">
            <b>Label</b>
            <i class="NoFormat">#qryContract.AKA_companyName#</i></cfif>
            
            <cfif qryContract.branchName NEQ "">
            <b>Publication</b>
            <i class="NoFormat">#qryContract.branchName#</i></cfif>
            
            <b>Contact</b>
            <i class="NoFormat">#qryContract.contact#</i>
    	</fieldset>
    </div>

</div>

<div class="c8">
	<div id="package" >
    
    </div>

</div>
</cfoutput>