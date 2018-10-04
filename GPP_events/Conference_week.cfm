
<cfquery datasource="#gpp#" name="getGroup">
 	select  *
	from tblConference
    WHERE week = <cfqueryparam value="#form.id#" >
    ORDER BY weekDate DESC
</cfquery>

<table  border="0" cellspacing="1" cellpadding="4" style="background-color:#CCCCCC" width="100%">
	<tr>
    	<td align="right">add a new Week <a href="javascript:LoadWeekPane(0 , <cfoutput>#form.id#</cfoutput>);" ><img src="../img/new_add.gif" border="0" /></a></td>
    </tr>
 </table>
<table  border="0" cellspacing="1" cellpadding="4" id="table_weekgroups">
      <tr bordercolor="#F2F2F2" >
        <td  width="480">name</td>
        <td   width="60">date</td>
        <td   width="40">webID</td>

        <td   width="25">view</td>
		<td   width="25">edit</td>
      </tr>
<cfoutput query="getGroup">
      <tr >
        <td  >#getGroup.strConference_Description#&nbsp;</td>
        <td   ><cfif getGroup.weekDate NEQ "">#datepart("yyyy", getGroup.weekDate)#</cfif>&nbsp;</td>
        <td    >#getGroup.web_id#&nbsp;</td>

        <td   ><a href="javascript:ViewWeek(#getGroup.IngCon_ID#);" ><img src="../img/refresh16.gif" border="0" /></a></td>
        <td   ><a href="javascript:LoadWeekPane(#getGroup.IngCon_ID#, #form.id#);" ><img src="../img/refresh16.gif" border="0" /></a></td>
      </tr>
 </cfoutput>
    </table>
