<cfif parameterexists(form.name)>
 <cfquery datasource="#dsnP21#">
  INSERT INTO youTubCategory(name)
 VALUES('#form.name#')
 </cfquery>
</cfif>

<cfif parameterexists(form.description)>
 <cfquery datasource="#dsnP21#">
  INSERT INTO youtubeVideo(description, link, insertdate, category)
  VALUES('#form.description#', '#form.link#', <cfqueryparam value="#trim(form.insertdate)#" cfsqltype="cf_sql_date">, #form.category#)
 </cfquery>
</cfif>
<cfif parameterexists(url.del)>
 <cfquery datasource="#dsnP21#">
  DELETE FROM youtubeVideo WHERE id = #url.id#
 </cfquery>
</cfif>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script type='text/JavaScript' src='../javascript/scw.js'></script>
<script type="text/javascript" src="../javascript/prototype.js"></script>
<script type="text/javascript" src="../javascript/eip.js"></script>
<script type="text/javascript" src="../highslide/highslide.js"></script>
<script type="text/javascript" src="../highslide/highslide-html.js"></script>
<script type="text/javascript"> 
 hs.graphicsDir = '../highslide/graphics/';
 hs.outlineType = 'rounded-white';
 hs.outlineWhileAnimating = true;
  hs.objectLoadTime = 'after';
  hs.preserveContent = false;
</script>
<style type="text/css">
* { font-family: Verdana, Helvetica; font-size: 10pt;}
.highslide-html { background-color: white;}
.highslide-html-content { position: absolute; display: none;}
.highslide-loading { display: block; color: black; font-size: 8pt; font-family: sans-serif; font-weight: bold; text-decoration: none; padding: 2px; border: 1px solid black; background-color: white; 
}
.control { float: right; display: block; /*position: relative;*/ margin: 0 5px; font-size: 9pt; font-weight: bold; text-decoration: none; text-transform: uppercase; color: #999;}
.control:hover { color: black !important;}
.highslide-move { cursor: move;}
.highslide-display-block { display: block;}
.highslide-display-none { display: none;}
</style>
<title>P21</title>
<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="header">Petro21 YouTube:  -- <span class="header_title">Add a Edit Entries and Categories</span></div>
<div id="outer">
 <div id="iner">
<div style="clear:both; float:left; width:450px">
 <div class="sectionHeader">Add a YouTube Category</div>
 <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>
 <form id="form1" name="form1" method="post" action="">
   <table width="400" border="0" cellspacing="4">
  <tr>
    <td colspan="2"><cfif parameterexists(form.name)> <span style="color:#CC3300">Catogory Added</span></cfif></td>
  </tr>
  <tr>
    <td>Category Name</td>
    <td><input type="text" name="name" id="textfield" maxlength="50" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="button" id="button" value="Submit" /></td>
  </tr>
   </table></form> 
   <div class="sectionHeader" style="margin:30px 0 0 0 ;">Add a YouTube Video to Library</div>
  <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div> 
  <form id="form2" name="form2" method="post" action="">
  <table width="400" border="0" cellspacing="4">
    <tr>
   <td colspan="3"><cfif parameterexists(form.description)> <span style="color:#CC3300">Video Added</span></cfif></td>
  </tr>
    <tr>
   <td width="112">Video Title</td>
   <td colspan="2"><label>
     <input type="text" name="description" maxlength="150" />
   </label></td>
    </tr>
    <tr>
   <td>Video Date</td>
   <td><input type="text" name="insertdate"  /><img src="../img/calendar_24.gif" border="0" onclick="scwShow(scwID('insertdate'),event,3);"  ></td>
   <td>&nbsp;</td>
    </tr>
    <tr>
   <td>Video Link</td>
   <td width="224"><label>
     <input type="text" name="link" />
   </label></td>
   <td width="42">&nbsp;</td>
    </tr>
    <tr>
   <td>Category</td>
   <td><cfquery datasource="#dsnP21#" name="getCat">SELECT * FROM youTubCategory ORDER BY pos</cfquery>
     <select name="category" id="select">
    <cfoutput query="getCat"><option value="#getCat.id#">#getCat.name#</option></cfoutput>
     </select>   </td>
   <td>&nbsp;</td>
    </tr>
    <tr>
   <td>&nbsp;</td>
   <td><input type="submit" name="button2" id="button2" value="Submit" /></td>
   <td>&nbsp;</td>
    </tr>
  </table>
  </form>
</div>  
<div style="clear:right; float:left; width:750px">  
  
   <div class="sectionHeader">Current Videos in Library</div>
  <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div> 
  <div style="clear:both; float:left; width:280px;">
  <ul>
  
   <cfoutput query="getCat">
  <cfif getCat.eventid eq 0>
  <li style="list-style:none"><label><span id="pos#getCat.id#" >#getCat.pos#</span></label><label><a href="editCat.cfm?id=#getCat.id#" id="cat#getCat.id#" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType: 'iframe',  objectWidth: 430, objectHeight: 150} )" class="highslide"><img src="../img/new_edit.gif" /></a></label> <a href="index.cfm?cat=#getCat.id#">#getCat.name#</a></li>
  </cfif>
  </cfoutput>
  </ul>
  <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>
  <ul>
   <cfoutput query="getCat">
  <cfif getCat.eventid neq 0>
  <li style="list-style:none"><label><a href="editCat.cfm?id=#getCat.id#" id="cat#getCat.id#" onClick="return hs.htmlExpand(this, { contentId: 'highslide-html', objectType: 'iframe',  objectWidth: 430, objectHeight: 150} )" class="highslide"><img src="../img/new_edit.gif" /></a></label> <a href="index.cfm?cat=#getCat.id#">#getCat.name#</a></li>
  </cfif>
  </cfoutput>
  </ul>
  </div>
  <div  style="clear:right; float:left; width:400px; height:400px; overflow:auto">
  <cfparam name="url.cat" default="#getCat.id#" >
  <cfquery datasource="#dsnP21#" name="get">SELECT * FROM youtubeVideo WHERE category = #url.cat# ORDER BY insertdate desc</cfquery>
   <div id="contentarea">
  <div class="sectionHeader" style=" border-bottom:#FFFFFF 0px solid"><cfoutput query="getCat"><cfif getCat.id EQ url.cat>#getCat.name#</cfif></cfoutput></div>
<cfoutput query="get">
<div style="border-bottom:1px dotted ##CCCCCC; padding:3px">
 <div><a href="play.cfm?id=#get.id#" id="video#get.id#" onClick="return hs.htmlExpand(this, { contentId: 'video', objectType: 'iframe',  objectWidth: 430, objectHeight: 380} )" class="highslide" style="text-decoration:none">#description#</a></div>
 <div style="clear:both; float:left; width:290px;">#dateformat(insertdate, "dd mmmm yyyy")#</div>
 <div style="clear:right; float:left; width:24px"><a href="editVideo.cfm?id=#get.id#" id="videoEdit#get.id#" onClick="return hs.htmlExpand(this, { contentId: 'videoEdit', objectType: 'iframe',  objectWidth: 430, objectHeight: 250} )" class="highslide"><img src="../img/new_edit.gif" /></a></div>
 <div style="clear:right; float:left; width:24px"><a href="index.cfm?del=1&cat=#url.cat#&id=#get.id#"><img src="../img/new_delete.gif" border="0" /></a></div>
  <div class="clear"></div>
</div>
</cfoutput>
  </div>
  
  </div>  
  <div style="clear:both"></div>
 </div>
 <div style="clear:both"></div>
</div>
</div>

<div class="highslide-html-content" id="highslide-html" style=" width:430px; height:150px;">
 <div class="highslide-move" style="border: 0; height: 10px; padding: 0px; cursor: default"><a href="#" onClick="return hs.close(this)" class="control" style="font-size:10px">Close</a></div>
 <div class="highslide-body"></div>
</div>

<div class="highslide-html-content" id="video" style=" width:430px; height:380px;">
 <div class="highslide-move" style="border: 0; height: 10px; padding: 0px; cursor: default"><a href="#" onClick="return hs.close(this)" class="control" style="font-size:10px">Close</a></div>
 <div class="highslide-body"></div>
</div>

<div class="highslide-html-content" id="videoEdit" style=" width:430px; height:250px;">
 <div class="highslide-move" style="border: 0; height: 10px; padding: 0px; cursor: default"><a href="#" onClick="return hs.close(this)" class="control" style="font-size:10px">Close</a></div>
 <div class="highslide-body"></div>
</div>
<script type="text/javascript">
 Event.observe(window, 'load', init, false);
 function init() {
  // Over ride some of the default options.
  EditInPlace.defaults['type'] = 'text';
  EditInPlace.defaults['save_url'] = 'UpdateCategory.cfm';
  <cfoutput query="getCat">
  // Edit date.
  <cfif getCat.eventid eq 0>EditInPlace.makeEditable( { id:'pos#getCat.id#', select_text: true, max_size: '1' } );</cfif>
  </cfoutput>
 }
 </script>
</body>
</html>