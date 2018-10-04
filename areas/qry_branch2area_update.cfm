<!--- update unsub --->

<cfif form.value EQ 0>

        <cfquery datasource="#gpp#">
        DELETE FROM 
        	[branch2area]
        
        WHERE 
        	[branchid] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.branchid#"> AND
            [areaID]		= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.areaID#">
        </cfquery>

</cfif>

<!--- add/update sub --->
<cfif form.value NEQ 0>

        <!--- try to find record to update --->
        <cfquery datasource="#gpp#" name="findRecord">
        INSERT INTO 
        		branch2area
                (
                branchID
                ,areaID
                )
      	VALUES
        	(
            <cfqueryparam cfsqltype="cf_sql_integer" value="#form.branchid#">
            ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.areaID#">
            )
        </cfquery>
  
</cfif>


