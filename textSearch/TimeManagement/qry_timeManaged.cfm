<cfsilent>

    <cfparam name="form.TimeManagementID" default="0" type="integer">
    <cfparam name="form.staffID" default="#session.gpp_id#" type="integer">
    <cfparam name="form.TimeManagementDate" default="#now()#" type="date">
    
    <cfquery datasource="#gpp#" name="qryTimeManage">
        SELECT 
              [staffID]
             ,[TimeManagementDate]
             ,[TimeManagementTime]
             ,[TimeManagementDesc]
             ,[timeManagementInsertTime]
        FROM
            [TimeManagement]
        WHERE 
            [staffID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.staffID#"> 
			AND
                        
        <cfif parameterexists(form.startDate)>
        
        		<cfif form.startDate NEQ "" AND form.endDate NEQ "">
                    
                        (
                        [TimeManagementDate] >= <cfqueryparam cfsqltype="cf_sql_date" value="#form.startDate#"> AND
                        [TimeManagementDate] <= <cfqueryparam cfsqltype="cf_sql_date" value="#form.endDate#">
                        )
                <cfelse>
                		[TimeManagementDate] >= <cfqueryparam cfsqltype="cf_sql_date" value="#form.startDate#">
                </cfif>
        <cfelse>
        	[TimeManagementDate] = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">    
        </cfif>
            
<!---          <cfif form.TimeManagementID NEQ 0>
            AND
            [TimeManagementID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.TimeManagementID#">
        </cfif>--->
        
        
        GROUP BY staffID, TimeManagementDate, TimeManagementTime, TimeManagementDesc, timeManagementInsertTime
        ORDER BY [timeManagementInsertTime], [TimeManagementDate] DESC  
    </cfquery>
    
<!---    <cfquery datasource="#gpp#" name="qryTimeManageTotal">
        SELECT 
             SUM(TimeManagementTime) AS "total"
        FROM
            [TimeManagement]
WHERE 
            [staffID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.staffID#"> 
			AND
                        
        <cfif parameterexists(form.startDate)>
        
        		<cfif form.startDate NEQ "" AND form.endDate NEQ "">
                    
                        (
                        [TimeManagementDate] >= <cfqueryparam cfsqltype="cf_sql_date" value="#form.startDate#"> AND
                        [TimeManagementDate] <= <cfqueryparam cfsqltype="cf_sql_date" value="#form.endDate#">
                        )
                <cfelse>
                		[TimeManagementDate] >= <cfqueryparam cfsqltype="cf_sql_date" value="#form.startDate#">
                </cfif>
        <cfelse>
        	[TimeManagementDate] = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">    
        </cfif>
            
          <cfif form.TimeManagementID NEQ 0>
            AND
            [TimeManagementID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.TimeManagementID#">
        </cfif>

    </cfquery>

<cfscript>
function hoursMinutes(minutes) {
    var tempstr = "";
    var strHours = minutes / 60;
    var strMinutes = minutes MOD 60;
    var hourText = "";
    if (strHours gte 1) {
        if (strHours gte 2) {
            hourText = " hours ";
        } else {
            hourText = " hour ";
        }
        tempstr = Fix(strHours) & hourText;
    }
    
    if (strMinutes gt 0) {
        tempstr = tempstr & strMinutes & " minutes";
    }
    return tempstr;
}
</cfscript>--->

</cfsilent>