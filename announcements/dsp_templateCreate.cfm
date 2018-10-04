<cfoutput>
<div align="left">

<form name="register" method="post" action="?">
<input type="hidden" name="fa" value="templateUpload">

<fieldset>
  <legend>Create a Template</legend>
    <label>Name</label><input type="text" name="templateName" maxlength="50"><br />
    <label>Usage</label><input type="text" name="templateUsage" maxlength="50"><br >
    <label>Event</label><cf_events_dropDown eventID="0" fieldName="eventid" elapse="1" operator="IN" eventType="din,event,Bu_pr"><br />
    <label>Code</label><textarea></textarea><br />
<br />

<label>&nbsp;</label><input type="submit" name="submit" value="Save Template"><br />

</fieldset>

</form>

</div>
</cfoutput>