<cfinclude template="../Application.cfm" >

<cfif form.choose eq "email">

<cfquery datasource="#dsnP21#" >
    DELETE  
    FROM MailOut_configuration 
    WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>

</cfif>

<!--- delete template stuff ---->
<cfif form.choose eq "template">
        <cfquery datasource="#dsnP21#" name="getData">
        	SELECT * 
            FROM MailOut_template 
            WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#"></cfquery>

        <cfquery datasource="#dsnP21#" >
            DELETE 
            FROM MailOut_template 
            WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
        </cfquery>

        <cfif getData.filename NEQ "" AND FileExists("G:\Websites\petro21\htdocs\post\templates\#getData.filename#")>
                <CFFILE ACTION="DELETE" FILE="G:\Websites\petro21\htdocs\post\templates\#trim(getData.filename)#">
        </CFIF>
</cfif>

<cfif form.choose eq "shedule">
        <cfquery datasource="#dsnP21#" >
            DELETE   
            FROM MailOut_calendar 
            WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
        </cfquery>
</cfif>

<cfif form.choose eq "attachement">
        <cfquery datasource="#dsnP21#" name="getAttachment">
            SELECT id, filename  
            FROM MailOut_attachment 
            WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#"> 
        </cfquery>
                
<!--- check 4 existing file and delete --->
		<cfif getAttachment.filename NEQ "" AND FileExists("G:\websites\my-office\Mailing\attachements\#getAttachment.filename#")>
            <CFFILE ACTION="DELETE" FILE="G:\websites\my-office\Mailing\attachements\#getAttachment.filename#">
        </CFIF>                
        
        <cfquery datasource="#dsnP21#" >
            DELETE 
            FROM MailOut_attachment 
            WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#getAttachment.id#"> 
        </cfquery>
</cfif>