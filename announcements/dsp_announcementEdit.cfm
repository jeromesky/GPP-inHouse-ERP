<cfparam name="url.page" default="1" max="2" min="0" type="integer">
<cfparam name="url.noticeID" default="0" max="200000" min="0" type="integer"> 

<cfhtmlhead text='<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>'>

<cfoutput QUERY="qryEdit">
<div align="left" style="width: 500px;">

<form name="register" method="post" action="?">
<input type="hidden" name="fa" value="announcementUpdate">
<input type="hidden" name="id" value="#announcementID#">
<fieldset><legend>Edit Announcement</legend>

<label>Name</label><input type="text" name="announcementName" maxlength="50" value="#ANNOUNCEMENTNAME#"><br />

<label>Staff Added / Updated by</label><input readonly class="readonly" type="text" vaLUE="#DATEADDED# / <cfif DATEUPDATED neq ''>#DATEUPDATED#<cfelse>No edits done</cfif>"><br />

<label>Date Added / Updated on</label><input readonly class="readonly" type="text" vaLUE="#DATEADDED# / <cfif DATEUPDATED neq ''>#DATEUPDATED#<cfelse>No edits done</cfif>"><br />

<label>Subject</label><input type="text" name="announcementSubject" maxlength="100" value="#announcementSubject#"><br />

<label>Expire Date</label><input type="date" name="announcementExpiry" value="#dateformat(now()+100, 'yyyy-mm-dd')#"><br />

<label>Type</label><select name="announcementType"> 
              <option value="0">None listed</option>
              <option value="1">General</option>
              <option value="2" <cfif ANNOUNCEMENTTYPE EQ 2>selected</cfif>>Event</option>
              <option value="3">Event - Advance Notice</option>
              <option value="4">Event - Sponsorship Notice</option>
              <option value="5">Thanks</option>
              <option value="6">Business Breakfast</option>
            </select><br />
            
<label>Event</label><cf_events_dropDown eventID="#eventID#" fieldName="eventid" elapse="1" operator="IN" eventType="din,event,Bu_pr"><br />

<label>Template</label><select name="templateID"> 
              <option value="0">None listed</option>
            </select><br />

<label>Domain</label>
<select name="DomainID"><cfloop query="qryDomain">
<option value="#qryDomain.id#"<cfif qryEdit.ANNOUNCEMENTFROMDOMAIN EQ qryDomain.id> selected</cfif>>#lcase(qryDomain.domain_name)#</option></cfloop>
           </select><br>
           
<label>Attachments</label><input type="date" name="attachment" value="None"><br />

<label>txt Message</label>
<textarea id="ANNOUNCEMENTBODYtxt" name="ANNOUNCEMENTBODYtxt" cols="5" rows="5">#ANNOUNCEMENTBODY#</textarea><br/>
<label>html Message</label>
<textarea id="ANNOUNCEMENTBODYhtml" name="ANNOUNCEMENTBODYhtml" cols="10" rows="10">[[text]]</textarea><br>
<label>From</label>
<select name="ANNOUNCEMENTFROMPERSON" id="ANNOUNCEMENTFROMPERSON">
<option value="0" <cfif qryEdit.ANNOUNCEMENTFROMPERSON EQ '0'>selected</cfif>>None Select Yet</option><cfloop query="qrySignature">
<option value="#qrySignature.id#" <cfif qryEdit.ANNOUNCEMENTFROMPERSON EQ qrySignature.id>selected</cfif>>#qrySignature.name#</option></cfloop>
           <!---<option value="0" <cfif qryEdit.ANNOUNCEMENTFROMPERSON EQ 0>selected</cfif>>Custom</option> ---></select>
<br>
<label>Signature</label>
<select name="ANNOUNCEMENTFROMSIGNATURE" id="ANNOUNCEMENTFROMSIGNATURE">
<option value="0" <cfif qryEdit.ANNOUNCEMENTFROMSIGNATURE EQ '0'>selected</cfif>>None Select Yet</option><cfloop query="qrySignature">
<option value="#qrySignature.id#" <cfif qryEdit.ANNOUNCEMENTFROMSIGNATURE EQ qrySignature.id>selected</cfif>>#qrySignature.name#</option></cfloop>
           <!---<option value="0" <cfif qryEdit.ANNOUNCEMENTFROMSIGNATURE EQ 0>selected</cfif>>Custom</option>---></select>
<br>
<label>&nbsp;</label><input type="submit" name="submit" value="Update"><br />
</fieldset>
</form>

	<!---		<script type="text/javascript">
				CKEDITOR.replace( 'meassage1' );
				config.height = '300px';
				config.width = '600px';
				config.toolbar = 'Basic';
			</script> --->
<script type="text/javascript">
	window.onload = function()
	{
		CKEDITOR.replace('ANNOUNCEMENTBODYhtml');
						CKEDITOR.config.width = '600px';
	};
</script>
			
</div>
</cfoutput>

<cfdump vaR="#qryEdit#">