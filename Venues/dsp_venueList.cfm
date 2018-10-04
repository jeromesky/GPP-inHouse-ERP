<cfinclude template="../Application.cfm">
<cfif parameterexists(form.delete)>
	<cfquery datasource="#gpp#">
	DELETE FROM venues WHERE venueID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.delete#">
    </cfquery>
</cfif>

 	<CFQUERY datasource="#gpp#" name="getVenue">
        SELECT 
               [countryNameEN]
              ,[CityNameEN]
              ,[VenueName]
              ,[venueLogo]
              ,[venueID]
          FROM 
                [CRM_Venues]
          ORDER 
          		BY countryNameEN, VenueName 
		</CFQUERY>      

<table border="0" cellpadding="2" cellspacing="2">
<cfoutput query="getVenue">
  <tr >
    <td   style="border-bottom:1px solid ##EDEDED"><img src="../../docs/#getVenue.venueLogo#" border="0" /></td>
    <td   style="border-bottom:1px solid ##EDEDED">#getVenue.countryNameEN#</td>
   <td   style="border-bottom:1px solid ##EDEDED">#getVenue.CityNameEN#</td>
    
    <td   style="border-bottom:1px solid ##EDEDED">#getVenue.VenueName#</td>

    <td width="25" style="border-bottom:1px solid ##EDEDED"><a href="javascript:loadvenueForm(#getVenue.venueID#)"><img src="../img/new_edit.gif" border="0" /></a></td>
    <td width="16" style="border-bottom:1px solid ##EDEDED"><a href="javascript:deleteVenuel(#getVenue.venueID#)"><img src="../img/new_delete.gif" border="0" /></a></td>
  </tr>
 </cfoutput>
</table>