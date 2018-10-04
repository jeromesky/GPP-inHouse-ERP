<cfswitch expression="#qryUser.active#">
  <cfcase value="0">
      <cfset activeText = "This user is in Archived mode">
      <cfset warningColors = "warningBorder">
  </cfcase>
  <cfcase value="1">
      <cfset activeText = "This user is in Current mode ">
      <cfset warningColors = "warningBorderOk warningBgOk">
  </cfcase>
  <cfcase value="2">
      <cfset activeText = "This user is in Temporary mode ">
      <cfset warningColors = "warningBorderOk warningBgOk">
  </cfcase>
  <cfcase value="5">
      <cfset activeText = "<strong>This user is in Freeze mode</strong><br />you can not change any user details<br />to make edit's change user status">
      <cfset warningColors = "warningBorder warningBg warningText">
  </cfcase>
</cfswitch>

<cfoutput><div class="ui-corner-all ui-widget ui-widget-content podForm #warningColors#">
   <fieldset>
      <legend>User Status</legend>
      #activeText#<br/>
  </fieldset>
</div></cfoutput>