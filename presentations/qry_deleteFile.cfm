<cfsilent>
<cfquery name="qryFindFile" datasource="#gpp#">     
   SELECT 
   		[libraryTitle]
        ,[libraryID]
   FROM
   		[library]
   WHERE
   		[libraryID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.libraryID#">

</cfquery>

<cfif FileExists("G:\files\library\#qryFindFile.libraryTitle#")>
	<CFFILE ACTION="DELETE" FILE="G:\files\library\#qryFindFile.libraryTitle#">
</cfif>

<cfset tempFileName = #listDeleteAt(qryFindFile.libraryTitle, 1, "_")#>

<cfif FileExists("G:\websites\petro21\_files\library\#tempFileName#")>
	<CFFILE ACTION="DELETE" FILE="G:\websites\petro21\_files\library\#tempFileName#">
</cfif>

<cfquery datasource="#gpp#">
   DELETE  
   FROM
   		[library]
   WHERE
   		[libraryID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.libraryID#">
</cfquery>
</cfsilent>


<cfoutput>{"libraryID" : #form.libraryID#}</cfoutput>