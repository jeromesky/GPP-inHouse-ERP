<cfset toogleCounter = 1>
<cfoutput>
<div align="left">

<form name="register" method="post" action="?">
<input type="hidden" name="fa" value="audienceAdd">

<fieldset>
  <legend>Create an Audience</legend>

    <label>Name</label><input type="text" name="audienceName" maxlength="50"><br />

  <fieldset>
    <legend onClick="toggle_visibility('#toogleCounter#');">Interest/s</legend>
    <div id="#toogleCounter#" class="hidden"><cfset toogleCounter = toogleCounter +1>
    <table>
    <tr><cfloop query="qry_areas">
    <td><input type="checkbox" class="checkbox" name="interestID" id="interestID" value="#qry_areas.areaID#" />#qry_areas.areaName#</td>
    <cfif qry_areas.currentRow MOD 4 is 0></tr><tr></cfif></cfloop></tr>
    </table>
    </div>
  </fieldset>

 <!---<fieldset>
    <legend onClick="toggle_visibility('#toogleCounter#');">Regions of the World</legend>
    <div id="#toogleCounter#" class="hidden"><cfset toogleCounter = toogleCounter +1>
    <!---
    <table>
    <tr><cfloop query="qry_xxx">
    <td><input type="checkbox" class="checkbox" name="areaID" id="areaID" value="#qry_xxx.areaID#" />#qry_xxx.areaName#</td>
    <cfif qry_xxx.currentRow MOD 4 is 0></tr><tr></cfif></cfloop></tr>
    </table> ---> To be add shortly
    </div>
  </fieldset> --->

  <fieldset>
    <legend onClick="toggle_visibility('#toogleCounter#');">Country</legend>
    <div id="#toogleCounter#" class="hidden"><cfset toogleCounter = toogleCounter +1>
    <cf_country_dropDown_multiple countryid="0" fieldName="countryID"><br/>
    </div>
  </fieldset>
  
  <fieldset>
    <legend onClick="toggle_visibility('#toogleCounter#');">Business Focus</legend>
    <div id="#toogleCounter#" class="hidden"><cfset toogleCounter = toogleCounter +1>
    <table>
    <tr><cfloop query="qrySectors">
    <td><input type="checkbox" class="checkbox" name="sectorID" id="sectorID" value="#qrySectors.sectorID#" />#qrySectors.sectorName#</td>
    <cfif qrySectors.currentRow MOD 4 is 0></tr><tr></cfif></cfloop></tr>
    </table>
    </div>
  </fieldset>
 
  <fieldset>
    <legend onClick="toggle_visibility('#toogleCounter#');">Company</legend>
    <div id="#toogleCounter#" class="hidden"><cfset toogleCounter = toogleCounter +1>
    <table>
    <tr>
    <td valign="top">Search:</td>
    <td><div><input id="fbautocomplete_id" type="text" name='companyid' /></div></td>
      </tr>
      </table>      
      </div>
  </fieldset>

  <fieldset>
    <legend onClick="toggle_visibility('#toogleCounter#');">Roles / Positions / BPA Designation</legend>
    <div id="#toogleCounter#" class="hidden"><cfset toogleCounter = toogleCounter +1>
    <table>
    <tr><cfloop query="qryRole">
        <td align='top' valign="left"><input type="checkbox" class="checkbox" name="RoleID" value="#roleID#"/>#qryRole.roleLabel#</td>
        <cfif qryRole.currentRow MOD 2 is 0></tr><tr></cfif>
        </cfloop></tr>
    </table>
        </div>
  </fieldset>

  <fieldset>
   <legend onClick="toggle_visibility('#toogleCounter#');">Events</legend>
    <div id="#toogleCounter#" class="hidden"><cfset toogleCounter = toogleCounter +1>  
    <cf_events_dropDown eventID="0" fieldName="eventid" elapse="1" operator="IN" eventType="din,event,Bu_pr"><br>
    <hr color="white">
     <table>
    <tr>
    <td>Registered: </td>
    <td><input type="radio" class="checkbox" name="registeredPersons" id="ex" value="ex" /> Excluded</td>
    <td><input type="radio" class="checkbox" name="registeredPersons" id="incl" value="incl" />Included</td>
    <td> </td>
    </tr>
    <tr><cfset numlist = 1>
    <cfloop list="#listAttendendance#" index="ll" DELIMITERS="|">
    <td><input type="checkbox" class="checkbox" name="Attendendance" id="#ll#" value="#ll#" />#ll#</td>
    <cfif numlist MOD 4 is 0></tr><tr></cfif><cfset numlist = numlist +1>
    </cfloop></tr>
    </table>
    </div>
  </fieldset>

<br />

<label>&nbsp;</label><input type="submit" name="submit" value="Save Audience"><br />

</fieldset>

</form>

</div>
</cfoutput>