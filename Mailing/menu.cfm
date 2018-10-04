<cfoutput>
<table width="100%" border="0" cellspacing="4" cellpadding="4" style="color:##333333">
  <tr>
    <td colspan="4"><h1>Selected Email configure option <span class="headermini"></span></h1></td>
  </tr>
  <tr>
 <td width="250"><ul>
 	<li><a href="javascript:loadMailDetails(#form.id#);">Edit Main Details</a></li>
   <li><a href="javascript:loadWYSISYG(#form.id#);">Enter Text Content for email</a></li>
 	<li><a href="javascript:loadFlashNews(#form.id#);">Select News Flash</a></li>
 </ul></td>
 <td width="250"><ul>
   <li><a href="javascript:loadSendDate(#form.id#);">I would like to send email out on </a></li>
   <li><a href="javascript:loadSelectTemplate(#form.id#);">Select Template</a></li>
 </ul></td>
 <td width="250"><ul>
 	<li><a href="javascript:loadregions(#form.id#);">Add Regions of Interest</a></li>
   <li><a href="javascript:loadcontract(#form.id#);">Link to Contract and Company</a></li>
   <li><a href="javascript:loadEvent(#form.id#);">Link to Event</a></li>
   <li><a href="javascript:loadCountry(#form.id#);">Select Country</a></li>
 </ul></td>
 <td><ul>
 	<li><a href="javascript:loadattachements(#form.id#);">View Attachments</a></li>
   <li>Upload attachements</li>
                 </ul>
<div id="upload_button" class="uploadButton" style="width:100px">Upload file</div>
<div id="fileStatus"></div></td>
    </tr>
</table>
</cfoutput>
<!---
<script type="text/javascript">
 $(document).ready(function() {
new AjaxUpload('##upload_button', {
  action: 'UploadAttachement.cfm',
  name: 'Upload',
  data: {
    id : '#form.id#',
	field : 'file_update'
  },
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_button').html("<img src=../img/ProgressBar_transparent.gif width=70 >");},
  onComplete: function(file, response) {$('##upload_button').html("Loading Completed..."); $('##fileStatus').append(response);}
});
});
</script>
--->