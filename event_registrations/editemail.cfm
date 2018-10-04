<cfinclude template="../application.cfm">
<cfif parameterexists(form.gemail)>
<cfquery datasource="#dsnP21#" name="new">
SET ANSI_WARNINGS OFF
		UPDATE "Registrations"
		SET gemail 	= '#form.gemail#'
   		Where id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
SET ANSI_WARNINGS ON   
</cfquery>
<cflocation url="registrationDetails.cfm?id=#form.id#">
</cfif>
<cfquery datasource="#dsnP21#" name="order">
   SELECT id, title, name, surname, gemail 
   FROM Registrations
   Where id = <cfqueryparam cfsqltype="cf_sql_integer" value="#id#">
</cfquery>
<html>
<head>
<link rel="stylesheet" href="../img/p21-gry.css" type="text/css" mcedia="screen" title="grey" />

<title>P21</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.linker{ font-family:Arial, Helvetica, sans-serif; font-size:11px; color:#999999; text-decoration:none;}
A.linker{ font-family:Arial, Helvetica, sans-serif; font-size:11px; color:#999999; text-decoration:none;}
a:hoverlinker{ font-family:Arial, Helvetica, sans-serif; font-size:11px; color:#00CC00; text-decoration:underline;}
.t_detail{
	clear:both;
	overflow:hidden;
}
.t_detail .title {
	float:left;
	clear:left;
	color: #335EA8;
	width:253px;
	padding:4px;
	margin:2px;
		border-left:1px solid #AAAAAA;
}

.t_detail .info {
	float:left;
	clear:right;
	width:135px;
	color: #335EA8;
	padding:4px;
	margin:2px;
	
		border-left:1px solid #AAAAAA;
}
.t_detail .temp {
	float:left;
	clear:right;
	width:186px;
	color: #335EA8;
	padding:4px;
	margin:2px;
	border:1px solid #EEEEEE;
}

.t_detail .name {
	float:left;
	clear:left;
	width:180px;
	color: #335EA8;
	padding:4px;
	margin:2px;
		border-right:1px solid #AAAAAA;
		background-color:#FFFFFF;
}

.t_detail .surname {
	float:left;
	clear:right;
	width:520px;
	color: #335EA8;
	padding:4px;
	margin:2px;
	background-color:#F5F5F5;
	background:ffffff;
}
.t_detail .email {
	float:left;
	clear:right;
	width:340px;
	color: #335EA8;
	padding:4px;
	margin:2px;
		border-left:1px solid #AAAAAA;
}
.t_detail .user {
	float:left;
	clear:right;
	width:100px;
	color: #335EA8;
	padding:2px;
	margin:2px;
	border:1px solid #E0E7FE;
	background-color:#E0E7FE;
}
.t_detail .events {
clear:both;
	float:left;
	width:710px;
	color: #335EA8;
	padding:4px;
	margin:2px;
	border-left:1px solid #AAAAAA;
}
.t_detail .links {
clear:both;
	float:left;

	width:710px;
	color: #335EA8;
	padding:4px;
	border-left:1px solid #AAAAAA;
	border-bottom:##EEEEEE 1px solid;
	margin:2px 2px 8px 2px ;
}
-->
</style></head>

<body >
<div id="header">Transactions from NetBanx:  -- Edit Email address</div>
<div style="margin:10px 20px 0 20px; background-color:##EFEFEF; padding:10px 20px 10px 20px;">
  <form action="editemail.cfm" method="post">
   <div style="background-color:#FFFFFF; width:670px;"> 
     <div class="t_detail" >	 
		<div>
  		<div class="title" style=" width:710px; background-color:##FFFFCC">Change email address</div>
  		</div>
	</div>
	<div class="t_detail">	 
		<div >
  		<div class="name"></div> 
  		<div class="surname"></div>
		</div>
</div>
<div class="t_detail">	 
		<div>
  		<div class="name">Name</div> 
  		<div class="surname"><cfoutput query="order">#title# #name# #surname#</cfoutput></div>
		</div>
</div>
<div class="t_detail">	 
		<div>
  		<div class="name">Current email address</div> 
  		<div class="surname"><cfoutput query="order">#gemail#</cfoutput></div>
		</div>
</div>
<div class="t_detail">	 
		<div >
  		<div class="name" >Change to new address</div> 
  		<div class="surname" >
  		  <input type="text"name="gemail">
  		</div>
		</div>
</div>
<div class="t_detail">	 
		<div >
  		<div class="name"></div> 
  		<div class="surname">
  		  <input type="submit" name="Submit" value="change">
  		  <input type="hidden" name="id" value="<cfoutput query="order">#id#</cfoutput>">
  		</div>
		</div>
</div>
</div>
  </form> 
  </div>
</body>
</html>