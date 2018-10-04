<!--- update unsub --->
<cfif form.value EQ 0>

    <cfquery datasource="#gpp#">
        UPDATE user2area 
        SET
            areaDateEnd = <cfqueryparam cfsqltype="cf_sql_decimal" value="#now()#">,
            areaActive	= 0
        WHERE 
            userID 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
        AND 
          areaID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.areaID#">
    </cfquery>

</cfif>

<!--- add/update sub --->
<cfif form.value EQ 1>

        <!--- try to find record to update --->
        <cfquery datasource="#gpp#" name="findRecord">
        SELECT 
        		user2areaID 
        FROM
        		user2area
        WHERE 
        	userID 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#"> AND 
            areaID	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.areaID#"> AND 
            deliveryFormat 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.deliveryFormat#"> 
        </cfquery>

        <!--- IF FIND UPDATE --->
        <cfif findRecord.recordcount GT 0>

                <cfquery datasource="#gpp#">
                UPDATE user2area
                SET
                    areaDate = <cfqueryparam cfsqltype="cf_sql_decimal" value="#now()#">,
                    areaActive = 1
                WHERE 
                    user2areaID = <cfqueryparam cfsqltype="cf_sql_integer" value="#findRecord.user2areaID#">
                </cfquery>

        <cfelse>

                <!--- if none, Add --->
                <cfquery datasource="#gpp#">
                INSERT INTO user2area
                    (userID
                    ,areaID
                    ,areaDate
                    ,areaActive
                    ,deliveryFormat 
                    )
                VALUES
                    (<cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
                    ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.areaID#">
                    ,<cfqueryparam cfsqltype="cf_sql_decimal" value="#now()#">
                    ,1
                    ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.deliveryFormat#">
                    )
                </cfquery>
        </cfif>
</cfif>
<cfinclude template="../components/qry_userUpdate.cfm">

<!--- Check data ----->
<cfquery datasource="#gpp#" name="CheckRecord">
SELECT 
    user2areaID
    ,areaActive
FROM
    user2area
WHERE 
userID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#"> AND 
areaID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.areaID#">
</cfquery>
<cfif form.value EQ CheckRecord.areaActive >
    		<cfset updated = "successfull">
   <cfelse>
   			<cfset updated = "error">
   </cfif>
<cfoutput>update: #updated#</cfoutput>