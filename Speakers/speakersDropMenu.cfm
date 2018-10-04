<cfinclude template="../Application.cfm">
<cfquery datasource="#dsnP21#" name="getconference">
  SELECT id, name
  FROM speakers 
  ORDER BY name
</cfquery>
<select name="Person" id="Person" style="width:410px"><cfoutput query="getconference">
    <option value="#getconference.id#">#getconference.name#</option></cfoutput>
</select>