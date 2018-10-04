<cfinclude template="../Application.cfm">

<cfif parameterexists(form.title)>
<cfquery datasource="#dsnP21#">
INSERT INTO PressRelease(title, content, logo, contact, insertdate )
VALUES('#form.title#', '#form.content#', '#form.logo#', '#form.contact#', #now()# )
</cfquery>
</cfif>

<cfquery datasource="#dsnP21#" name="get">
SELECT title, insertdate FROM PressRelease ORDER BY insertdate desc
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>www.petro21.com</title>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery.js" ></script>
<script type="text/javascript" src="http://www.petro21.com/my-office/Javascript/Tinymce_Clean/jscripts/tiny_mce/tiny_mce_src.js"></script>
<!--- 
		verify_html : true,
	forced_root_block : true,
		remove_trailing_nbsp : true,
		remove_trailing_nbsp : false,
		valid_elements : "a[href|target=_blank],strong/b,ol,li",
		remove_linebreaks : false,
		force_br_newlines : true,
--->
<script type="text/javascript">
//function initMCE(){
tinyMCE.init({
mode : "none",
mode : "textareas",
elements : "contact,content",
theme : "advanced",
skin : "o2k7",


plugins : "safari,spellchecker,pagebreak,style,save,advlink,iespell,inlinepopups,preview,searchreplace,print,contextmenu,paste,directionality,noneditable,visualchars,nonbreaking,xhtmlxtras",
theme_advanced_buttons1 : "formatselect,bold,italic,underline,|,spellchecker,|,nonbreaking,|,pastetext,|,bullist,numlist,|,outdent,indent,blockquote,|,link,unlink,cleanup,code,|,iespell",
theme_advanced_buttons2 : "",
theme_advanced_buttons3 : "",
theme_advanced_buttons4 : "",
theme_advanced_toolbar_location : "top",
theme_advanced_toolbar_align : "left",
theme_advanced_statusbar_location : "bottom",
theme_advanced_blockformats : "h2,h3,h4,h5,h6,blockquote,sup",
theme_advanced_resizing : true,
//invalid_elements : "*[*]",
valid_elements : "a[href|target=_blank],strong/b,div[align],br,p,ul,ol,li, i ,u, blockquote, h2,h3,h4,h5,h6"
});
</script>

<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.boxdate	{clear:both; float:left; width:70px; color:#999999;}
.boxtitle	{clear:right; float:left; }

</style>
</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="header"> Petro21 Press Releases:  -- <span class="header_title">Edit / Add Entries </span></div>
<div id="outer">
	<div id="iner">
    	
   
   <div style="clear:both; float:left; width:500px; margin:0 5px 0 0 ">
   <div class="sectionHeader">Add Press Release</div>
   	  <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>
<form action="#" method="post"  >     
        <table width="100%" border="0" cellspacing="2" cellpadding="0">
  
  <tr>
    <td width="91">title</td>
    <td ><input type="text" name="title" maxlength="180" style="width:400px" /></td>
  </tr>
  <tr>
    <td>logo</td>
    <td>
    	<CFQUERY datasource="#dsnP21#" name="getlogo">SELECT logofile, company FROM logos order by company</CFQUERY> 
<select name="logo">
  <option>select logo</option>
  <cfoutput query="getlogo">
  <option value="#logofile#">#company#</option>
 </cfoutput> 
</select>
<input type="submit" name="button" id="button" value="Submit" /></td>
  </tr>
  
  <tr>
    <td colspan="2" valign="top">press release</td>
    </tr>
  <tr>
    <td colspan="2" valign="top"><textarea name="content" id="content" style="width:480px; height:400px"></textarea></td>
    </tr>
    <tr>
      <td colspan="2" valign="top">contact</td>
      </tr>
    <tr>
    <td colspan="2" valign="top"><textarea name="contact" id="contact" style="width:480px; height:100px"></textarea></td>
    </tr>
</table>
</form>
   </div>
   <div style="clear:right; float:left; width:650px">
   <div class="sectionHeader">listed press release</div>
   	  <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>
        <cfoutput query="get">
        	<div class="boxdate">#DateFormat(get.insertdate, "dd mm yyyy")#</div>
        	<div class="boxtitle">#get.title#</div>
            <div class="clear"></div>
        </cfoutput>
   </div>
   <div class="clear"></div>
   
   </div>
</div>
</body>
</html>
<!---
<script type="text/javascript">
	tinyMCE.init({
		// General options
		mode : "textareas",
		mode : "exact",
		elements : "contact",
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
--->