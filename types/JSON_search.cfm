<cfset start = "[" >
<cfset end = "]" >
<cfset content = "">
<cfset contentString = "">
<cfset fullReturn = "[{optionValue:'',optionDisplay:'' }]">

<cfif form.typeID NEQ "" AND  Isnumeric(form.typeID) >
            <cfquery datasource="#gpp#" name="qry_types" >
            SELECT 
            		[typeID]
                    ,[typeLabel]
  			FROM 
  					[types]
            WHERE
            		[typeGroupID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.typeID#">  
            ORDER 
            		BY [typeOrder]
            </cfquery>
            
            

                  <cfloop query="qry_types">
					  <cfset contentString = "{optionValue:#qry_types.typeID#, optionDisplay: '#qry_types.typeLabel#'}" >
                      <cfset content = ListAppend(content, contentString, ",") >
                  </cfloop>
                  <cfset fullReturn = start & content & end >
</cfif>               
                  
                  <cfoutput>#fullReturn#</cfoutput>