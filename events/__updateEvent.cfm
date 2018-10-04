
<!---
<cfquery datasource="#dsnP21#">
		UPDATE		speakers_program

		SET			comment = <cfqueryparam cfsqltype="cf_sql_varchar" value="#Trim(form.content)#" />
		WHERE		id = <cfqueryparam cfsqltype="cf_sql_integer" value="#Trim(Right(form.ID, Len(form.ID)-5))#" />
</cfquery>
--->



<cfoutput>
<cfloop collection="#form#" item="fname">#fname#=#form[fname]# /><br /></cfloop>
</cfoutput>
