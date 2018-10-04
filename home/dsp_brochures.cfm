

        <cfquery datasource="#dsnP21#" name="getUP" cachedwithin="#CreateTimeSpan(1,0,0,0)#">
        SELECT event_name, id , groupby, event_year, event_type
        FROM events 
        WHERE event_expire > #now()# AND event_type = 'week'    
        ORDER BY event_expire 
        </cfquery>

<script type="text/javascript" >
$(document).ready(function(){

});
</script>
<table border="0" cellspacing="4" cellpadding="0">
  <tr>
  <cfoutput query="getUP">
  <tr>
    <td align="right"  ><a href="events/dsp_edit.cfm?id=#getUP.id#">#getUP.event_name#</a> </td>
    <td>
<div id="upload_button_#getUP.id#" > Brochure</div>
<script type="text/javascript">
 $(document).ready(function() {
new AjaxUpload('##upload_button_#getUP.id#', {
  action: 'events/dsp_ftp.cfm',
  name: 'Upload',
  data: {
    id : '#getUP.id#',
    for : 'Brochure',
	field : 'file_update'
  },
  autoSubmit: true,
  responseType: false,
  onChange: function(file, extension){},
  onSubmit: function(file, extension) {$('##upload_button_#getUP.id#').html("Loading File...");},
  onComplete: function(file, response) {$('##upload_button_#getUP.id#').html("Loading Completed..."); $('##brochureStatus').append(response);}
});
});
</script>
 
 </td>
  <td width="40">
         <cfquery datasource="#dsnP21#" name="ev"  cachedwithin="#CreateTimeSpan(1,0,0,0)#">
        SELECT event_abbr, id, groupby, event_year  FROM events 
        WHERE groupby = #getUP.groupby# AND (event_year = #getUP.event_year#) AND ( event_type = 'event' ) AND live = 1
        </cfquery>
        <cfloop query="ev">
  			<a href="program/index.cfm?id=#ev.id#&groupby=#ev.groupby#&event_year=#ev.event_year# " rel="colorbox">#event_abbr#&nbsp;program</a>
        </cfloop>    
           </td>
  </tr>
  </cfoutput>
  </tr>
</table>



 <!---
    <form method="post" action="events/dsp_ftp.cfm" id="upload#getUP.id#" enctype="multipart/form-data">
        <input name="Upload" type="file" style="width:20px">
        <input type="hidden" name="id" value="#getUP.id#">
        <input name="field" type="hidden" value="file_update" />
        <input type="hidden" name="for" value="Brochure">
        <button>Upload</button>
    </form>--->
 <!---       <script type="text/javascript">
<cfoutput query="getUP">
$(document).ready(function() { 	
    	var options = { 
        success:	jobAdded,   
		resetForm: 	true
    	};  
    $('##upload#getUP.id#').submit(function() { 
		$(this).ajaxSubmit(options);
		$("##brochureStatus").append("<img src='../img/ajax-loadBar.gif' width='220' height='19'>");	
		return false; 
    	}); 
		
	});		
</cfoutput>		
</script>--->