<cfinclude template="../application.cfm">
<cfif parameterexists(url.action)>
<cfquery name="get" datasource="#dsnP21#"  >
SELECT * from welcomePack
WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
</cfquery>

<cfquery name="del" datasource="#dsnP21#"  >
DELETE from welcomePack
WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
</cfquery>
<cffile 
   action = "delete"
   file = "G:\websites\my-office\event_registrations\welcomePack\#get.filepath#">
<cflocation url="creatPack.cfm">
</cfif>

<cffile action="upload" 
        filefield="Form.filepath" 
		destination= "G:\websites\my-office\event_registrations\welcomePack"
		nameconflict="overwrite">
      <cfquery datasource="#dsnP21#" >

	    Insert welcomePack(
	    eventid,
		filename,
		filepath,
		dateloladed   	    
	    )
        Values(
		'#listGetAt(form.event,1)#',
		'#listGetAt(form.event, 2)#',
	   '#File.ServerFile#',
	   '#DateFormat(Now(), "dd-mm-yyyy")#' 
	   
       )

     </cfquery>

<cflocation url="creatPack.cfm">