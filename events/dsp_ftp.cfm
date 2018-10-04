<cfif parameterexists(form.id)>
	<cfset id = #form.id# >
<cfelse >
	<cfset id = #url.id# >
 </cfif>
 <cfif parameterexists(form.field)>
	<cfset field = #form.field#>
<cfelse >
	<cfset field = #url.field# >
 </cfif>
<cfset randomNum = RandRange(1000, 9999)  >
<cfinclude template="../Application.cfm">

<!---<cfif parameterexists(form.Upload)>--->
	<cfset fieldname = #field# >
	<cfset theMonth = MonthAsString(Month(Now()))>

<!--- get the field values------------------------>
	<cfquery name="get_event" datasource="#gpp#">
   SELECT #fieldname#, event_abbr, YEAR(event_expire) AS event_year
   FROM tblAnnual_Conf
   WHERE webid = #form.id#
	</cfquery>
	<cfset fieldvalue = "#Evaluate("get_event.#fieldname#")#">

<!--- check 4 existing file  and delete --->
<cfif parameterexists( form.for )>
	<cfif form.for EQ  "headBanner"> 
    
    <cfelse>
			<cfif fieldvalue NEQ "" AND FileExists("G:\Websites\petro21\htdocs\docs\#fieldvalue#")>
					<CFFILE ACTION="DELETE" FILE="G:\Websites\petro21\htdocs\docs\#trim(fieldvalue)#">
			</CFIF>
    </cfif>
<cfelse>
 			<cfif fieldvalue NEQ "" AND FileExists("G:\Websites\petro21\htdocs\docs\#fieldvalue#")>
					<CFFILE ACTION="DELETE" FILE="G:\Websites\petro21\htdocs\docs\#trim(fieldvalue)#">
			</CFIF>   
</cfif>
<!--- upload new & add 2 db --->
	<CFFILE ACTION="Upload" FILEFIELD="form.Upload" DESTINATION="G:\Websites\petro21\htdocs\docs" nameconflict="MAKEUNIQUE">
    <cfset newname = "#randomNum##get_event.event_year#_#trim(form.for)#_#dateformat(now(), "ddmmyy")#.#file.clientFileExt#">
	
    <cffile action="rename"  source="G:\Websites\petro21\htdocs\docs\#File.ServerFile#" destination="G:\Websites\petro21\htdocs\docs\#newname#">
	<CFQUERY datasource="#gpp#">
    	UPDATE tblAnnual_Conf
    	Set #fieldname# = '#newname#' 
    	WHERE webid = #form.id#
	</cfquery>

<!---<cfelse>
<html><head>
<title>Petro21.com</title>
</head>
<body <cfif parameterexists(form.Upload)>onload="javascript:parent.window.hs.closeId('<cfoutput>#fieldname#</cfoutput>')"</cfif>>
<script language="JavaScript1.2">
 function CheckAll() {	
  if (document.AddForm.UploadPDF.value.length <= 4)  { alert("Please select a file.") }
  else { document.AddForm.submit(); }
  }
</script>
<form action="dsp_ftp.cfm" method=post enctype="multipart/form-data">

<cfoutput>
<b>Select a File to Upload:</b><br>
<input type="hidden" name="id" value="#id#">
<INPUT Name="Upload" Size=55 Type="file">
<input name="field" type="hidden" value="#field#" />
<input type="hidden" name="for" value="#url.for#">
</cfoutput>
<br>
<input value="Submit" type="submit">
</form>
</body></html>
</cfif>--->