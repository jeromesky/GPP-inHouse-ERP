<cfinclude template="../Application.cfm">

<cfif parameterexists(form.deleteid)>
		
        <cfquery datasource="#dsnP21#" name="getfile">
        	SELECT docsfilename 
            FROM docs 
            WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.deleteid#"> 
        </cfquery>
        
        
			<cfif  FileExists("G:\Websites\petro21\htdocs\econf\#getfile.docsfilename#")>
				<CFFILE ACTION="DELETE" FILE="G:\Websites\petro21\htdocs\econf\#getfile.docsfilename#">
			</CFIF>
        
        
        <cfquery datasource="#dsnP21#" >
        	DELETE FROM docs 
            WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.deleteid#"> 
       </cfquery>
      
      
 </cfif>