<cfinclude template="../Application.cfm">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <!---  	SELECT title, name, surname, gemail, transdate, company, event, netbanx_reference 
	FROM Registrations As R1, Registrations_test AS R2
	WHERE #form.search# = '#form.quest#' AND R1.options = 'to register' AND R1.approved = 0  AND R2.approved = 1  
    ORDER BY name, surname 
	SELECT DISTINCT *
FROM         Registrations R1 CROSS JOIN
                      Registrations_test R2
WHERE     (R1.approved = 0) AND (R2.approved = 1) AND (R1.name = 'jerome') AND (R1.options = 'to register')
ORDER BY R1.name, R1.surname
SELECT     *
FROM         #form.table#
WHERE      <cfif form.table EQ  "Registrations">(approved = 0) <cfelse>(approved = 1) </cfif> AND (#form.search# = '#form.quest#') 
ORDER BY name, surname
	--->
    <link href="../styles/indexV2.css" rel="stylesheet" type="text/css">
<link href="../styles/styles.css" rel="stylesheet" type="text/css">
<script src="../Javascript/jquery.js" type="text/javascript"></script>

<title>P21</title>
<cfif parameterExists(quest)>
<cfquery name="order" datasource="#dsnP21#"  >
SELECT * FROM #form.table#
WHERE  #trim(form.search)# LIKE '%#trim(form.quest)#%'
ORDER BY name, surname 
  </cfquery>
</cfif>
<style type="text/css">
<!--
.border {

	color: #333333;
	background-color: #F5F5F5;
	padding-left: 8px;
	border-top-width: 1px;
	border-right-width: 1px;
	border-left-width: 1px;
	border-top-style: dotted;
	border-right-style: dotted;
	border-left-style: dotted;
	border-top-color: #CCCCCC;
	border-right-color: #CCCCCC;
	border-left-color: #CCCCCC;
	padding-bottom: 8px;
	padding-right: 5px;
	padding-top: 8px;
}
-->
</style></head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="header">Registrations -- Comleted registrations / Transactions:  -- <span class="header_title">Search registrations</span></div>
<div id="outer">
	<div id="iner">
				<div class="wbbg">
					<div class="tb"  >
					  <div class="title"><strong>Search</strong> Comleted registrations / transactions</div>
					</div>
				</div>
<form action="oldTransaction.cfm" method="post" >					
					<div class="row" >	 
						<div style="margin:0px;">
							<div class="col1_s">search registration by:</div>
						    <div class="col2_s">
<select name="search">
	  <option value="name">name</option>
      <option value="surname">surname</option>
      <option value="company">company</option>
      <option value="TransDate">registration date</option>
      <option value="netbanx_reference" selected>reference</option>
    </select>							
							</div>
						</div>					
					</div>

					<div class="row" >	 
						<div style="margin:0px;">
							<div class="col1_s">Select database to search</div>
						    <div class="col2_s"><input type="text" name="quest"> <input type="hidden" name="display" value="card">&nbsp;<input type="submit" name="Submit2" value="search"></div>
						</div>					
					</div>
					<div class="row" >	 
						<div style="margin:0px;">
							<div class="col1_s">Select database to search</div>
						    <div class="col2_s">
	<select name="table">
      <option value="Registrations">Current database</option>
	  <option value="Registrations_old">Old database</option>
    </select>				
							</div>
						</div>					
					</div>						
</form>
			<div class="titlebottom"></div> 

<!--- search resultsd --->		 
<cfif parameterexists(quest)>
				<div class="wbbg">
					<div class="tb"  >
					  <div class="title"><strong>Search results</strong> </div>
					</div>
				</div>			
					<div class="row" >	 
						<div style="margin:0px;">
						  <div class="trans_I_c1" style="background-color:#F0F0F0; height:19px;"></div>
						  <div class="trans_I_c2" style="background-color:#F0F0F0; height:19px;"></div>
						  <div class="trans_I_c3" style="background-color:#F0F0F0; height:19px;">view</div>
						  <div class="trans_I_c4" style="background-color:#F0F0F0; height:19px;">send email form</div>
						  <div class="trans_I_c5" style="background-color:#F0F0F0; height:19px;"></div>
						</div>					
					</div>	
<cfloop query=order><cfoutput>
  					<div class="row" >	 
						<div style="margin:0px;">
						<div class="bar">#netbanx_reference#: #TransDate#</div>
						</div>
					</div>	
					<div class="row" >	 
						<div style="margin:0px;">
						  <div class="trans_I_c1"><strong>#title# #name# #surname#</strong><br />#Left(company, 25)#<br />#gemail#</div>
						  <div class="trans_I_c2" >#event#</div>
						  <div class="trans_I_c3" ><a href="registrationDetails.cfm?id=#id#<cfif form.table EQ "Registrations_old">&old=1</cfif>"><img src="../img/new_edit.gif" border="0"></a></div>
						  <div class="trans_I_c4" ><a href="email_registration.cfm?id=#id#"><img src="../img/mail.gif" alt="send email for for transaction"></a></div>
						  <div class="trans_I_c5" ></div>
						</div>					
					</div>				
</cfoutput></cfloop>
			<div class="titlebottom"></div>
<div class="clear"></div>
</cfif>
</div>
</div>
</body>
</html>