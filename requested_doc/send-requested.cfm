<cfinclude template="../application.cfm">
<cfif parameterexists(form.eventid)>
	<cfset eventid = #form.eventid#>
<cfelse>
	<cfset eventid = #url.eventid#>
</cfif>
<cfif parameterexists(form.id)>
	<cfset id = #form.id#>
<cfelse>
	<cfset id = #url.id#>
</cfif>
<!--- send email here -------------------------------->

<cfif parameterexists(form.action) OR parameterexists(url.action)>
<cfquery datasource="#dsnP21#"   name="re">
   SELECT id, title, name, surname, company, gemail, event, eventid, transdate FROM MoreInfo
   WHERE id = #id#
</cfquery>
<cfquery name=get datasource="#dsnP21#"   >
   	SELECT id, event_name, file_update  
	FROM events
	WHERE ID = #eventid#
</cfquery>

<cfmail
  	from="web@petro21.com"
	to="#re.gemail#" 	
	subject=" Requested Event Brochure for #get.event_name#, www.petro21.com" type="html">
	<cfmailparam file="G:\websites\petro21\htdocs\docs\#get.file_update#">
	

Dear #re.title# #re.name# #re.surname#,<br><BR>
Please find attached the Brochure you have requested for  #get.event_name# on the  #dateformat( re.transdate,"dd mmmm yyyy")# from  www.Petro21.com . <br><BR>
For updates on the Event, please follow this link  <a href="http://www.petro21.com/events/index.cfm?id=#get.id#">www.petro21.com</a><br><BR>

<cfif parameterexists(comment) >#form.comment#<br /><br /></cfif>

with best regards,<br /><br />

<cfinclude template="../../petro21/Components/signaturehtml.cfm" >
</cfmail>

 <cfquery datasource="#dsnP21#"   name="del">
   DELETE FROM MoreInfo
   WHERE id = #id#
</cfquery>

<cflocation url="index.cfm">
</cfif>
<!--- end send email, start get data to display ------------------------>


<cfquery datasource="#dsnP21#"   name="re">
   SELECT * FROM MoreInfo
   WHERE id = #id#
</cfquery>

<cfquery name=qry_event datasource="#dsnP21#"   >
   	SELECT id, file_update  
	FROM events
	WHERE ID = #eventid#
</cfquery>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>P21</title>
<link href="../styles/styles.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="header">Administration -- Requested brochures <span class="header_title">Send brochure </span></div>
<div id="outer">
	<div id="iner">

 <form name="form1" method="post" action="send-requested.cfm">
   				<div class="wbbg">
					<div class="tb" onClick="switchMenu('wtop');" onMouseOver="swap(this);" onMouseOut="swapOut(this);" >
					  <div class="title"><strong>Approve</strong>  and send email with brochure </div>
					</div>
				</div>
					<div class="row" >	 
						<div style="margin:0px;">
							<div class="col1_s">Person requesting brochure </div>
							<div class="col2_s"><cfoutput>#re.title# #re.name# #re.surname#</cfoutput></div>
						</div>					
					</div>
					<div class="row" >	 
						<div style="margin:0px;">
							<div class="col1_s">Company</div>
							<div class="col2_s"><cfoutput>#re.company#</cfoutput></div>
						</div>					
					</div>
					<div class="row" >	 
						<div style="margin:0px;">
							<div class="col1_s">Event</div>
							<div class="col2_s"><cfoutput>#re.event#</cfoutput></div>
						</div>					
					</div>
					<div class="row" >	 
						<div style="margin:0px;">
							<div class="col1_s">Date requested </div>
							<div class="col2_s"><cfoutput>#re.TransDate#</cfoutput></div>
						</div>					
					</div>
					<div class="row" >	 
						<div style="margin:0px;">
							<div class="col1_s">Brochure available</div>
							<div class="col2_s"><cfif qry_event.file_update NEQ ""><img src="../img/tick_circle.gif"><cfelse><img src="../img/cross_circle.gif" ></cfif></div>
						</div>					
					</div>
					<div class="row" >	 
						<div style="margin:0px;">
							<div class="col1_s" style=" height:113px;">
							  <p>Add comment to email</p>
							  <p>(click arrow on left to see field) </p>
							</div>
							<div class="col2_s" style=" height:113px;">
<cfscript>
			fckEditor = createObject("component", "/FCKeditor/fckeditor");
			fckEditor.instanceName="comment";
			fckEditor.basePath="../FCKeditor/";
			fckEditor.value="";
			fckEditor.width="100%";
			FCKeditor.ToolbarSet = 'Basic';
			fckEditor.height="100";
			fckEditor.canUpload="false";
			fckEditor.checkBrowser="false";
			fckEditor.create(); // create instance now.
	</cfscript>								
							</div>
						</div>					
					</div>					
					<div class="row" >	 
						<div style="margin:0px;">
							<div class="col1_s">Send brochure </div>
							<div class="col2_s"><input type="submit" name="Submit" value="Send" <cfif qry_event.file_update EQ "">disabled</cfif>>
								  <input type="hidden" name="action" value="1">
								  <input type="hidden" name="id" value="<cfoutput>#id#</cfoutput>">
	  								<input type="hidden" name="eventid" value="<cfoutput>#eventid#</cfoutput>">
							</div>
						</div>					
					</div>
	  </form>
					<div class="titlebottom"></div>
    </div>
</div>
</body>
</html>
