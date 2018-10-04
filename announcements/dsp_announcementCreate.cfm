<cfoutput>
<div align="left" style="width: 500px;">

<form name="register" method="post" action="?">
<input type="hidden" name="fa" value="announcementAdd">
<fieldset><legend>Create an Announcement</legend>

<label>Name</label><input type="text" name="announcementName" maxlength="50"><br />
<label>Subject</label><input type="text" name="announcementSubject" maxlength="100"><br />
<label>Expire Date</label><input type="text" name="announcementExpiryDate" id="datepicker" value="#dateformat(now()+100, 'yyyy/mm/dd')#"><br />
<label>Type</label><select name="announcementType">              
              <option value="0">None listed</option>
              <option value="1">General</option>
              <option value="2">Event</option>
              <option value="3">Event - Advance Notice</option>
              <!--- response form --->
              <option value="4">Event - Sponsorship Notice</option>
              <option value="5">Thanks</option>
              <option value="6">Business Breakfast</option>
            </select><br />      
<label>Event</label><cf_events_dropDown eventID="0" fieldName="eventid" elapse="1" operator="IN"  eventType="din,event,Bu_pr"><br />
<label> &nbsp; </label><input type="submit" name="submit" value="Step 2"><br />

</fieldset>

</form>

</div><!---
<script type="text/javascript" >
$(function() {
		$( "##datepicker" ).datepicker( {dateFormat: 'yyyy-mm-dd' });

});
</script>--->
</cfoutput>