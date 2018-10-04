<cfinclude template="../application.cfm">
<cfquery datasource="#gpp#" name="getevent">
 	select  IngConference_ID, lngCon_ID, webID, strConference_Code, event_expire, cancelled,  event_type,
    CASE                   
                                            WHEN event_name <> ' ' 
                                            THEN event_name   
                                            ELSE strConference_Name
                                            END AS strConference_Name
	from tblAnnual_Conf
    WHERE   lngCon_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
    ORDER BY event_expire 
</cfquery>
<table  border="0" cellspacing="1" cellpadding="4" style="background-color:#CCCCCC" width="100%">
	<tr>
    	<td align="right">add a conference <a href="javascript:LoadConferencePane(0 , <cfoutput>#form.id#</cfoutput>);" ><img src="../img/new_add.gif" border="0" /></a></td>
    </tr>
 </table>

<table  border="0" cellspacing="1" cellpadding="4" id="table_weekevent">
      <tr bordercolor="#F2F2F2" >
        <td width="325">event</td>
        <td  width="60">date</td>
        <td  width="40">webID</td>
        <td  width="25">view</td>
	
        
      </tr>
<cfoutput query="getevent">
      <tr <cfif getevent.cancelled EQ 1 >bgcolor="##FFCDD6" </cfif> >
        <td >#getevent.strConference_Name#&nbsp; (#getevent.event_type#)</td>
        <td  ><cfif getevent.event_expire NEQ "">#datepart("yyyy", getevent.event_expire)#</cfif>&nbsp;</td>
        <td   >#getevent.webID#&nbsp;</td>
        <td  ><a href="javascript:LoadConferencePane(#getevent.IngConference_ID#, #getevent.lngCon_ID#);" ><img src="../img/refresh16.gif" border="0" /></a></td>
      </tr>
 </cfoutput>
    </table>
