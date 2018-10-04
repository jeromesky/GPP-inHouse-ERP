<cfinclude template="../Application.cfm">


<cfif parameterexists(form.eventID) >
            <cfquery  datasource="#gpp#" name="get" >
            INSERT INTO staff2event (eventID, staffID, contactTypeID)
            VALUES	 (
                                <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#" >
                                ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.staffID#" >
                                ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.contactTypeID#" >
                            )
            SELECT @@IDENTITY AS id
            </cfquery>
            
            <cfquery name="get_Contact2Staff" datasource="#gpp#" >
            SELECT TOP 1000 
                    [contactTypeDescription]
                  ,[contact2staffID]
                  ,[eventID]
                  ,[StaffName]
              FROM 
                    [CRM_staff2event]
              WHERE [staff2eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#get.id#">
            </cfquery>
            
            
           <cfoutput query="get_Contact2Staff">
                  <tr  id="contact_#get_Contact2Staff.contact2staffID#">
                    <td>#get_Contact2Staff.StaffName#</td>
                    <td>#get_Contact2Staff.contactTypeDescription#</td>
                    <td><a href="javascript:DeleteFunction('../contacts2staff/qry_editContactList.cfm', #get_Contact2Staff.contact2staffID#, 'contact_');">remove</a></td>
                  </tr>
        </cfoutput>
            
</cfif>


<cfif parameterexists(form.deleteID) >
            <cfquery  datasource="#gpp#" >
            DELETE  FROM
                    staff2event 
            WHERE staff2eventID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.deleteID#" >
            
            </cfquery>
</cfif>