<cfinclude template="../Application.cfm">
<cfif parameterexists(form.id)>
	<cfset id = #form.id# >
<cfelse >
	<cfset id = #url.id# >
 </cfif>
 
<cfif parameterexists(form.submit)>
<!--- get info from date for email notification --->
<cfif parameterexists(form.event_days) OR parameterexists(form.event_expire) >
	<cfquery datasource="#dsnP21#" name="getevent">SELECT event_name, event_days, event_expire FROM events WHERE id = #form.id#</cfquery>
		<cfif #Evaluate("form.#fieldname#")# NEQ getevent.event_days OR #Evaluate("form.#fieldname#")# NEQ getevent.event_expire AND ( getevent.event_days NEQ "" OR getevent.event_expire NEQ "" )>
    		<cfmail to="#contactRego#" from="web@petro21.com" subject="Date of event has changed, Welcome pack Function blurbs need to be Updated" type="html">Please Update Welcome letter for <cfoutput>#getevent.event_name#</cfoutput><br />functions program blurbs need to be Updated to  <b>#Evaluate("form.#fieldname#")#</b></cfmail>
        </cfif>
</cfif>
<!--- Update Events table with new data --->
  	<cfquery datasource="#dsnP21#">
 		 UPDATE events
 		 SET 
  		#form.fieldname# = <cfif isDate(#form.fieldname#)>
        						<cfqueryparam value="#Evaluate("form.#fieldname#")#" cfsqltype="cf_sql_date">
						   <cfelseif form.fieldname EQ "event_cost_us" OR form.fieldname EQ "event_cost_uk">
                           		#Evaluate("form.#fieldname#")#
                            <cfelseif form.fieldname EQ "event_blurb" or form.fieldname EQ "event_blurb_program" or form.fieldname EQ "event_blurb_sponsors" or form.fieldname EQ "event_blurb_exhib">
                            	<cfqueryparam value="#Evaluate("form.#fieldname#")#" cfsqltype="CF_SQL_CHAR">
						   <cfelseif form.fieldname EQ "event_expire">
						   		<cfqueryparam value="#Evaluate("form.#fieldname#")#" cfsqltype="cf_sql_date">
                           <cfelseif form.fieldname EQ "live" OR form.fieldname EQ "Econf" >
                           		<cfif IsDefined("form.#fieldname#") is "True" >1<cfelse>0</cfif>
						   <cfelse>
                           			'#trim(Evaluate("form.#fieldname#"))#'
						   </cfif>
   		WHERE id = #form.id#
 	 </cfquery>
</cfif>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>P21</title>
<script type="text/javascript" src="../Javascript/Tiny_mce/jscripts/tiny_mce/tiny_mce.js"></script>
<script type='text/JavaScript' src='../javascript/scw.js'></script>
</head>
<cfinclude template="../Application.cfm">
<cfset fieldname =  #url.field# >
<cfquery name="get_event" datasource="#dsnP21#">
   SELECT #fieldname#
   FROM events
   WHERE id = #url.id#
</cfquery>
<cfset fieldvalue =  "#Evaluate("get_event.#fieldname#")#" >
<body  <cfif parameterexists(form.submit)>onload="javascript:parent.window.hs.closeId('<cfoutput>#form.fieldname#</cfoutput>')"</cfif>>
<form action="#" method="post" name="form" >
<div style="border-bottom:1px solid #539ad2; font-weight:bold; height:20px; margin:17px 2px 3px 2px; padding:4px 0 0 4px; color:#539ad2; vertical-align:bottom;">Edit selected field &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<input type="submit" name="submit" value="submit" /><cfoutput>#fieldname#</cfoutput> </div>
<div style="clear:both" ></div>
<table width="100%" border="0" cellspacing="0" cellpadding="2">
  <tr>
    <td><cfoutput><input type="hidden" name="id" value="#id#"><input type="hidden" name="fieldname" value="#fieldname#" /></cfoutput></td>
  </tr>
  <tr>
    <td>
    <cfoutput query="get_event">
<!--- Input text Area --------------------->    
<cfif fieldname EQ "colorL" OR fieldname EQ "colorD" OR fieldname EQ "event_name" OR fieldname EQ "event_expire" OR fieldname EQ "event_days" OR fieldname EQ "event_loc_hotel" OR fieldname EQ "event_loc_city" OR fieldname EQ "event_cost_us"  OR fieldname EQ "event_abbr" OR fieldname EQ "event_year" OR fieldname EQ "venuRoom" OR fieldname EQ "event_cost_uk" OR fieldname EQ "timereg" OR fieldname EQ "timestart">
<input name="#fieldname#" type="text" value="<cfif isDate(#fieldvalue#)>#dateformat(fieldvalue, "dd-mm-yyyy")#<cfelse>#fieldvalue#</cfif>" />
    <cfif isDate(#fieldvalue#)><img src="../img/calendar_24.gif" border="0" onClick="scwShow(scwID('#fieldname#'),event,3);"  ></cfif></A>
  
</cfif>    

<!--- Text Area -----------
<a href="##" onclick="cal.select(document.forms['form'].#fieldname#,'anchor1','MM dd yyyy'); return false;" title="cal.select(document.forms['form'].#fieldname#,'anchor1','MM dd yyyy'); return false;" name="anchor1" id="anchor1">
    <A HREF="##"   onClick="cal.select(document.forms['form'].#fieldname#,'anchor1','MM dd yyyy'); return false;"   NAME="anchor1" ID="anchor1">
--------->
<cfif fieldname EQ "event_loc_area" OR fieldname EQ  "event_loc_warnings"  OR fieldname EQ "related_three"  OR fieldname EQ "venueaddress"  OR fieldname EQ "google">

<textarea  name="#fieldname#" rows="15" cols="25" >#fieldvalue#</textarea>
</cfif>
<!--- Dropdown Area ------------------------------------------->
<cfif fieldname EQ "event_month" >
 <select name="event_month">
   <option value="January" <cfif trim(trim(fieldvalue)) EQ "January">SELECTED</cfif> >January</option>
   <option value="February" <cfif trim(fieldvalue) EQ "February">SELECTED</cfif> >February</option>
   <option value="March" <cfif trim(fieldvalue) EQ "March">SELECTED</cfif> >March</option>
   <option value="April" <cfif trim(fieldvalue) EQ "April">SELECTED</cfif> >April</option>
   <option value="May" <cfif trim(fieldvalue) EQ "May">SELECTED</cfif> >May</option>
   <option value="June" <cfif trim(fieldvalue) EQ "June">SELECTED</cfif> >June</option>
   <option value="July" <cfif trim(fieldvalue) EQ "July">SELECTED</cfif> >July</option>
   <option value="August" <cfif trim(fieldvalue) EQ "August">SELECTED</cfif> >August</option>
   <option value="September" <cfif trim(fieldvalue) EQ "September">SELECTED</cfif> >September</option>
   <option value="October" <cfif trim(fieldvalue) EQ "October">SELECTED</cfif> >October</option>
   <option value="November" <cfif trim(fieldvalue) EQ "November">SELECTED</cfif> >November</option>
   <option value="December" <cfif trim(fieldvalue) EQ "December">SELECTED</cfif> >December</option>
 </select>
 </cfif>
 <cfif fieldname EQ "event_cost_currency" > 
 <select name="event_cost_currency">
	<option value="$" <cfif fieldvalue EQ "$">SELECTED</cfif>>US - $</option>
	<option value="&pound;" <cfif fieldvalue EQ "£">SELECTED</cfif>>UK - &pound;</option>
	<option value="EUR" <cfif fieldvalue EQ "EUR"> SELECTED</cfif>>EU - &euro;</option>
	<option value="ZAR" <cfif fieldvalue EQ "zar">SELECTED</cfif>>SA - ZAR</option>
	</select> 
</cfif>    
<cfif fieldname EQ "event_type" >
<select name="event_type">
<option value="Event" <cfif fieldvalue IS "Event">SELECTED</cfif> >Event</option>
<option value="EB" <cfif fieldvalue IS "EB">SELECTED</cfif>>Briefing</option>
<option value="Din" <cfif fieldvalue IS "Din">SELECTED</cfif> >Dinner</option>
<option value="Week" <cfif fieldvalue IS "Week">SELECTED</cfif> >Oil Week</option>
<option value="book"  <cfif fieldvalue IS "book">SELECTED</cfif>>Books</option>
<option value="CLUB"  <cfif fieldvalue IS "CLUB">SELECTED</cfif>>Club</option>
<option value="Advis"  <cfif fieldvalue IS "Advis">SELECTED</cfif>>Advisory</option>
<option value="CM"  <cfif fieldvalue IS "CM">SELECTED</cfif>>Content Management</option>
<option value="Roadshow" <cfif fieldvalue IS "Roadshow">SELECTED</cfif> >Roadshow</option>
</select>
</cfif>
 
<cfif fieldname EQ "event_loc_country" > 
	<cfinclude template="qry_country.cfm">
	<cfset told="valid">
    <CFLOOP INDEX=Loop FROM=1 TO=236>
		<cfif #this_country[Loop][2]# EQ #fieldvalue#>
			<cfset told="#this_country[Loop][1]#">
		</cfif>
	</CFLOOP>
    <CF_dsp_country Add_Text="Country" Add_value=1 Optionvalue=2  defaultSelected="#told#" selectname="event_loc_country" >
</cfif>
<!--- WUSIWUG Area ------------------------------------------->
<cfif fieldname EQ "event_blurb_exhib" OR fieldname EQ "event_blurb_sponsors" OR fieldname EQ "event_blurb_program" OR fieldname EQ "event_blurb" OR fieldname EQ "event_loc_xchange"  OR fieldname EQ "event_cost_details">
<script type="text/javascript">
	tinyMCE.init({
		// General options
		mode : "textareas",
		mode : "exact",
		elements : "#fieldname#",
		theme : "advanced",
		skin : "o2k7",
		skin_variant : "black",
		plugins : "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",

		// Theme options
		theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontsizeselect",
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,bullist,numlist,|,outdent,indent,blockquote,|,link,unlink,image,cleanup,help,code,|,preview,|,forecolor",
		theme_advanced_buttons3 : "",
		theme_advanced_buttons4 : "",
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
<textarea name="#fieldname#" id="#fieldname#"  rows="15" cols="80" style="width: 90%" >#fieldvalue#</textarea>
<!---
<cfscript>
			fckEditor = createObject("component", "/FCKeditor/fckeditor");
			fckEditor.instanceName="#fieldname#";
			fckEditor.basePath="../FCKeditor/";
			fckEditor.value="#fieldvalue#";
			fckEditor.width="100%";
			fckEditor.height="100%";
			fckEditor.canUpload="false";
			fckEditor.checkBrowser="false";	
			fckEditor.create(); // create instance now.
</cfscript>--->

</cfif>
</cfoutput>



<cfif fieldname EQ "Econf" OR fieldname EQ "live" ><cfoutput>
<input name="#fieldname#" type="checkbox" value="ok" <cfif fieldvalue EQ 1> checked</cfif> />

</cfoutput></cfif>
<!--- SELECT HOTEL ____------>
<cfif fieldname EQ "Enquir" OR fieldname EQ "exhEnq" OR fieldname EQ "sponEnq" OR fieldname EQ "accPay" OR fieldname EQ "VisCont" OR fieldname EQ "AcoCont" OR fieldname EQ "PaCont" OR fieldname EQ "GenCont" OR fieldname EQ "staffOnDay" >
	<cfquery datasource="#dsnP21#" name="get">
		SELECT * FROM gppusers
	</cfquery>
<cfoutput>
	<!---<select name="#fieldname#" multiple style="width:200px" >
		<cfloop query="get">
			<option value="#get.id#" <cfif  listfind("#fieldvalue#", "#get.id#" , "," ) >selected</cfif> >#get.name#</option>
    	</cfloop>
	</select>--->
    <cfloop query="get">
    <label><input name="#fieldname#" type="checkbox" value="#get.id#" <cfif  listcontains(fieldvalue, get.id, "," ) NEQ "0"  >checked</cfif> /> #get.name#</label><br />
    </cfloop>
</cfoutput>
</cfif>
<!--- SELECT HOTEL ------>

<cfif fieldname EQ "hotel" >
	<cfquery datasource="#dsnP21#" name="get">
		SELECT * FROM hotels
	</cfquery>
<cfoutput>
	<select name="#fieldname#" style="width:200px" >
		<cfloop query="get">
			<option value="#get.id#" <cfif  listcontains(fieldvalue, get.id, ",") >selected</cfif> >#get.hotelname#</option>
    	</cfloop>
	</select>
</cfoutput>
</cfif>
<!--- SELECT Group ____------>

<cfif fieldname EQ "groupby" >
	<cfquery datasource="#dsnP21#" name="get">
		SELECT * FROM groupby
	</cfquery>
<cfoutput>
	<select name="#fieldname#" style="width:200px" >
			<option value="0" <cfif  get.id EQ 0 >selected</cfif> >no group</option>
        <cfloop query="get">
			<option value="#get.id#" <cfif  listcontains(fieldvalue, get.id, ",") >selected</cfif> >#get.groupby#</option>
    	</cfloop>
	</select>
</cfoutput>
</cfif>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</form>

</body>
</html>