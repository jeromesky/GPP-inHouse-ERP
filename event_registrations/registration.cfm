<cfinclude template="../Application.cfm">
<cfquery name="card" datasource="#dsnP21#"  >
select id, title, name, surname, company, gemail, event, TransDate, netbanx_reference, eventid, userid, Pid
from Registrations
where (approved = 0 OR approved IS NULL)  AND Transtype ='card' AND cardpass = 1
ORDER BY id DESC
</cfquery>
<cfquery name="wire" datasource="#dsnP21#"  >
select id, title, name, surname, company, gemail, event, TransDate, netbanx_reference, eventid, userid, Pid
from Registrations 
where (approved = 0 OR approved IS NULL) AND cardpass = 1 AND  (Transtype ='wire' OR  Transtype ='downl'  OR  Transtype ='wt')
ORDER BY id DESC
</cfquery>
<cfquery name="all" datasource="#dsnP21#"  >
select id, title, name, surname, company, gemail, event, TransDate, netbanx_reference, eventid, userid, Pid
from Registrations 
where (approved <> 1) AND  (Transtype ='netbanx' OR Transtype ='WT' OR Transtype ='trans') AND (cardpass <> 1)
ORDER BY id DESC
</cfquery>

<cfset theTrans = "1">
<cfset script = 0>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>P21</title>
<script type="text/javascript" src="../javascript/jquery1.4.js" ></script>
<script type="text/javascript" src="../javascript/jquery.form.js"></script>
<script type="text/javascript" src="../javascript/Jeditable.js"></script>

<style type="text/css">
<!--
#wOCP{display:none;}
#wOWTR{display:none;}
#wMGRT{display:none;}
-->
</style>
<!---<script type="text/javascript" src="../highslide/highslide.js"></script>
<script type="text/javascript" src="../highslide/highslide-html.js"></script>
<script type="text/javascript">    
    hs.graphicsDir = '../highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.outlineWhileAnimating = true;
	 hs.objectLoadTime = 'after';
	 hs.preserveContent = false;
</script>--->
<style type="text/css">
* {
    font-family: Verdana, Helvetica;
    font-size: 10pt;
}
.highslide-html {
    background-color: white;
}
.highslide-html-content {
	position: absolute;
    display: none;
}
.highslide-loading {
    display: block;
	color: black;
	font-size: 8pt;
	font-family: sans-serif;
	font-weight: bold;
    text-decoration: none;
	padding: 2px;
	border: 1px solid black;
    background-color: white;
    
    /*padding-left: 22px;
    background-image: url(highslide/graphics/loader.white.gif);
    background-repeat: no-repeat;
    background-position: 3px 1px;*/   
}

.control {
	float: right;
    display: block;
    /*position: relative;*/
	margin: 0 5px;
	font-size: 9pt;
    font-weight: bold;
	text-decoration: none;
	text-transform: uppercase;
	color: #999;
}
.control:hover {
	color: black !important;
}
.highslide-move {
    cursor: move;
}

.highslide-display-block {
    display: block;
}
.highslide-display-none {
    display: none;
}
</style>
<link href="../styles/styles.css" rel="stylesheet" type="text/css">
<link href="../styles/indexV2.css" rel="stylesheet" type="text/css">

<style type="text/css">
.Accordion, .AquaAccordion {	width: 800px;}
#Acc1.Accordion {	width: 824px; border:0px solid #FFFFFF}
.AccordionPanelTab a {	display: block;	color: black;	text-decoration: none;}

span.AccordionPanelContent {	display: block;}
.AccordionPanel
</style>

</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="header">Transactions from NetBanx:  -- <span class="header_title">Full List</span></div>
<div id="outer">
	<div id="iner">
  <div style="height:33px; background-image:url(img/menu_back.jpg); padding:1px 20px 1px 20px; width:824px;">
   
    <div style="float:left; width:150px; height:23px; padding:8px 0 0 0; text-align:center; border-right:1px dotted #3f63b7;" onMouseOver="this.style.backgroundColor='#cce1fd'; this.style.cursor='hand'" onMouseOut="this.style.backgroundColor=''"><a href="../control_econference/newUser.cfm" id="idnewuser"  onClick="return hs.htmlExpand(this, { contentId: 'newuser', objectType: 'iframe',		objectWidth: 700, objectHeight: 400} )" class="highslide">Add&nbsp;User</a></div>
	<div style="float:left; width:150px; height:23px; padding:8px 0 0 0; text-align:center;" onMouseOver="this.style.backgroundColor='#cce1fd'; this.style.cursor='hand'" onMouseOut="this.style.backgroundColor=''"><a href="creatPack.cfm">Add&nbsp; welcome pack</a></div>
  </div>
  				<div class="row" >
 						<div style="margin:0px;">
						  <div class="trans_I_c1" style="background-color:#F0F0F0; height:25px;"></div>
						  <div class="trans_I_c2" style="background-color:#F0F0F0; height:25px; "></div>
						  <div class="trans_I_c3" style="background-color:#F0F0F0; height:25px; ">view reg</div>
						  <div class="trans_I_c4" style="background-color:#F0F0F0;  height:25px;"></div>
						  <div class="trans_I_c5" style="background-color:#F0F0F0; height:25px;">e-conf</div>
						  <div class="trans_I_c6" style="background-color:#F0F0F0; height:25px; ">remove</div>
						</div>					
					</div> 
<div id="Acc1" class="Accordion">
  <div class="AccordionPanel">
<!---    <div class="AccordionPanelTab"><strong>Online</strong> card payments: <cfoutput>#card.recordcount#</cfoutput></div>
    <div class="AccordionPanelContent">	 
 <cfloop query="card" ><cfoutput> 
 <cfif theTrans NEQ "#Pid#"><cfset theTrans = "#Pid#">
  					<div class="row" >	 
						<div style="margin:0px;">
						<div class="bar_large">#netbanx_reference#: #TransDate#</div>
						</div>
					</div>
  </cfif>
					<div class="row" >	 
						<div style="margin:0px;">
						  <div class="trans_I_c1" ><strong>#card.title# #card.name# #card.surname#</strong><br />#Left(card.company, 25)#<br />#card.gemail#</div>
						  <div class="trans_I_c2" >#card.event#<br></div>
						  <div class="trans_I_c3" ><a href="registrationDetails.cfm?id=#id#"><img src="../img/new_edit.gif" alt="view all details for registration"></a></div>
<div class="trans_I_c4"><a href="saveEdit.cfm?do=0&id=#id#&eventid=#eventid#&userid=#userid#"><img src="../img/mail.gif" alt="send welcome letter for registration"></a></div>
					  <div class="trans_I_c5" ><a href="deleteUser.cfm?id=#id#&action=1&eventid=#eventid#&userid=#userid#"><img src="../img/arrow-forward_16.gif"  alt="Add event to user"></a></div>
						  <div class="trans_I_c6" ><a href="deleteUser.cfm?id=#id#&action=0"><img src="../img/new_delete.gif"  alt="Remove Transaction"></a></div>
						</div>					
					</div>
</cfoutput>  <cfset script = script + 1 >
  </cfloop>
    </div>--->
  </div>
  <div class="AccordionPanel">
<!---    <div class="AccordionPanelTab"><strong>Online</strong> wire Tranfers requests: <cfoutput>#wire.recordcount#</cfoutput></div>
    <div class="AccordionPanelContent">

 <cfloop query="wire" ><cfoutput>
 <cfset script = script + 1 > 
 <cfif theTrans NEQ "#Pid#"><cfset theTrans = "#Pid#">
  					<div class="row" >	 
						<div style="margin:0px;">
						<div class="bar_large" >#netbanx_reference#: #TransDate#</div>
						</div>
					</div>
 </cfif>
					<div class="row" >	 
						<div style="margin:0px;">
						  <div class="trans_I_c1"><strong>#title# #name# #surname#</strong><br />#Left(company, 25)#<br />#gemail#</div>
						  <div class="trans_I_c2">#event#</div>
						  <div class="trans_I_c3"><a href="registrationDetails.cfm?id=#id#"><img src="../img/new_edit.gif" alt="view all details for registration"></a></div>
<div class="trans_I_c4"><a href="saveEdit.cfm?do=0&id=#id#&eventid=#eventid#&userid=#userid#"><img src="../img/mail.gif" alt="send welcome letter for registration"></a></div>
<div class="trans_I_c5" ><a href="deleteUser.cfm?id=#id#&action=1&eventid=#eventid#&userid=#userid#"><img src="../img/arrow-forward_16.gif"  alt="Add event to user"></a></div>
						  <div class="trans_I_c6" ><a href="deleteUser.cfm?id=#id#&action=0"><img src="../img/new_delete.gif"  alt="Remove Transaction"></a></div>
						</div>					
					</div>
</cfoutput>  <cfset script = script + 1 >
  </cfloop>    
    </div>--->
  </div>
  <div class="AccordionPanel">
<!---    <div class="AccordionPanelTab"><strong>Manual GPP</strong> registrations / transactions: <cfoutput>#all.recordcount#</cfoutput></div>
    <div class="AccordionPanelContent"> 
 <cfloop query="all" ><cfoutput>
 <cfset script = script + 1 > 
 <cfif theTrans NEQ "#Pid#"><cfset theTrans = "#Pid#">
 					<div class="row" >	 
						<div style="margin:0px;">
						<div class="bar_large" >#netbanx_reference#: #TransDate#</div>
						</div>
					</div>
 </cfif>
					<div class="row" >	 
						<div style="margin:0px;">
						  <div class="trans_I_c1"><strong>#title# #name# #surname#</strong><br />#Left(company, 25)#<br />#gemail#</div>
						  <div class="trans_I_c2">#event#</div>
						  <div class="trans_I_c3" ><a href="registrationDetails.cfm?id=#id#"><img src="../img/new_edit.gif" alt="view all details for registration"></a></div>
						  <div class="trans_I_c4" ><a href="email_registration.cfm?id=#id#"><img src="../img/mail.gif" alt="send email for for transaction"></a></div>
						  <div class="trans_I_c5" ><a href="deleteUser.cfm?id=#id#&action=1&eventid=#eventid#&userid=#userid#"><img src="../img/arrow-forward_16.gif"  alt="Add event to user"></a></div>
						  <div class="trans_I_c6" ><a href="deleteUser.cfm?id=#id#&action=0"><img src="../img/new_delete.gif"  alt="Remove Transaction"></a></div>
						</div>					
					</div>
</cfoutput>  <cfset script = script + 1 >
  </cfloop>    
  </div>
</div>--->
</div>
</div> 
  
     <div class="AccordionPanelTab"><strong>Online</strong> card payments: <cfoutput>#card.recordcount#</cfoutput></div>

 <cfloop query="card" ><cfoutput> 
 <cfif theTrans NEQ "#Pid#"><cfset theTrans = "#Pid#">
  					<div class="row" >	 
						<div style="margin:0px;">
						<div class="bar_large">#netbanx_reference#: #TransDate#</div>
						</div>
					</div>
  </cfif>
					<div class="row" >	 
						<div style="margin:0px;">
						  <div class="trans_I_c1" ><strong>#card.title# #card.name# #card.surname#</strong><br />#Left(card.company, 25)#<br />#card.gemail#</div>
						  <div class="trans_I_c2">#card.event#<br></div>
						  <div class="trans_I_c3" ><a href="registrationDetails.cfm?id=#id#"><img src="../img/new_edit.gif" alt="view all details for registration"></a></div>
 <div class="trans_I_c4"><!---<a href="saveEdit.cfm?do=0&id=#id#&eventid=#eventid#&userid=#userid#"><img src="../img/mail.gif" alt="send welcome letter for registration"></a>---></div
						  ><div class="trans_I_c5" ><a href="deleteUser.cfm?id=#id#&action=1&eventid=#eventid#&userid=#userid#"><img src="../img/arrow-forward_16.gif" alt="Add event to user"></a></div>
						  <div class="trans_I_c6" ><a href="deleteUser.cfm?id=#id#&action=0"><img src="../img/new_delete.gif" alt="Remove Transaction"></a></div>
						</div>					
					</div>
</cfoutput>  <cfset script = script + 1 >
  </cfloop>
  				<div class="row" >
 						<div style="margin:0px;">
						  <div class="trans_I_c1" style="background-color:#F0F0F0; height:25px;"></div>
						  <div class="trans_I_c2" style="background-color:#F0F0F0; height:25px;"></div>
						  <div class="trans_I_c3" style="background-color:#F0F0F0; height:25px;">view reg</div>
						  <div class="trans_I_c4" style="background-color:#F0F0F0; height:25px;">send email form</div>
						  <div class="trans_I_c5" style="background-color:#F0F0F0; height:25px;">e-conf</div>
						  <div class="trans_I_c6" style="background-color:#F0F0F0; height:25px;">remove</div>
						</div>					
					</div> 
   <div class="AccordionPanelTab"><strong>Online</strong> wire Tranfers requests: <cfoutput>#wire.recordcount#</cfoutput></div>

 <cfloop query="wire"><cfoutput>
 <cfset script = script + 1 > 
 <cfif theTrans NEQ "#Pid#"><cfset theTrans = "#Pid#">
  					<div class="row" >	 
						<div style="margin:0px;">
						<div class="bar_large" >#netbanx_reference#: #TransDate#</div>
						</div>
					</div>
 </cfif>
					<div class="row" >	 
						<div style="margin:0px;">
						  <div class="trans_I_c1" ><strong>#title# #name# #surname#</strong><br />#Left(company, 25)#<br />#gemail#</div>
						  <div class="trans_I_c2" >#event#</div>
						  <div class="trans_I_c3" ><a href="registrationDetails.cfm?id=#id#"><img src="../img/new_edit.gif" alt="view all details for registration"></a></div>
<div class="trans_I_c4"><a href="email_registration.cfm?id=#id#"><img src="../img/mail.gif" alt="send email for for transaction"></a><!---<a href="saveEdit.cfm?do=0&id=#id#&eventid=#eventid#&userid=#userid#"><img src="../img/mail.gif" alt="send welcome letter for registration"></a>---></div>
<div class="trans_I_c5" ><a href="deleteUser.cfm?id=#id#&action=1&eventid=#eventid#&userid=#userid#"><img src="../img/arrow-forward_16.gif"  alt="Add event to user"></a></div>
						  <div class="trans_I_c6" ><a href="deleteUser.cfm?id=#id#&action=0"><img src="../img/new_delete.gif"  alt="Remove Transaction"></a></div>
						</div>					
					</div>
</cfoutput><cfset script = script + 1 >
  </cfloop>    

     <div class="AccordionPanelTab"><strong>Manual GPP</strong> registrations / transactions: <cfoutput>#all.recordcount#</cfoutput></div>
  				<div class="row" >
 						<div style="margin:0px;">
						  <div class="trans_I_c1" style="background-color:#F0F0F0; height:25px;"></div>
						  <div class="trans_I_c2" style="background-color:#F0F0F0; height:25px; "></div>
						  <div class="trans_I_c3" style="background-color:#F0F0F0; height:25px; ">view reg</div>
						  <div class="trans_I_c4" style="background-color:#F0F0F0;  height:25px;">send email form</div>
						  <div class="trans_I_c5" style="background-color:#F0F0F0; height:25px;">e-conf</div>
						  <div class="trans_I_c6" style="background-color:#F0F0F0; height:25px; ">remove</div>
						</div>					
					</div> 
 <cfloop query="all" ><cfoutput>
 <cfset script = script + 1 > 
 <cfif theTrans NEQ "#Pid#"><cfset theTrans = "#Pid#">
 					<div class="row" >	 
						<div style="margin:0px;">
						<div class="bar_large" >#netbanx_reference#: #TransDate#</div>
						</div>
					</div>
 </cfif>
					<div class="row" >	 
						<div style="margin:0px;">
						  <div class="trans_I_c1" ><strong>#title# #name# #surname#</strong><br />#Left(company, 25)#<br />#gemail#</div>
						  <div class="trans_I_c2" >#event#</div>
						  <div class="trans_I_c3" ><a href="registrationDetails.cfm?id=#id#"><img src="../img/new_edit.gif" alt="view all details for registration"></a></div>
						  <div class="trans_I_c4" ><a href="email_registration.cfm?id=#id#"><img src="../img/mail.gif" alt="send email for for transaction"></a></div>
						  <div class="trans_I_c5" ><a href="deleteUser.cfm?id=#id#&action=1&eventid=#eventid#&userid=#userid#"><img src="../img/arrow-forward_16.gif"  alt="Add event to user"></a></div>
						  <div class="trans_I_c6" ><a href="deleteUser.cfm?id=#id#&action=0"><img src="../img/new_delete.gif"  alt="Remove Transaction"></a></div>
						</div>					
					</div>
</cfoutput><cfset script = script + 1 >
  </cfloop> 
  <!---
 				<div class="wbbg_large">
					<div class="tb" onClick="switchMenu('wOCP');" onMouseOver="swap(this);" onMouseOut="swapOut(this);" >
					  <div id="_wOCP" class="arrow"></div>
					  <div class="title"></div>
				  </div>
				</div> 
				<div id="wOCP">
					 
 				<div class="wbbg_large">
					<div class="tb" onClick="switchMenu('wOWTR');" onMouseOver="swap(this);" onMouseOut="swapOut(this);" >
					  <div id="_wOWTR" class="arrow"></div>
					  <div class="title"></div>
				  </div>
				</div>   
				<div id="wOWTR">
					<div class="row" >	 
						<div style="margin:0px;">
						  <div class="trans_I_c1" style="background-color:#F0F0F0; height:39px;"></div>
						  <div class="trans_I_c2" style="background-color:#F0F0F0; height:39px;"></div>
						  <div class="trans_I_c3" style="background-color:#F0F0F0; height:39px;">view reg</div>
						  <div class="trans_I_c4" style="background-color:#F0F0F0; height:39px;">send welcome letter </div>
						  <div class="trans_I_c5" style="background-color:#F0F0F0; height:39px;">add to e-conference </div>
						  <div class="trans_I_c6" style="background-color:#F0F0F0; height:39px;">remove from here </div>
						</div>					
					</div>
				</div>

   				<div class="wbbg_large">
					<div class="tb" onClick="switchMenu('wMGRT');" onMouseOver="swap(this);" onMouseOut="swapOut(this);" >
					  <div id="_wMGRT" class="arrow"></div>
					  <div class="title"></div>
				  	</div>
				</div>
				<div id="wMGRT">
					<div class="row" >	 
						<div style="margin:0px;">
						  <div class="trans_I_c1" style="background-color:#F0F0F0; height:39px;"></div>
						  <div class="trans_I_c2" style="background-color:#F0F0F0; height:39px;"></div>
						  <div class="trans_I_c3" style="background-color:#F0F0F0; height:39px;">view registration </div>
						  <div class="trans_I_c4" style="background-color:#F0F0F0; height:39px;">send email to client </div>
						  <div class="trans_I_c5" style="background-color:#F0F0F0; height:39px;">add to e-conference </div>
						  <div class="trans_I_c6" style="background-color:#F0F0F0; height:39px;">remove from here </div>
						</div>					
					</div>

				</div>--->

</div>
</div>
 				<div class="highslide-html-content" id="newuser" style="width: 700px; height:400px;">
                	<div class="highslide-move" style="border: 0; height: 18px; padding: 2px; cursor: default"><a href="#" onClick="return hs.close(this)" class="control">Close</a></div>
					<div class="highslide-body"></div>
				</div>
<cfinclude template="../_display/dsp_footer.cfm">