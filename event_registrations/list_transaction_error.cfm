<cfinclude template="../Application.cfm">
<cfquery name="get_trans" datasource="#dsnP21#">
SELECT id, name, surname, gemail, title, event, TransDate, email, company, country, hposition
FROM Registrations
Where (cardpass = 0 OR cardpass IS NULL)  
AND (approved = 0 OR approved IS NULL) 
AND (gemail IS NOT NULL OR gemail <> '' ) 
AND  (transtype IS NULL OR transtype = 'card')
order by id desc
</cfquery>
<!--- transtype <> 'trans' OR transtype <> 'WT' OR transtype <> 'netbanx'--->
<cfquery name="get_dead" datasource="#dsnP21#">
SELECT id, name, surname, gemail, title, event, TransDate, email, cardholder_name
FROM Registrations
Where ((name IS NULL OR name = '') 
AND (surname IS NULL OR surname = '') A
ND (gemail IS NULL Or gemail = ''))  
order by id desc  
</cfquery>
<cfset counterloop="1">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="../styles/indexV2.css" rel="stylesheet" type="text/css">
<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
<script src="../Javascript/jquery.js" type="text/javascript"></script>
<style type="text/css">
<!-- 
#commentForm1
{
background-color:#FFFFFF;
padding:0px 0 0 0px;

}
#commentForm2
{
background-color:#FFFFFF;
padding:0px 0 0 0px;
width:740px;
display:none;

}
-->
</style>
<style type="text/css">
<!--
.style2 {	font-size: 11px;	font-family: Arial, Helvetica, sans-serif;	color: ##CC0000;}
.style3 {	font-size: 11px;	font-family: Arial, Helvetica, sans-serif;	color: ##00CC33;}
.style4 {	font-family: Arial, Helvetica, sans-serif;	font-size: 12px;	color: ##333333;}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #333333;
}#Layer1 {
	position: relative;
	width:132px;
	height:6px;
	z-index:1;
	visibility: hidden;
}

a {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #333333;
	text-decoration: none;
}
a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #003366;
	text-decoration: underline;
}
.t_detail{
	clear:both;
	overflow:hidden;
}
.t_detail .title {
	float:left;
	clear:left;
	
	width:210px;
	background-color:#FFFFFF;
	padding:4px;
	margin:2px;
	border:1px solid #EEEEEE;
	border-right:1px solid #AAAAAA;
}

.t_detail .info {
	float:left;
	clear:right;
	width:246px;
	
	color: #335EA8;
	padding:4px;
	margin:2px;
	border:1px solid #EEEEEE;
}
.t_detail .temp {
	float:left;
	clear:right;
	width:225px;
	
	color: #335EA8;
	padding:4px;
	margin:2px;
	border:1px solid #EEEEEE;
}
.t_detail .send {
	float:left;
	clear:right;
	width:101px;
	
	color: #335EA8;
	padding:4px;
	margin:2px;
	border:1px solid #EEEEEE;
}
.t_detail .edit {
	float:left;
	clear:right;
	width:41px;
	
	color: #335EA8;
	padding:4px;
	margin:2px;
	border:1px solid #EEEEEE;
}
.t_detail .del {
	float:left;
	clear:right;
	width:41px;
	
	color: #335EA8;
	padding:1px;
	margin:2px;
	border:1px solid #EEEEEE;
}
.t_detail .title_temp {
	float:left;
	clear:left;
	
	width:600px;
	background-color:#FFFFFF;
	padding:4px;
	margin:2px;
	border:1px solid #EEEEEE;
	border-right:1px solid #AAAAAA;
}
.t_detail .del_temp {
	float:left;
	clear:right;
	width:41px;
	
	color: #335EA8;
	padding:4px;
	margin:2px;
	border:1px solid #EEEEEE;
}
-->
</style>

</head>
<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<cfset numrecords = 0 >
	<form action="deleteTransaction.cfm" method="post">
<div id="header">Email System  -- <span class="header_title">Home page, send email from here, add and view templates and create email lists </span></div>
<div id="outer">
        <div id="iner">
	<div style="border:1px solid #666666; background-color:#FFFFFF">	
	
  			<div class="title" style=" width:100%; background-color:#FFFFCC">Incompleted tranactions...<cfoutput>#get_trans.recordcount#</cfoutput></div>

		<div class="t_detail" >	 
			<div>
			  <div class="title" style="background-color:#F4F4F4" >name</div>
              <div class="info" style="background-color:#F4F4F4" >Company</div>
              <div class="info" style="background-color:#F4F4F4" >Position</div> 
              
  			<div class="info" style="background-color:#F4F4F4">email address</div>
            <div class="info" style="background-color:#F4F4F4" >Country</div> 
			<div class="temp" style="background-color:#F4F4F4; width:55px;">events</div>
			<div class="send" style="background-color:#F4F4F4;">date</div>
			<div class="del" style="background-color:#F4F4F4; padding:4px;">view</div>
			<div class="del" style="background-color:#F4F4F4; padding:4px;">send</div>
		    <div class="del" style="background-color:#F4F4F4; padding:4px;">del</div>
		  </div>
		</div>
		<div id="commentForm1">
		<cfloop query="get_trans"><cfoutput><cfset numrecords = numrecords + 1>	 
		<div class="t_detail" >	 
			<div>
  			<div class="title" style="color:##666" >#get_trans.title# #get_trans.name# #get_trans.surname#</div> 
            <div class="info" >#get_trans.company#</div>
            <div class="info" >#get_trans.hposition#</div>
  			<div class="info" ><a href="" title="#get_trans.gemail#">#get_trans.gemail#</a></div>
            <div class="info" >#get_trans.country# </div>
			<div class="temp" style="width:55px;"><a href="" title="#get_trans.event#">#ListLen(get_trans.event, ",")#</a></div>
			<div class="send" ><a href="" title="#get_trans.TransDate#">#get_trans.TransDate#</a></div>
			<div class="del" style="padding:2px;"><a href="registrationDetails.cfm?id=#get_trans.id#"><img src="../img/new_edit.gif" alt="d" border="0"></a></div>
			<div class="del" style="padding:2px;"><a href="email_form.cfm?id=#get_trans.id#"><img src="../img/mail.gif" border="0"></a></div>
			<div class="del" ><input type="checkbox" name="checkbox#numrecords#" value="ok"> <input type="hidden" name="do#numrecords#" value="0"><input type="hidden" name="id<cfoutput>#numrecords#</cfoutput>" value="#get_trans.id#"></div>
			</div>
		</div></cfoutput></cfloop>
		</div>
	</div>
	<br />
	<div style="border:1px solid #666666;width:841px; background-color:#FFFFFF">	
  			<div class="title" style=" width:100%; background-color:#FFFFCC">Dead tranactions...<cfoutput>#get_dead.recordcount#</cfoutput></div>
		<div class="t_detail" >	 
			<div>
  			<div class="title" style="background-color:#F4F4F4; width:70px;">ID</div> 
  			<div class="info" style="background-color:#F4F4F4;width:120px;">transaction date</div>
			<div class="temp" style="background-color:#F4F4F4">event</div>
			<div class="temp" style="background-color:#F4F4F4; width:132px;">name</div>
			<div class="temp" style="background-color:#F4F4F4; width:132px;">name</div>
			<div class="send" style="background-color:#F4F4F4">DEL</div>
			</div>
		</div>
		<cfloop query="get_dead"><cfoutput>
		<cfset numrecords = numrecords + 1>	 
		<div class="t_detail" >	 
			<div>
  			<div class="title" style="width:70px;">#get_dead.id#</div> 
  			<div class="info" style="width:120px;">#get_dead.TransDate#</div>
			<div class="temp" >#Left(get_dead.event,30)#</div>
			<div class="temp" style="width:132px">#get_dead.name# #get_dead.surname#</div>
			<div class="temp" style="width:132px">#email# #cardholder_name#</div>
<div class="del"><input type="checkbox" name="checkbox<cfoutput>#numrecords#</cfoutput>" value="ok"> <input type="hidden" name="do<cfoutput>#numrecords#</cfoutput>" value="0"><input type="hidden" name="id<cfoutput>#numrecords#</cfoutput>" value="<cfoutput>#get_dead.id#</cfoutput>"></div>
			</div>
		</div></cfoutput></cfloop>
		<div class="t_detail">	 
			<div>
  			<div class="title" style="background-color:#F4F4F4; width:70px;"></div> 
  			<div class="info" style="background-color:#F4F4F4;width:120px;"></div>
			<div class="temp" style="background-color:#F4F4F4"></div>
			<div class="send" style="background-color:#F4F4F4"></div>
			<div class="temp" style="background-color:#F4F4F4; padding:0 4px 0 4px"><input type="submit" name="submit" value="delete"><input type=hidden name=numrecords value="<cfoutput>#numrecords#</cfoutput>" /></div>
			</div>
		</div>
	</div>
</div>
</div>
</form>
</body>
</html>