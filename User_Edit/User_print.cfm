<cfquery datasource="#gpp#" name="getUser">
 	select top 1 *,  
    
    '' as AREACODETEL, '' AS STRPHDIRECT_NO, '' AS AREACODETELALT, '' AS STRPHALT1_NO, '' AS AREACODEFAX, '' AS STRFAXDIRECT_NO, '' AS AREACODEFAXALT,
    '' as  STRFAXALT1_NO, '' AS STRMOBILE_NO, '' AS USERPHONUMBINT
	
    from CRM_Individual_Details
	WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>

<cfquery datasource="#gpp#" name="getRegistrations">
 	select  *
	from CRM_Invoices_User
	WHERE user_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
   ORDER BY ID DESC
</cfquery>

<!---<cfdump var="#getUser#"><cfdump var="#getRegistrations#">--->
<script type="text/javascript" >
$(document).ready(function() { 
	$("#print_button").click(function(){
	    	$("div#printArea").jqprint({importCSS: true});  
	});
});	
</script>

<style type="text/css" media="screen">
body {
	padding: 0;
	margin: 0;
}

.clear {
	clear: both;
	height: 0;
}
br.clear {
	clear: both;
	height: 0;
	border-bottom: 1px solid #ccc;
}
#container {
 	margin: 0;
	width: 194mm;
}
.factuurlijn {
	width: 196mm;
	border-bottom: 1px solid #ccc;
}
#printArea i { background-image:none; width:185px; color:#000000; display:block; float:left; margin:2px 0 2px 2px; padding:0px; font-style:normal; min-height:20px;}
#printArea span{ color:#666666; width:60px; display:block; float:left; padding:0px; margin:2px 0 2px 0; clear:both; min-height:20px;}
#recordRow {
	width: 196mm;
	border: 1px dotted #666;
}
#PageTitle {
	font: bold 14pt/20pt  'Lucida Grande', "Lucida Sans", "Lucida Sans Unicode";
	color: #666;
	letter-spacing: 2px;
	display: block;
	border-bottom: 1px dotted #666;
	border-top: 1px dotted #666;
	margin: 0mm 0 5mm 0;
}
.titel1, .titel2, .titel3, .comment {
	display:block;
	font: normal 9pt/11pt 'Lucida Grande', "Lucida Sans", "Lucida Sans Unicode";
	color: #5d5d5d;
	
	background: #f7f7f7;
	padding: 5px;
	float: left;
	min-height:20px; 
}
.eventName, .evenAttend {
	display:block;
	font: normal 9pt/11pt 'Lucida Grande', "Lucida Sans", "Lucida Sans Unicode";
	color: #000;
	border-bottom: 1px dotted #666;
	padding: 5px;
	float: left;
}
.eventName{border-left: 1px dotted #666;width: 128mm;clear:both;} 
.evenAttend { width: 62mm; border-left: 1px dotted #666;}
.comment {width: 192mm;clear:both;} 
.titel1 {
	width: 62mm;
	clear:both;
}
.titel2 {
	width: 62mm;
}

.titel3 {
	width: 63mm;
}
.secondRow {
	background: #eee;
}
#printArea {
 	position: absolute;
	left: 2mm;
	top: 10mm;
}
</style>
<cfoutput>
<div id="container" >
<div id="printArea">
<style type="text/css" media="print">
body {
	padding: 0;
	margin: 0;
}
.clear {
	clear: both;
	height: 0;
}
br.clear {
	clear: both;
	height: 0;
	border-bottom: 1px solid ##ccc;
}
##container {
 	margin: 0;
	width: 194mm;
}
.factuurlijn {
	width: 196mm;
	border-bottom: 1px solid ##ccc;
}
##printArea i { background-image:none; width:185px; color:##000000; display:block; float:left;  margin:2px 0 2px 2px; padding:0px; font-style:normal; min-height:20px;}
##printArea span{ color:##666666; width:60px; display:block; float:left; padding:3px 0 1px 0; margin:2px 0 2px 0; clear:both;  min-height:20px;}
##recordRow {
	width: 196mm;
	border: 1px dotted ##666;
}
##PageTitle {
	font: bold 14pt/20pt  'Lucida Grande', "Lucida Sans", "Lucida Sans Unicode";
	color: ##666;
	letter-spacing: 2px;
	display: block;
	border-bottom: 1px dotted ##666;
	border-top: 1px dotted ##666;
	margin: 0mm 0 5mm 0;
}
.titel1, .titel2, .titel3, .comment {
	display:block;
	font: normal 9pt/11pt 'Lucida Grande', "Lucida Sans", "Lucida Sans Unicode";
	color: ##5d5d5d;
	background: ##f7f7f7;
	padding: 5px;
	float: left;
	min-height:20px; 
}
.eventName, .evenAttend {
	display:block;
	font: normal 9pt/11pt 'Lucida Grande', "Lucida Sans", "Lucida Sans Unicode";
	color: ##000;
	border-bottom: 1px dotted ##666;
	padding: 5px;
	float: left;
}
.eventName{border-left: 1px dotted ##666;width: 128mm;clear:both;} 
.evenAttend { width: 62mm; border-left: 1px dotted ##666;}
.comment {width: 192mm;clear:both;} 
.titel1 {
	width: 62mm;
	clear:both;
}
.titel2 {
	width: 62mm;
}
.titel3 {
	width: 63mm;
}
.secondRow {
	background: ##eee;
}
##printArea {
 	position: absolute;
	left: 2mm;
	top: 10mm;
}
</style>

<div id="PageTitle">#Ucase(getUser.title)# #Ucase(getUser.name)# #Ucase(getUser.surname)#</div>
<table border="0">
<tr>
	<td height="95" valign="top">
      <span>Position</span> 
      <i>#getUser.position#</i>
      <span>Company</span> 
      <i>#getUser.companyName#</i>
      <span>Label</span> 
      <i>#getUser.AKA_companyName#</i>
      <span>City</span> <i>#getUser.city#</i>
      <span>Coutry</span> <i>#getUser.country#</i>
      <span>Address </span> <i>#getUser.strStreet_Adress#</i> 
      <span>Postal</span> <i>#getUser.strPostal_Adress# </i>
      <span>State</span> <i>#getUser.Addr_State#</i>  
      <span>ZIP/Code</span> <i>#Ucase(getUser.intCode)#</i>   
    </td>
    <td valign="top">
      <span>tel</span>
      <i>#getUser.countryPhoneCode# #getUser.AreaCodeTel# #getUser.strPhDirect_No#</i>
      <span>tel switch</span>
      <i >#getUser.countryPhoneCode# #getUser.AreaCodeTelSwitch# #getUser.strPhSwitchboard_No#</i> 
      <span>tel alt</span>
      <i>#getUser.countryPhoneCode# #getUser.AreaCodeTelAlt# #getUser.strPhAlt1_No#</i>                 
      <span>fax </span>
      <i>#getUser.countryPhoneCode# #getUser.AreaCodeFax# #getUser.strFaxDirect_No#</i>
      <span >fax switch</span>
      <i>#getUser.countryPhoneCode# #getUser.AreaCodeFaxSwitch# #getUser.strFaxSwitchBoard_No#</i>
      <span >fax alt</span>
      <i>#getUser.countryPhoneCode# #getUser.AreaCodeFaxAlt# #getUser.strFaxAlt1_No#</i> 
      <span >Mobile </span> 
      <i>#getUser.strMobile_No#</i>
      <span>Int number </span> 
      <i>#getUser.userPhoNumbInt#</i>       
</td>
    <td valign="top">
      <span>Email</span> <i>#getUser.strEmail#</i>
      <span>Email alt</span> <i>#getUser.strEmail_Alt#</i>
      <span>Email sec</span> <i>#getUser.strSecretary_Email#</i>
      <span>Email web</span> <i>#getUser.email_web#</i>
      <span>Password</span> <i>#getUser.password#</i>
      <div class="clear"></div>
      <button id="print_button">Print</button>
    </td>
   </tr>
  </table>
<div id="PageTitle">REGISTRATIONS</div>
<cfloop query="getRegistrations"><div id="recordRow">
      <div class="eventName">#getRegistrations.event#</div>
      <div class="evenAttend"><cfif getRegistrations.chkDelegate EQ 1 >delegate
		<cfelseif getRegistrations.chkSpeaker EQ 1>speaker
        <cfelseif getRegistrations.chkGuest EQ 1>guest
        <cfelseif getRegistrations.chkModerator EQ 1>moderator
        <cfelseif getRegistrations.chkExhibitor EQ 1>exhibitor
        <cfelseif getRegistrations.chkPress EQ 1>press
        <cfelseif getRegistrations.chkResearch EQ 1>research
        <cfelseif getRegistrations.chkSponsor EQ 1>sponsor</cfif>
        <cfif getRegistrations.guest EQ 1 > / 3rd party Guest</cfif></div>
<div class="titel1">invoice: #getRegistrations.InvoiceNo_LNK#</div>
        <div class="titel2">Paid: <cfif getRegistrations.InvoicePaid eq "No" AND getRegistrations.chkDelegate EQ 1 OR  getRegistrations.chkExhibitor EQ 1 >NO<cfelse>Not waiting</cfif></div>
        <div class="titel3">#getRegistrations.Cancel_Reason#</div>
        <cfif getRegistrations.INVComments NEQ ""><div class="comment">#getRegistrations.INVComments#</div></cfif>
<div class="clear"></div>
</div></cfloop>
</div></div></cfoutput>