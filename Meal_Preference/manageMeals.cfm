<CFINCLUDE template="../Application.cfm">

<cfif parameterexists(form.eventid) >
        <cfquery datasource="#dsnP21#" name="put">
        INSERT INTO Meal_Preference
        (eventid, meal)
        VALUES
        ( <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventid#" >,  <cfqueryparam value="#form.meal#" >)
        SELECT @@IDENTITY AS id
        </cfquery>
<cfoutput>
  <tr id="mealID_#put.id#">
    <td>#form.meal#</td>
    <td><a href="javascript:DeleteMeal(#put.id#);"><img src="../img/erro_crossr.gif" border="0"></a></td>
  </tr>
</cfoutput>
</cfif>


<cfif parameterexists(form.id) >
        <cfquery datasource="#dsnP21#" >
        DELETE FROM Meal_Preference
        WHERE  id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
        
        </cfquery>

 </cfif>