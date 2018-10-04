<cfinclude template="../application.cfm">
<cfquery datasource="#dsnP21#" name="order">
   SELECT * 
   <cfif parameterexists(url.old)>
   FROM Registrations_old
   <cfelse>
   FROM Registrations
   </cfif>
   Where id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">

</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<script type="text/javascript" src="../javascript/jquery.js" ></script>
<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
<link href="../styles/indexV2.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>P21</title>
</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<cfoutput query="order">
<div id="header">Transactions -- Transactions from NetBanx:  -- <span class="header_title">Details for #title# #name# #surname#</span></div>
<div id="outer">
	<div id="iner"> 
<div class="wbbg_large">
					<div class="tb"   >
					  <div class="title"><strong>Card Payments</strong>  Detailed for #title# #name# #surname# </div>
					</div>
</div>
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1">Event</div>
					        <div class="col2"><span class="surname">#event#</span></div>
						</div>					
					</div>
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><span class="name">Netbanx-ref</span></div>
					        <div class="col2"><span class="surname">#netbanx_reference#</span></div>
						</div>					
					</div>
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><span class="name">Card holder name </span></div>
					        <div class="col2"><span class="surname">#cardholder_name#</span></div>
						</div>					
					</div>
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><span class="name">Event cost </span></div>
					        <div class="col2"><span class="surname">#currency# #eventcost#</span></div>
						</div>					
					</div>
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><span class="name">Vat</span></div>
					        <div class="col2"><span class="surname">#VAT#</span></div>
						</div>					
					</div>
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><span class="name">Total in GBP</span></div>
					        <div class="col2"><span class="surname">£#payment_amount_GBP#</span></div>
						</div>					
					</div>
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><span class="name">Company no* </span></div>
					        <div class="col2"><span class="surname">#vatreg#</span></div>
						</div>					
					</div>
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><span class="name">Email</span></div>
					        <div class="col2"><span class="surname">#email#</span></div>
						</div>					
					</div>	
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><span class="name">Transaction date</span></div>
					        <div class="col2"><span class="surname">#TransDate#</span></div>
						</div>					
					</div>	
																					
<div class="titlebottom_large"></div>
<!--- start details --->
<div class="wbbg_large">
					<div class="tb"   >
					  <div class="title"><strong>Attendee Detailed</strong>  </div>
					</div>
</div>
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><span class="name">Event attendee</span></div>
					        <div class="col2"><span class="surname">#title# #name# #surname#</span></div>
						</div>					
					</div>
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><span class="name">Company</span></div>
					        <div class="col2"><span class="surname">#company#</span></div>
						</div>					
					</div>
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><span class="name">Possition</span></div>
					        <div class="col2"><span class="surname">#hposition#</span></div>
						</div>					
					</div>
					<div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><span class="name">Address</span></div>
					        <div class="col2"><span class="surname">#address#</span></div>
						</div>					
					</div>
					<div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><span class="name">City</span></div>
					        <div class="col2"><span class="surname">#city#</span></div>
						</div>					
					</div>
                    <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><span class="name">Post Code</span></div>
					        <div class="col2"><span class="surname">#zip#</span></div>
						</div>					
					</div>
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><span class="name">Country</span></div>
					        <div class="col2"><span class="surname">#country#</span></div>
						</div>					
					</div>
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><span class="name">Telephone</span></div>
					        <div class="col2"><span class="surname">#tel#</span></div>
						</div>					
					</div>
                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><span class="name">Email</span></div>
					        <div class="col2"><span class="surname">#gemail#</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="editemail.cfm?id=#id#" style="color:##993333"><img src="../img/arrow-forward_16.gif" border="0"> Change Email Address</a></div>
						</div>					
					</div>
</cfoutput>					
<div class="titlebottom_large"></div>
<!--- start see if billing --->
		<cfquery name="check" datasource="#dsnP21#">
			SELECT * FROM billing WHERE  userid = #order.userid#
		</cfquery>
<cfif check.recordcount NEQ 0 ><cfoutput>	
<div class="wbbg_large">
					<div class="tb"   >
					  <div class="title"><strong>Billing address </strong> Detailed </div>
					</div>
</div>
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><span class="name">Billing address contact name</span></div>
					        <div class="col2"><span class="surname">#check.title# #check.name# #check.surname#</span></div>
						</div>					
					</div>
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><span class="name">Billing company name</span></div>
					        <div class="col2"><span class="surname">#check.company#</span></div>
						</div>					
					</div>
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1" style="height:65px;"><span class="name">Billing company address </span></div>
					        <div class="col2" style="height:65px;"><span class="surname">#check.address#<br />#check.city#, #check.zip#<br />#check.country#</span></div>
						</div>					
					</div>

<div class="titlebottom_large"></div>
</cfoutput></cfif>
<!--- end billing addresss --->
  <cfif parameterexists(url.old)>
  <cfelse>
  	<cfset error = 0>
	<cfset countevents = ListLen(order.eventid) >
	<cftry>
	<cfquery datasource="#dsnP21#"    name="get">
SELECT * FROM welcomePack
Where eventid in (#order.eventid#)
</cfquery>
<cfcatch type = "Database"><cfset error="true"><script type="text/javascript">alert("<cfoutput>#cfcatch.Message#, #cfcatch.Detail#, #cfcatch.Type#,, #order.eventid#,, #countevents#</cfoutput>");</script></cfcatch></cftry>	
<cfset count = 0>
<cfif error NEQ true >
<div class="wbbg_large">
					<div class="tb"   >
					  <div class="title"><strong>Welcome Pack</strong> Files available </div>
					</div>
</div>
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1"><a href="creatPack.cfm">add welcome pack file</a></div>
					        <div class="col2"><a href="creatPack.cfm"><img src="../img/arrow-forward_16.gif" border="0"></a></div>
						</div>					
					</div>
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1_white">The following files bellow will be attached to the email when you click Approve below.</div>
						</div>					
					</div>
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1_blue">
								<div style="border:1px solid #666666; padding:20px 10px 10px 10px; background-color:#FFFFFF">
	<div class="row" >
		<div class="ftp_c1" style="background-color:#F7F7F7">File name </div>
		<div class="ftp_c2" style="background-color:#F7F7F7">File loaded</div>
		<div class="ftp_c3" style="background-color:#F7F7F7">&nbsp;</div>
		<div class="ftp_c4" style="background-color:#F7F7F7">&nbsp;</div>
		<div class="ftp_c5" style="background-color:#F7F7F7">&nbsp;</div>
		<div class="ftp_c6" style="background-color:#F7F7F7">&nbsp;</div>
	</div>	
<cfif error NEQ true >	
<cfoutput query=get>							
	<div class="row" >
		<div class="ftp_c1">#filepath#</div>
		<div class="ftp_c2">#dateloladed#</div>
		<div class="ftp_c3"></div>
		<div class="ftp_c4"></div>
		<div class="ftp_c5"></div>
		<div class="ftp_c6"></div>
	</div>							
<cfset count = count + 1 ></cfoutput>
</cfif>	
<div style="clear:both"></div>						
								</div>
<div style="clear:both"></div>
							</div>
<div class="titlebottom_large"></div>
						</div>					
					</div>

</cfif></cfif>
 
<div class="wbbg_large">
					<div class="tb">
					  <div class="title"><strong>Approve the Transaction</strong> and add user to e-conference and send email </div>
					</div>
</div>
  <cfif error NEQ true >
  <form action="saveEdit.cfm" method="post">
 	                <div class="row">	 
						<div style="margin:0px;">
							<div class="col1_blue">
<cfscript>
			fckEditor = createObject("component", "/FCKeditor/fckeditor");
			fckEditor.instanceName="message";
			fckEditor.basePath="../FCKeditor/";
			fckEditor.value="";
			fckEditor.width="100%";
			fckEditor.height="300";
			fckEditor.canUpload="false";
			fckEditor.checkBrowser="false";			
			fckEditor.create(); // create instance now.
</cfscript>			
							</div>
						</div>
					</div> 
					<div class="row" >	 
						<div style="margin:0px;">
							<div class="col1">Add email address to send  pack to</div>
					        <div class="col2">
					          <input name="ExtraEmail" type="text" value="" size="50">use ( ; )  in between address</div>
						</div>					
					</div>
                    <div class="row">
                    <div style="margin:0px;">
							<div class="col1">tick for no access to e-conference</div>
                            <div class="col2"><input name="AllowAccess" type="checkbox" value="ok"></div>
                    </div>
                    </div>
<cfoutput>				<div class="row" >	 
						<div style="margin:0px;">
							<div class="col1">Approved  Event and send  pack</div>
					        <div class="col2"><input type="submit" name="Submit" value="go"><input type="hidden" name="do" value="0"><input type="hidden" name="id" value="#order.id#"><input type="hidden" name="eventid" value="#order.eventid#"><input type="hidden" name="userid" value="#order.userid#"></div>
						</div>					
					</div>
</cfoutput></form>					
<cfif error EQ true >	<cfoutput>				
	                <div class="row" >	 
						<div style="margin:0px;">
							<div class="col1">Approved Transaction</div>
					        <div class="col2"><form action="saveEdit.cfm" method="post"><input type="submit" name="Submit" value="go"><input type="hidden" name="do" value="2"><input type="hidden" name="id" value="#order.id#"> </form></div>
						</div>					
					</div>
</cfoutput></cfif>
<div class="titlebottom_large"></div>
 </cfif>
</div></div>
</body>
</html>
