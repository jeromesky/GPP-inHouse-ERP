<cfinclude template="../Application.cfm">

	<cfset fieldname =  #form.field# >
    <cfset palce =  #form.for#>
    <cfset datenow = dateformat(now(), "ddmmyy") >
     <cfset timenow = timeformat(now(), "hms") >




<!--- get the field values---------------------------------->
	<cfquery name="get_event" datasource="#gpp#">
   SELECT #fieldname#, event_abbr
   FROM tblAnnual_Conf
   WHERE webid = #form.id#
	</cfquery>
	<cfset fieldvalue =  "#Evaluate("get_event.#fieldname#")#" >
<cfif form.field NEQ "newsletterBannerTop" >
		<!--- check 4 existing file  and delete --->
            <cfif fieldvalue NEQ "" OR FileExists("G:\Websites\petro21\htdocs\post\templates\#fieldvalue#")>
                <CFFILE ACTION="DELETE" FILE="G:\Websites\petro21\htdocs\post\templates\#trim(fieldvalue)#">
            </CFIF>

</cfif>

<!--- upload new & add 2 db --->
	<CFFILE ACTION="Upload" FILEFIELD="form.Upload" DESTINATION="G:\Websites\petro21\htdocs\post\templates" nameconflict="MAKEUNIQUE">
    <cfset newname = "#get_event.event_abbr##palce#_#timenow#.#file.clientFileExt#">
	
    <cffile action="rename"  source="G:\Websites\petro21\htdocs\post\templates\#File.ServerFile#"  destination="G:\Websites\petro21\htdocs\post\templates\#newname#">
	<CFQUERY datasource="#gpp#">
    	UPDATE tblAnnual_Conf
    	Set #fieldname# = '#newname#' 
    	WHERE webid = #form.id#
	</cfquery>
    
    <cfoutput>#len(newname)#</cfoutput>