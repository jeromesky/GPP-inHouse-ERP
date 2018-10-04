<cfinclude template="../Application.cfm">
<cfif parameterexists(url.delete)>
	<cfquery datasource="#dsnP21#">
	DELETE FROM hotels WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.delete#">
    </cfquery>
</cfif>

 	<CFQUERY datasource="#dsnP21#" name="gethotels">
		SELECT hotels.id, hotels.hotelname, hotels.hotellink, hotels.hotellogo, hotels.city, hotels.groupid
		FROM hotels
        ORDER BY hotelname
<!---        groupby.groupby
		FROM groupby RIGHT JOIN  hotels
        ON groupby.id IN (hotels.groupid)--->
		</CFQUERY>      
<table width="800" border="0" cellspacing="5">
<cfoutput query="gethotels">
<cfquery datasource="#dsnP21#" name="getgroup">SELECT groupby FROM groupby WHERE id IN (#gethotels.groupid#)</cfquery>

  <tr >
    <td width="51" style="border-bottom:1px solid ##EDEDED"><img src="../../docs/#gethotels.hotellogo#" border="0" /></td>
    <td width="210" style="border-bottom:1px solid ##EDEDED">#gethotels.hotelname#</td>
    <td width="138" style="border-bottom:1px solid ##EDEDED"><cfloop query="getgroup">#getgroup.groupby#, </cfloop></td>
    <td width="131" style="border-bottom:1px solid ##EDEDED">#gethotels.city#</td>
    <td width="52" style="border-bottom:1px solid ##EDEDED">&nbsp;</td>
    <td width="16" style="border-bottom:1px solid ##EDEDED"><a href="javascript:editHotel(#gethotels.id#)"><img src="../img/new_edit.gif" border="0" /></a></td>
    <td width="16" style="border-bottom:1px solid ##EDEDED"><a href="javascript:deleteHotel(#gethotels.id#)"><img src="../img/new_delete.gif" border="0" /></a></td>
  </tr>
 </cfoutput>
</table>