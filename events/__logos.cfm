<cfinclude template="../Application.cfm">

<cfif parameterexists(form.id)>
	<cfset id = #form.id# >
<cfelse >
	<cfset id = #url.id# >
 </cfif>
 <cfif parameterexists(form.field)>
	<cfset field = #form.field# >
<cfelse >
	<cfset field = #url.field# >
 </cfif>
 
 <cfif parameterexists(form.submit)>
<cfif parameterexists(form.p)> 
 	<cfset listInOrder = "" >
    <cfset possintioInOrder = "" >
 		<cfloop index="i" from="1" to="#listLen(form.p, ",")#">
 			<cfset listInOrder = listAppend(listInOrder, ListGetAt(form.sp,  ListFind(form.p, i , ","), ",")) >
   			<cfset possintioInOrder = listAppend(possintioInOrder, ListGetAt(form.p,  ListFind(form.p, i , ","), ",")) >
 		</cfloop>
</cfif>
 
  <cfquery datasource="#dsnP21#">
  UPDATE events
  SET 
  <cfif parameterexists(form.p)>logopos = '#possintioInOrder#',</cfif>	
  <cfif parameterexists(form.sp)>logos_supporter = '#listInOrder#'</cfif>
  <cfif parameterexists(form.su)>logos_sponsore = '#form.su#'</cfif>
  <cfif parameterexists(form.sb)>supportedby = '#form.sb#'</cfif>
  <cfif parameterexists(form.logo_Contributing) ><cfif form.logo_Contributing NEQ "">logo_Contributing = '#form.logo_Contributing#'<cfelseif form.logo_Contributing EQ "" >logo_Contributing = ''</cfif></cfif>
  <cfif parameterexists(form.logo_CorpMembers)><cfif form.logo_CorpMembers NEQ "">logo_CorpMembers = '#form.logo_CorpMembers#'<cfelseif form.logo_CorpMembers EQ "" >logo_CorpMembers = ''</cfif></cfif>
  <cfif parameterexists(form.logo_CorpSponsor)><cfif form.logo_CorpSponsor NEQ "">logo_CorpSponsor = '#form.logo_CorpSponsor#'<cfelseif form.logo_CorpSponsor EQ "" >logo_CorpSponsor = ''</cfif></cfif>
  <cfif parameterexists(form.logo_Patron)><cfif form.logo_Patron NEQ "">logo_Patron = '#form.logo_Patron#'<cfelseif form.logo_Patron EQ "" >logo_Patron = ''</cfif></cfif>
   WHERE id = #form.id#
  </cfquery>
 </cfif>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
<title>www.petro21.com</title>

</head>
<body  <cfif parameterexists(form.submit)>onload="javascript:parent.window.hs.closeId()"</cfif>  >

<script src="../Javascript/jquery.js" type="text/javascript"></script>
<script src="../Javascript/jquery.tooltip.js" type="text/javascript"></script>
<script type="text/javascript">
var $j = jQuery.noConflict();

$j(function() {
$j('#holder *').tooltip({
	showURL: false,
	showBody: " - ",
	fade: 250
});

});
</script>
<cfif parameterexists(form.submit)>

<cfelse>
<cfset fieldname =  #field# >
<cfquery name="get_event" datasource="#dsnP21#">
   SELECT #fieldname#, logopos
   FROM events
   WHERE id = #id#
</cfquery>
<cfset fieldvalue =  "#Evaluate("get_event.#fieldname#")#" >
<form action="#" method="post" id="holder">
<input type="hidden" name="id" value="<cfoutput>#id#"><input type="hidden" name="#fieldname#" value="</cfoutput>" />
						<div class="row" >	 
						<div style="margin:0px;">
							<div style=" width:400px;background-color:#CCCCCC;height:23px; clear:left; float:left">company </div>
                            <cfif fieldname EQ "logos_supporter" >
						    <div style=" width:60px;background-color:#CCCCCC;height:23px; clear:right; float:left">sponsors</div>
							<div style=" width:60px;background-color:#CCCCCC;height:23px;clear:right; float:left">position</div>
                            </cfif>
                            <cfif fieldname EQ "logos_sponsore" OR fieldname EQ "supportedby" >
							<div style=" width:60px;background-color:#CCCCCC;height:23px; clear:right; float:left"><cfif fieldname EQ "logos_sponsore">Media<cfelseif fieldname EQ "supportedby" >Supported by</cfif></div>
                            </cfif>
							
							<div style=" width:80px;background-color:#CCCCCC;height:23px;clear:right; float:left">view logo</div>
						</div>					
					</div>
<!--- staRT logos --->
<cfquery datasource="#dsnP21#" name="logos">
SELECT id, logofile, company FROM logos ORDER BY company
</cfquery>
					<div class="row" >	 
						<div style="margin:0px;">
							<div  style=" width:400px;"></div>
						    <div  style=" width:80px;"><input type="submit" value="Submit logos" name="Submit"></div>
						</div>					
					</div>	
<cfset counter = 0>
<cfloop query="logos"><cfoutput>	
					<div class="row" >	 
						<div style="margin:0px;" onMouseOver="this.style.backgroundColor='##c2eeff';" onMouseOut="this.style.backgroundColor='##ffffff';">
							<div style=" width:400px; clear:left; float:left">#company#</div>
                            <cfif fieldname EQ "logos_supporter" >
						    <div style=" width:60px;;  clear:right; float:left"><input name="sp" type="checkbox" value="#logos.id#" <cfif ListFind(#get_event.logos_supporter#, logos.id, ",") > checked <cfset LP = ListContains(get_event.logos_supporter, logos.id, ",")></cfif>  /></div>
							<div  style=" width:60px;;  clear:right; float:left" ><input name="p" style="width:25px" type="text" <cfif ListFind(#get_event.logos_supporter#, logos.id, ",") AND get_event.logopos NEQ ""> value="#ListGetAt(get_event.logopos, LP ,",")#" </cfif>/></div>
							</cfif>
							<cfif fieldname EQ "logos_sponsore"  >
                            <div  style=" width:60px; clear:right; float:left" ><input name="su" type="checkbox" value="#logos.id#" <cfif ListFind(#get_event.logos_sponsore#, logos.id, ",") > checked </cfif>/></div>
							</cfif>
                            <cfif  fieldname EQ "supportedby" >
                            <div  style=" width:60px; clear:right; float:left" ><input name="sb" type="checkbox" value="#logos.id#" <cfif ListFind(#get_event.supportedby#, logos.id, ",") > checked </cfif>/></div>
							</cfif>
                            <cfif  fieldname EQ "logo_Contributing" >
                            <div  style=" width:60px; clear:right; float:left"><input name="logo_Contributing" type="checkbox" value="#logos.id#" <cfif ListFind(#get_event.logo_Contributing#, logos.id, ",") > checked </cfif>/></div>
							</cfif>
                            <cfif  fieldname EQ "logo_CorpMembers" >
                            <div  style=" width:60px; clear:right; float:left"><input name="logo_CorpMembers" type="checkbox" value="#logos.id#" <cfif ListFind(#get_event.logo_CorpMembers#, logos.id, ",") > checked </cfif>/></div>
							</cfif>
                            <cfif  fieldname EQ "logo_CorpSponsor" >
                            <div  style=" width:60px; clear:right; float:left"><input name="logo_CorpSponsor" type="checkbox" value="#logos.id#" <cfif ListFind(#get_event.logo_CorpSponsor#, logos.id, ",") > checked </cfif>/></div>
							</cfif>
                            <cfif  fieldname EQ "logo_Patron" >
                            <div  style=" width:60px; clear:right; float:left"><input name="logo_Patron" type="checkbox" value="#logos.id#" <cfif ListFind(#get_event.logo_Patron#, logos.id, ",") > checked </cfif>/></div>
							</cfif>
                            <div  style=" width:60px; clear:right; float:left"><a href="../logos/#logofile#" title="">logo</a></div>

							<div class="clear"></div>
                        </div>
                        <div class="clear"></div>					
					</div>
<cfset counter = counter + 1>
</cfoutput></cfloop>	
					<div class="row" >	 
						<div style="margin:0px;">
							<div style="width:400px;"></div>
						    <div style="width:80px;"><input type="submit" value="Submit logos" name="Submit"></div>
						</div>					
					</div>	
</form>	
</cfif>									
</body>
</html>