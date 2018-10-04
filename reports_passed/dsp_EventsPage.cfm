<fieldset id="Fieldset_Events">
 <legend>Events</legend>
     <div id="areaEvents">
 <cfinclude template="dsp_Events.cfm">
 </div>
     <input type="checkbox" name="display_Events" />visible</fieldset>
 
 <fieldset id="Fieldset_AttendType">
 <legend>Attendence Type</legend>
     <div id="areaAttendType"  >
  <table width="100%" border="0" cellspacing="0" cellpadding="4">
      <tr>
        <td><label><input type="checkbox" name="lngStatus_ID" value="chkDelegate" />Delegate</label></td><!--- lngStatus_ID=1 --->
       </tr>
      <tr>
        <td><label><input type="checkbox" name="lngStatus_ID" value="chkSpeaker" />Speaker</label></td><!--- lngStatus_ID=2 --->
       </tr>
      <tr>
        <td><label><input type="checkbox" name="lngStatus_ID" value="chkGuest" />Guest</label></td><!--- lngStatus_ID=3 --->
       </tr>
      <tr>
        <td><label><input type="checkbox" name="lngStatus_ID" value="chkModerator" /> Moderator</label></td><!--- lngStatus_ID=4 --->
       </tr>
      <tr>
        <td><label><input type="checkbox" name="lngStatus_ID" value="chkExhibitor" /> Exhibitor</label></td><!--- lngStatus_ID=5 --->
       </tr>
       <tr>
        <td><label><input type="checkbox"  name="lngStatus_ID" value="chkSponsor" /> Sponsor</label></td><!--- lngStatus_ID=8 --->
       </tr>
       <tr>
        <td><label><input type="checkbox" name="lngStatus_ID" value="chkPress" />Press</label></td><!--- lngStatus_ID=6 --->
       </tr>
       <tr>
        <td><label><input type="checkbox" name="lngStatus_ID" value="chkResearch" />Research</label></td><!--- lngStatus_ID=7 --->
       </tr>
      </table>
 </div>
     <input type="checkbox" name="display_AttendType" value="yes" />visible 
 </fieldset>