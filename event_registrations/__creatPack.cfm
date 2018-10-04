<cfinclude template="../application.cfm">
<cfset theevent = "1">

<cfquery name=event datasource="#dsnP21#"   >
   	SELECT id, event_name, event_year, event_month, event_abbr
   	FROM events
	 WHERE (event_expire > #datenow#) AND (event_type = 'Event') OR (event_type = 'EB') OR (event_type = 'DIN')
   	ORDER BY event_expire asc
</cfquery>

<html>
<head>
<style type="text/css">
<!--
.wbbg{
	background-image: url(../img/mn_tb.gif);
	background-repeat: no-repeat;
	margin: 0;
	padding: 0;
	height: 26px;
	clear: both;
	width:626px;
	text-decoration: none;
}
.tb{
	text-decoration: none; 
}
.arrow{
	background-image: url(../img/tb_arrow_on.gif);
	background-repeat: no-repeat;
	float: right;
	width: 10px;
	height: 10px;
	font-size: 1px;
	line-height: 1px;
	margin-right: 20px;
	_margin-right: 20px;
	margin-top: 9px;
}
.title{text-decoration: none; font-family:Georgia, "Times New Roman", Times, serif; font-size:13px; color:#FFFFFF; margin:7px 0 0 12px; }
.titlebottom{background-image:url(../img/mn_tb_bottom.gif); background-repeat:no-repeat; background-position:0px 0px; width:626px; height:20px;}
.row{
	clear:both;
	overflow:hidden;
	margin:0px;
}
.row .ex {
	float:left;
	clear:left;
	width:332px;
	height:24px;
	padding:4px;
	margin:0px;	
	border-bottom:solid 1px #acd7f3;
	border-left:solid 1px #4494ca;
	background-color:#ecf5fb;
}

.row .de {
	float:left;
	clear:right;
	width:275px;
	height:24px;
	padding:4px;
	margin:0px;
	border-bottom:solid 1px #acd7f3;
	border-right:solid 1px #4494ca;
}
.row .exs {
	float:left;
	clear:left;
	width:525px;
	height:24px;
	padding:4px;
	margin:0px;	
	border-bottom:solid 1px #acd7f3;
	border-left:solid 1px #4494ca;
	background-color:#ecf5fb;
}

.row .des {
	float:left;
	clear:right;
	width:128px;
	height:24px;
	padding:4px;
	margin:0px;
	border-bottom:solid 1px #acd7f3;
	border-right:solid 1px #4494ca;
}
.row .acs {
	float:left;
	clear:right;
	width:47px;
	height:24px;
	padding:4px;
	margin:0px;
	border-bottom:solid 1px #acd7f3;
	border-right:solid 1px #4494ca;
}
.missing{ height:25px; padding:0 10px 0 80px; width:380px;  background-image:url(../img/tree.gif); background-repeat:no-repeat; background-position:15px 0px;float:left;clear:left; }
.missing1{height:25px; padding:0 10px 0 80px; width:47px;float:left; clear:right;}
.missing2{height:25px; padding:0 10px 0 80px; width:128px;float:left; clear:right; }
#commentForm

{
	float:left;
	clear:left;
	width:623px;
background-color:#FFFFFF;
padding:0px 0 0 0px;
	border-bottom:solid 1px #4494ca;
	border-right:solid 1px #4494ca;
	border-left:solid 1px #4494ca;
}
-->
</style>
<style type="text/css">
<!-- 

-->
</style>
<link rel="stylesheet" href="../img/p21-gry.css" type="text/css" mcedia="screen" title="grey" />
<title>P21</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<div id="header">Add a welcome pack for Events :  -- <span class="header_title">and  List</span></div>
<div style="margin:10px 20px 0 20px; background-color:#EFEFEF; padding:10px 20px 10px 20px;">
<div style="background-color:#fff; padding:25px 15px 15px 15px; font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#76787a;">

<form action="filesave.cfm"  enctype="multipart/form-data" method="post">  
  
				<div class="wbbg">
					<div class="tb" onClick="switchMenu('w4');" onMouseOver="swap(this);" onMouseOut="swapOut(this);" >
					  <div class="title"><strong>Select</strong> event and load PDF template</div>
					</div>
				</div>
				<!-- START: COLLAPSING CONTENT -->
				<div id="w4">
					<div class="row" >	 
						<div style="margin:0px;">
							<div class="exs">Event 
							  <select name="Event">
                                <cfloop query=event>
                                  <cfoutput>
                                    <option value="<cfoutput>#id#,#event_name#</cfoutput>" ><cfoutput><b>#event_name#, #event_month#/#event_year#</b></cfoutput></option>
                                  </cfoutput>
                                </cfloop>
                              </select>
							</div>
							<div class="des"></div>
						</div>					
					</div>
					<div class="row" >	 
						<div style="margin:0px;">
						  <div class="exs">File Type
							  <select name="type">
							    <option value="Con" selected>Confirmation Letter</option>
							    <option value="Acc">Accomodation Letter</option>
						      </select>
						  </div>
							<div class="des"></div>
						</div>					
					</div>
					<div class="row" >	 
						<div style="margin:0px;">
							<div class="exs">File Upload
							     <input type=file name="filepath">
						  </div>
							<div class="des" style="padding:2px;">
							  <input type="submit" name="Submit32" value="Submit">
							</div>
						</div>					
					</div>
				</div>
			<div class="titlebottom"></div>
</form>

<cfquery datasource="#dsnP21#" name="getpack">
SELECT * FROM welcomepack
order by filename
</cfquery>
				<div class="wbbg">
					<div class="tb" onClick="switchMenu('w4');" onMouseOver="swap(this);" onMouseOut="swapOut(this);" >
					  <div class="title"><strong>WelcomePack</strong> > templates Uploaded and Available</div>
					</div>
				</div>
				<div id="w4">
	<cfloop query="getpack"><cfoutput>
	<cfif theevent NEQ "#filename#"><cfset theevent = "#filename#">
					<div class="row" >	 
						<div style="margin:0px;">
							<div class="exs">Files for <b>#filename#</b></div>
							<div class="acs">action</div>
							<div class="des">date loaded</div>
						</div>					
					</div>
	</cfif>
					<div id="commentForm">
  						<div class="missing">#filepath#</div>
						<div class="missing2"><a href="filesave.cfm?id=#id#&action=del"><img src="../img/new_delete.gif" border="0"></a></div>
						<div class="missing1">#dateloladed#</div>
  					</div>
		</cfoutput></cfloop>
				</div>
			<div class="titlebottom"></div>
</div>
</div>
</body>
</html>