<cfoutput>
<div align="left">

<form name="register" method="post" action="?">
<input type="hidden" name="fa" value="schedules-Add">

<fieldset>
  <legend>Create an Schedule</legend>

    <label>Name</label><input type="text" name="scheduleName" maxlength="50"><br />

    <label>Annnoucement</label><select name="AnnnoucementID" id="AnnnoucementID" class="ui-corner-all"><cfloop query="qryAnnouncements">
       <option value="#announcementID#">#announcementName#</option></cfloop></select><br />
       
     <label>Audience</label>xxx<br />
     
       <label>Date</label><input type="text" name="sendDate" id="datepicker" value="#dateformat(now()+100, 'yyyy/mm/dd')#"><br>
       
       <label>Time</label><select name="sendHour" id="SendHour" class="ui-corner-all"><cfloop from='4' to='22' index="hh">
       <option value="#hh#">#numberformat(hh, '00')#:00</option></cfloop></select><br>
     
<label>&nbsp;</label><input type="submit" name="submit" value="Save Schedule"><br />

</fieldset>

</form>

</div>
</cfoutput>