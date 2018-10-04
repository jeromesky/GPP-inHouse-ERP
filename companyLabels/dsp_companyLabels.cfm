
<cfparam name="form.companyID" default="#form.companyID#">
<cfinclude template="qry_companyLabelList.cfm">
	<div class="ui-dialog-titlebar ui-widget-header ui-corner-top ui-helper-clearfix podHeader"><spam class="ui-dialog-title">Labels for <cfoutput>#qryLabelList.companyName#</cfoutput></spam></div>
    <div id="AKA_companyListPane" class="ui-corner-bottom  ui-widget ui-widget-content ">

<ul class="listMenu full_width">
	<cfoutput query="qryLabelList">
	<li>
	<input type="radio" value="#qryLabelList.AKA_companyID#" name="companyLabel" id="#qryLabelList.AKA_companyName#" class="aka_companyLabel"  alt="AKA_company_labelDisplay"  src="tblIndividual" title="#form.userID#" <cfif qryLabelList.AKA_companyID  EQ form.AKA_companyID>checked</cfif> />
    <span class="manageLabel cursorPointer" id="#qryLabelList.AKA_companyID#">#qryLabelList.AKA_companyName#</span></li></cfoutput>
</ul>
</div><!---<cfif form.userID NEQ 0></cfif>--->