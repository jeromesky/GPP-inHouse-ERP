<cfinclude template="../Application.cfm">

<CFQUERY datasource="#gpp#" Name="result">
SELECT 
        eventID AS id, 
         
        event_name, 
        YEAR(event_expire) AS event_year, 
        event_expire
FROM 
  	CRM_events
WHERE 
        event_expire >= <cfqueryparam cfsqltype="cf_sql_date" value="#DateAdd('m', -12, now())#"> 
 		AND (event_type = 'din' OR event_type = 'event' OR event_type = 'eb' or event_type = 'Bu_Pr')
Order By 
 	 	event_expire desc
 </CFQUERY>
 <script language="javascript">
 function unloadUser() {
 $("#LoadAreaUser").html("");
			$("#LoadAreaUser").remove("");
			}
			unloadUser();
 </script>

<div style="height:500px; overflow:auto">
 <table width="100%" border="0" cellspacing="0" cellpadding="3" style="color:#333333">
 <cfoutput query="result">
  <tr onMouseOver="style.backgroundColor='##c2eeff';" onMouseOut="style.backgroundColor='##F2F2F2';">
    <td>#event_name# #event_year#</td>
    <td>#dateFormat(event_expire, "dd mmm yyyy")#</td>
    <td width="20"><input type="checkbox" name="id" id="#result.id#" value="#result.id#"></td>
    <td width="40"></td>
  </tr></cfoutput>
  <tr>
  	<td><input type="hidden" name="userid" value="<cfoutput>#url.userid#</cfoutput>"></td>
    <td colspan="3"><input type="submit" name="button" id="button" value="Submit"></td>
  </tr>
</table>
</div>