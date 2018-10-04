<cfinclude template="../Application.cfm">
<cfif parameterexists(form.id)>
	<cfset id = form.id>
<cfelse>
	<cfset id = url.id>
</cfif>
<cfif parameterexists(form.groupby)>
	<cfset groupby 		= form.groupby>

<cfelse>
	<cfset groupby 		= url.groupby>

</cfif>
<cfif parameterexists(form.eventid)>
	<cfset eventid = form.eventid >
<cfelse>
	<cfset eventid = url.eventid >
</cfif>

<cfif parameterexists(form.decription)>
<cfquery datasource="#dsnP21#">
UPDATE speakers_program 
SET decription  		= '#form.decription#',
	comment 			= '#trim(form.comment)#',
    speaker				= '#trim(form.speaker)#',
    
    <cfif form.speakertime EQ "" >
    speakersession 	= #form.speakersession#
    
    <cfelse>
    speakersession 	= #form.speakersession#,
    speakertime	 	=  <cfqueryparam value="#form.speakertime#" cfsqltype="CF_SQL_TIME">
    </cfif>
    WHERE id = #form.id#
</cfquery>
<cflocation url="speakers_program.cfm?id=#eventid#&groupby=#groupby#">
</cfif>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
        
			<script src="../Javascript/jquery.maskedinput-1.2.2.js" type="text/javascript"></script>
          <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
      
     <!--- <link rel="Stylesheet" media="screen" href="../javascript/My-timePickr/ui.core.css" />
        <link rel="Stylesheet" media="screen" href="../javascript/timepickr/themes/default/ui.timepickr.css" />
        <script type="text/javascript" src="../javascript/My-timePickr/jquery.ui.all.js"></script>
        <script type="text/javascript" src="../javascript/My-timePickr/jquery.timepickr.js"></script>--->
<script type="text/javascript" src="../Javascript/Tiny_mce/jscripts/tiny_mce/tiny_mce.js"></script>
<!---<script src="../Javascript/inputMask.js" type="text/javascript"></script>--->
<script type="text/javascript" src="../javascript/jquery.maskedinput.js"></script>
<script type="text/javascript">
var $j = jQuery.noConflict();
jQuery(function($){
   $j("#speakertime").mask("99:99");
});

<!---            $(function(){
    
	$('#speakertime').timepickr({convention:24, rangeMin:['00', '05', '10', '15', '20', '25', '30', '35', '40', '45', '50', '55'] });
	$('#speakertime').next().addClass('dark');

 });--->
        </script>
     <script type="text/javascript">
	tinyMCE.init({
		// General options
		mode : "input",
		mode : "exact",
		elements : "comment",
		theme : "advanced",
		skin : "o2k7",
		skin_variant : "black",
		plugins : "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",
		// Theme options
		theme_advanced_buttons1 : "pastetext,pasteword,|,bullist,numlist,|,bold,italic,underline,|,undo,redo,|,link,image,cleanup,help,code",
		theme_advanced_buttons2 :"",
		theme_advanced_buttons3 :"",
		theme_advanced_buttons4 :"",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : true,
		// Example content CSS (should be your site CSS)
		content_css : "css/content.css",
		// Drop lists for link/image/media/template dialogs
		template_external_list_url : "lists/template_list.js",
		external_link_list_url : "lists/link_list.js",
		external_image_list_url : "lists/image_list.js",
		media_external_list_url : "lists/media_list.js",
		// Replace values for the template plugin
		template_replace_values : {
			username : "Some User",
			staffid : "991234"
		}
	});
</script>

<style type="text/css">
body {
	color:#333333;
	font-family:Arial, Helvetica, sans-serif;
	font-size:12px;
	background-color:#535353;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
form{padding:0px; margin:0px }
</style>
</head>
<!--- onload="return hs.close(this); parent.window.location.href='speakers_program.cfm?id=#form.eventid#&groupid=#form.groupby#';" --->

<body <cfif parameterexists(form.decription)><cfoutput>onload="javascript:parent.window.hs.speakers.location='speakers_program.cfm?id=#eventid#&groupby=#groupby#;"</cfoutput></cfif>>
<cfquery datasource="#dsnP21#" name="get">SELECT * FROM speakers_program WHERE id = #url.id#</cfquery>

<form id="form1" name="name" method="post" action="#">
  <table width="720" border="0" cellspacing="0" cellpadding="4" bgcolor="#535353" style="color:#FFFFFF">
  <tr>
    <td width="329">Presentation topic/ Session topic</td>
    <td width="425">Presentation comment or extra text to add for Session</td>
  </tr>
  <tr>
    <td bgcolor="#535353"><input name="decription" type="text" style="width:300px; height:200px;" maxlength="200" value="<cfoutput>#get.decription#</cfoutput>"  /></td>
    <td bgcolor="#535353"><input name="comment" type="text"  style="width:410px; height:200px;" value="<cfoutput>#trim(get.comment)#</cfoutput>"  maxlength="1200" /></td>
  </tr>
  <tr>
    <td> <label>Session
      <input type="text" name="speakersession" value="<cfoutput>#trim(get.speakersession)#</cfoutput>"  style="width:30px "/>
    </label><input type="hidden" name="id" value="<cfoutput>#id#</cfoutput>" />
    	<input type="hidden" name="eventid" value="<cfoutput>#eventid#</cfoutput>" />
        <input type="hidden" name="groupby" value="<cfoutput>#groupby#</cfoutput>" />
  </td>
    <td>presentation time / leave empty if adding Session title <label>
      <input type="text" name="speakertime" id="speakertime"   style="width:65px" value="<cfoutput>#timeformat(get.speakertime, "HH:mm")#</cfoutput>"  />
    09:30 format</label></td>
  </tr>
  <tr>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td>Record Type
    <select name="speaker" id="select">
      <option value="0" <cfif get.speaker eq 0>selected</cfif>>Presentation</option>
      <option value="1" <cfif get.speaker eq 1>selected</cfif>>Session</option>
      <option value="2" <cfif get.speaker eq 2>selected</cfif>>Info Slot</option>
    </select>
    </td>
    <td><input type="submit" name="button" value="Submit" /></td>
  </tr>
  <tr >
    <td colspan="2" height="7" bgcolor="#1D1D1D"></td>
  </tr>
</table>
</form> 
</body>
</html>
