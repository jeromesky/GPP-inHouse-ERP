<!---<cfset boothID = form.boothID>

<cfif form.boothID EQ 0>
	<cfquery name="new_booth" datasource="#gpp#">
       <!--- INSERT INTO [contracts] (contractDateAdded,  staffIDAdded )
        VALUES  ( <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">,  <cfqueryparam cfsqltype="cf_sql_integer" value="#session.gpp_id#"> )
        SELECT @@IDENTITY AS boothID--->
        SELECT  TOP 1
        		[boothID]
        FROM 
        		[booths]
        ORDER
        		BY boothID DESC
        
	</cfquery>
    <cfset boothID =  (new_contract.boothID +1)> 
</cfif>--->


<cfquery name="get_booth" datasource="#gpp#">
SELECT
      [sponsorID]
      ,[eventID]
      ,[contractID]
      ,[companyID]
      ,[boothLabel]
      ,[boothSize]
      ,[boothLocation]
      ,[bookedDated]
      ,[boothFloor]
      ,[fileID]
      ,[boothComments]
      ,[boothid]
      ,[boothStatusExternalID]
      ,[boothStatusInternalID]
  FROM 
  		[booths]
  WHERE 
  		[boothID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.boothID#">
</cfquery>



