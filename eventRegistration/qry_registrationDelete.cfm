<cfset reg_eventID 	= "lngConference_ID">
<cfset reg_userID	= "lngIndividual_ID" >
<cfset inv_eventID 	= 'AConfID'>
<cfset inv_userID 	= "IND_ID" >

<cfquery datasource="#gpp#" name="qry_ID">
        SELECT 
        	[IngClient_Conf_ID]
        
        FROM
            [tblConference_Registration]
       WHERE
            [#reg_eventID#] 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#eventID#"> AND
            [#reg_userID#]		= <cfqueryparam cfsqltype="cf_sql_integer" value="#userID#"> <!---AND
            [#attendType#]		= <cfqueryparam cfsqltype="cf_sql_integer" value="1">---> 
</cfquery>

<cfquery datasource="#gpp#">
        DELETE
        FROM
            [tblConference_Registration]
                
       WHERE
            [IngClient_Conf_ID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#qry_ID.IngClient_Conf_ID#"> 
</cfquery>

<cfquery datasource="#gpp#">
        DELETE
       FROM
            [tblInvoiceDetails]
       WHERE
       		[Conf_Reg_ID] 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#qry_ID.IngClient_Conf_ID#"> <!---AND
            [#inv_eventID#] 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#eventID#"> AND
            [#inv_userID#]	= <cfqueryparam cfsqltype="cf_sql_integer" value="#userID#">--->
</cfquery>