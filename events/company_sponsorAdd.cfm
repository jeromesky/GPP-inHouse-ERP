<cfinclude template="../Application.cfm" >
<cfoutput>
<cfquery datasource="#dsnP21#" name="getlogo">
SELECT company, logofile FROM logos 
WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>
<!-------- addd banner to db ---->

<cfquery datasource="#gpp#" name="get">
SELECT    
		#form.field# 
FROM 
		tblAnnual_Conf 
WHERE 
		webid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventid#">
</cfquery>

<cfset fieldToUpdate = ListAppend(evaluate("get.#form.field#"), form.id, ",") >


<cfquery datasource="#gpp#" >
UPDATE  
	 tblAnnual_Conf 
SET   
	#form.field#   = '#fieldToUpdate#'     
WHERE 
	webid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventid#">
</cfquery>

	<div id="#form.id#" class="row" >	 
			<div class="col1"><img src="../../_files/business/#getlogo.logofile#" /></div>
			<div class="col2" > #getlogo.company# <a href="javascript:deleteLogo(#form.id#, #form.eventid#, '#form.field#');"><img src="../img/new_delete.gif" border="0" /></a></div>
	</div></cfoutput>
