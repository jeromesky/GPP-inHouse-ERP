<cfinclude template="../Application.cfm" >
<!---<cfquery datasource="#dsnP21#" name="get">
SELECT id,  name, subject
FROM MailOut_configuration 
WHERE id =  <cfqueryparam cfsqltype="cf_sql_integer" value="#form.emailid#">
</cfquery>--->

<cfquery datasource="#dsnP21#" name="get">
SELECT *
FROM SITE_Mailer_ListEmails
WHERE id =  #form.emailid#
</cfquery>

<script>
function SendEmail(){
	$("#space").html("").append("<img id=\'bar\' src='../img/ajax-loadBar.gif' width='180' height='19'>");
	$.post("../mailing/MailOut_Send.cfm", {emailid : <cfoutput>#form.emailid#</cfoutput> }, function(data) {  $("#space").html(""); $("#space").append("Successfully sent " + data );  })
}

$(function() {
		$('#B_SendNow').button({ text: true,});
	});
</script>

<!---<form id="sendit" name="form" method="post" action="MailOut_Send.cfm"></form>--->
<div id="space">
<table width="340" border="0" cellspacing="4" cellpadding="0" style="font-size:12px; font-family:Arial, Helvetica, sans-serif">
  <tr>
    <td colspan="2" height="55" valign="top"><cfoutput>
Email Name: <strong>#get.name#</strong><br />
Email Type: <strong><CFIF get.template NEQ 0 >Template email<cfelse>Text email</CFIF></strong><br />
Subject: <strong>#get.subject# <cfif get.test eq 1 > <span style="color:##CC3300">(TEST)</span></cfif></strong> <br />
Send to: <cfif get.test eq 1 ><span style="color:##CC3300">#get.company#</span>
<cfelseif get.CompanySearch NEQ "">#get.CompanySearch#<cfelseif get.OnlyRegistered EQ 1 >
Registered attendies for
<cfelse>
  <cfif get.test Neq 1 ><span style="color:##CC3300">
    <cfif get.chkWebIntWo EQ 1 >World Interest, </cfif>
    <cfif get.chkWebIntAf EQ 1 >Africa Interest, </cfif> 
    <cfif get.chkWebIntNaf EQ 1 >North African Interest, </cfif> 
    <cfif get.chkWebIntSAE EQ 1 >Southern Africa Interest, </cfif> 
    <cfif get.chkWebIntMe EQ 1 >Midle East Interest, </cfif>
    <cfif get.chkWebIntAs EQ 1 >Asia Interest, </cfif>
    <cfif get.chkWebIntNa EQ 1 >North America, </cfif> 
    <cfif get.chkWebIntLa EQ 1 >Latin INterest, </cfif> 
    <cfif get.chkWebIntEu EQ 1 >Europe Interest, </cfif>
    <cfif get.chkWebIntGen EQ 1 >General Interest, </cfif>
    <cfif get.chkWebIntAdvertising EQ 1 >3rd Party Advertising, </cfif>
    <cfif get.chkWebIntEA EQ 1 >Eastern Africa Interest, </cfif>
    <cfif get.chkWebIntWa EQ 1 >Western Africa Interest </cfif>
    <cfif get.chkWebIntAus EQ 1 >Australia </cfif>
  </span>
	<cfif get.conferenceExclude EQ 1 >Excluding attendies for </cfif>
</cfif>
</cfif>
<cfif  get.country NEQ "">#get.country#</cfif>
</cfoutput></td>
  </tr>
  <tr>
    <td height="25"><!--- Records: +/- insert count here ---></td>
    <td><a href="javascript:SendEmail(<cfoutput>#form.emailid#</cfoutput>);" id="B_SendNow">Send Now</a>
      <!---<input type="submit"  id="button" value="Yes" /><input type="hidden" name="emailid" value="<cfoutput>#form.emailid#</cfoutput>" />---></td>
  </tr>
</table>
</div>