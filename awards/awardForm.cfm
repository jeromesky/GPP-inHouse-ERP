<cfinclude template="../Application.cfm">
<cfquery datasource="#dsnP21#" name="event">
SELECT id, event_name, event_year 
FROM events 
WHERE event_type = 'event' OR event_type = 'eb' OR event_type = 'din' 
ORDER by event_expire DESC</cfquery>
<cfif parameterexists(url.edit)>
<cfquery datasource="#dsnP21#" name="get">
SELECT * FROM awards WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.edit#">
</cfquery>
<cfoutput>
<table width="800" border="0" cellspacing="4">
      <tr>
        <td width="115">Award name</td>
        <td width="228"><input type="text" name="awardname" value="#get.awardname#"  maxlength="45" /></td>
        <td width="199" >award year</td>
        <td width="230" ><input type="text" name="awardyear" value="#get.awardyear#"  maxlength="4" /></td>
      </tr>
      <tr>
        <td valign="top">Description</td>
        <td colspan="3" valign="top"><input  name="conf"  maxlength="80" value="#get.conf#" style=" width:650px" /></td>
      </tr>
      <tr>
        <td valign="top">Recipient</td>
        <td valign="top"><input type="text" name="recipient" value="#get.recipient#"></td>
        <td valign="top">Reason</td>
        <td><textarea name="Reason" style="height:60px">#get.Reason#</textarea></td>
      </tr>
      <tr>
        <td>Position</td>
        <td><input type="text" name="delegation" value="#get.delegation#" maxlength="80" /></td>
        <td>Company</td>
        <td><input type="text" name="company" value="#get.company#" maxlength="80" /></td>
      </tr>
      <tr>
        <td>award for event</td>
        <td colspan="2">
            <select name="eventid" >
            <cfloop query="event"><cfoutput>	
                <option value="#event.id#" <cfif event.id EQ get.eventid >selected</cfif> >#event.event_name# #event.event_year#</option>
            </cfoutput></cfloop>
            </select>        </td>
        <td><input name="save" type="submit" value="save" /><input type="hidden" name="id" value="#url.edit#"></td>
      </tr>
    </table>
</cfoutput>
<cfelse>
    <table width="800" border="0" cellspacing="4">
      <tr>
        <td width="115">Award name</td>
        <td width="228"><input type="text" name="awardname"  maxlength="100" /></td>
        <td width="199" >award year</td>
        <td width="230" ><input type="text" name="awardyear"  maxlength="4" /></td>
      </tr>
      <tr>
        <td valign="top">Description</td>
        <td colspan="3" valign="top"><input  name="conf"  maxlength="80" style="width:650px" /></td>
      </tr>
      <tr>
        <td valign="top">Recipient</td>
        <td valign="top"><input type="text" name="recipient" maxlength="250" ></td>
        <td valign="top">Reason</td>
        <td><textarea name="Reason" style="height:60px"></textarea></td>
      </tr>
      <tr>
        <td>Position</td>
        <td><input type="text" name="delegation" maxlength="80" /></td>
        <td>company</td>
        <td><input type="text" name="company" maxlength="80" /></td>
      </tr>
      <tr>
        <td>award for event</td>
        <td colspan="2"><select name="eventid" >
            <cfoutput query="event"><option value="#event.id#">#event.event_name# #event.event_year#</option>
            </cfoutput>
            </select></td>
        <td><input name="save" type="submit" value="save" /></td>
      </tr>
    </table>
</cfif>