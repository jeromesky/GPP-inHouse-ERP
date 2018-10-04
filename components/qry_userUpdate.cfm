<cfquery datasource="#gpp#" name="change">
    INSERT INTO tblGlopacHistory (unregisterDate)
    VALUES (<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">)
    SELECT @@IDENTITY AS id             
</cfquery> 

<cfset recordID = ""> 
<cfif parameterexists(form.id)>
	<cfset recordID = #form.id#>
<cfelseif parameterexists(form.userid)>
	<cfset recordID = #form.userid#>
</cfif>

<cfquery datasource="#gpp#" name="change">  
  UPDATE 
       tblGlopacHistory
	SET 
        [UserID] 			= <cfqueryparam value="#session.staffID#">
        ,[UserName]			= <cfqueryparam value="#Session.staffName#">
        ,[UserDateNum] 		= <cfqueryparam value="#dateformat(now(), "yyyymmdd")#">
        ,[RecordWorked] 	= <cfqueryparam value="#recordID#">
        <cfif parameterexists(editedField)>
        ,[RecordDetails] 	= <cfqueryparam value="#editedField#"></cfif>
        <cfif parameterexists(form.oldValue)>
        ,[RecordORGValue] 	= <cfqueryparam value="#form.oldValue#"></cfif>
        <cfif parameterexists(form.value)>
        ,[RecordNEWValue] 	= <cfqueryparam value="#form.value#"></cfif>
	WHERE 
        RecIDX = <cfqueryparam cfsqltype="cf_sql_integer" value="#change.id#">
 </cfquery>     