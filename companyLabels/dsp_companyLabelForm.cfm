
<cfinclude template="qry_companyLabels.cfm">
<cfoutput>
<fieldset >
    	<legend class="ui-corner-all">#formLabelDisplay#</legend>
        <input type="hidden" id="companyAKA_AKA_companyID" value="#form.AKA_companyID#">
        <b>Company</b>
        <i class="NoFormat">#qryCompanyLabel.companyName#</i>
        <b>Print Label</b>
        <i class="NoFormat"><input type="text" id="companyAKA_AKA_companyName" value="#qryCompanyLabel.AKA_companyName#" class="ui-corner-all"/></i>
        <b>Company URL</b>
        <i class="NoFormat"><input type="text" id="companyAKA_AKA_companyURL" value="#qryCompanyLabel.AKA_companyURL#" class="ui-corner-all"/></i>
        <b></b>
        <i class="NoFormat"><button class="ui-corner-all" onClick="javascript:SaveCompanyLabel();" id="AKA_companyButton">Save</button></i>
</fieldset>
</cfoutput>