<cfinclude template="../Application.cfm">
<cfif parameterexists(form.event_blurb)>
<cfquery datasource="#dsnP21#" >
UPDATE events
set event_blurb = '#form.event_blurb#'
WHERE id = 423
</cfquery>

</cfif>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" src="../javascript/interface.js" ></script>
<script type="text/javascript" src="../highslide/highslide.js"></script>
<script type="text/javascript" src="../highslide/highslide-html.js"></script>
<script type='text/JavaScript' src='../javascript/scw.js'></script>
<script type="text/javascript" src="../javascript/jquery.form.js"  ></script>
<script type="text/javascript" src="../Javascript/Tiny_mce/jscripts/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript">
	tinyMCE.init({
		// General options
		mode : "textareas",
		elements : "text",
		theme : "advanced",
		skin : "o2k7",
		skin_variant : "black",
		cleanup_on_startup : true,
		cleanup : true,
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
</head>

<body>
<cfquery datasource="#dsnP21#" name="get">
SELECT id , event_blurb from events WHERE id = 423
</cfquery>
<form id="form1" name="form1" method="post" action="#">
  <textarea name="event_blurb" rows="20" id="textfield" style="width:500px"><cfoutput>#get.event_blurb#</cfoutput></textarea>
  <input type="hidden" name="id" value="423" />
  <input type="submit" name="button" id="button" value="Submit" />
</form>

</body>
</html>
