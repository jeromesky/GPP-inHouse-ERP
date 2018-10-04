<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<cfif parameterexists(url.id)>
	<cfquery datasource="#dsnP21#" name="del"  >
		Delete from hotels
		WHERE id = #url.id#
	</cfquery>
</cfif>
<cfif parameterexists(form.Submit)>
<cfif form.hotellogo NEQ "" >
<cffile action="upload" 
        filefield="Form.hotellogo" 
		destination= "G:\websites\petro21\htdocs\docs\" 
		nameconflict="makeunique">
</cfif>

      <cfquery datasource="#dsnP21#" name="addhotel"  >
	  SET ANSI_WARNINGS OFF
        Insert hotels( groupid, hotelname, hotellink, hotellogo, address, map1, map2 )
        Values('#form.groupid#', '#form.hotelname#', '#form.hotellink#', <cfif form.hotellogo NEQ "" >'#File.ServerFile#'<cfelse>'defaulthotelimage.jpg'</cfif>, '#left(form.address, 150)#', '#left(form.map1, 9)#', '#left(form.map2, 9)#' )
	   SET ANSI_WARNINGS On
     </cfquery>
</cfif>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Petro21.com</title>
<link rel="stylesheet" href="./img/p21-gry.css" type="text/css" mcedia="screen" title="grey" />
<script type="text/javascript">
<!--
function toggleLayer(whichLayer)
{
if (document.getElementById)
{
// this is the way the standards work
var style2 = document.getElementById(whichLayer).style;
style2.display = style2.display? "":"block";
}
else if (document.all)
{
// this is the way old msie versions work
var style2 = document.all[whichLayer].style;
style2.display = style2.display? "":"block";
}
else if (document.layers)
{
// this is the way nn4 works
var style2 = document.layers[whichLayer].style;
style2.display = style2.display? "":"block";
}
}
// -->
</script>
<style type="text/css">
<!-- 
#commentForm1
{
background-color:#FFFFFF;
padding:0px 0 0 0px;
width:740px;
display:none;

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
	width:41px;
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
	width:21px;
	color: #335EA8;
	padding:3px;
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
<script type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}
//-->
</script>
</head>

<body>
<form action="hotels.cfm" method="post" enctype="multipart/form-data">
<div id="header">Hotels for events -- </div>
<div style="margin:10px 20px 0 20px; background-color:#EFEFEF; padding:10px 20px 10px 20px;">
<!--- start --->
	<div style="border:1px solid #666666;width:741px; background-color:#FFFFFF">	
		<div class="t_detail" >	 
			<div>
  			<div class="title" style=" width:100%; background-color:#E0E7FE">Add a hotel for an event</div>
  			</div>
		</div>
		<div class="t_detail" >	 
			<div>
  			<div class="title" style=" width:120px;">Hotel Name</div> 
			<div class="temp"  style="background-color:#F4F4F4; padding:0 4px 0 4px;"><input type="text" name="hotelname" /></div>
			<div class="info" style="width:120px;"><span style="width:150px">Hotel Link</span></div>
			<div class="temp"  style="background-color:#F4F4F4; padding:0 4px 0 4px;"><input type="text" name="hotellink" /></div>
			</div>
		</div>
		<div class="t_detail" >	 
			<div>
  			<div class="title" style=" width:120px;">Hotel Logo</div> 
			<div class="temp"  style="background-color:#F4F4F4; padding:1px 4px 1px 4px;"><input type="file" name="hotellogo" /></div>
			<div class="info"  style="width:120px;"><span style="width:150px"> for the following</span></div>
			<div class="temp"  style="background-color:#F4F4F4; padding:1px 4px 1px 4px;">
			<CFQUERY datasource="#dsnP21#" name="getgroup">SELECT 	* FROM groupby</CFQUERY> 
			<select name="groupid" style="width:220px;"><cfloop query="getgroup"><cfoutput>
  				<option value="#id#">#trim(groupby)#</option>
			</cfoutput></cfloop></select></div>
			</div>
		</div>
		<div class="t_detail" >	 
			<div>
  			<div class="title" style=" width:120px;" >map cord 1 </div> 
			<div class="temp"  style="background-color:#F4F4F4;padding:0 4px 0 4px; "><input type="text" name="map1" /></div>
			<div class="info"  style="width:120px;">map cord 2 </div>
			<div class="temp"  style="background-color:#F4F4F4; padding:1px 4px 1px 4px;"><input type="text" name="map2" /></div>
			</div>
		</div>
		<div class="t_detail" >	 
			<div>
  			<div class="title" style=" width:120px;" >hotel address </div> 
			<div class="temp"  style="background-color:#F4F4F4;padding:0 4px 0 4px; ">
			  <textarea name="address"></textarea>
			</div>
			</div>
		</div>
		<div class="t_detail" >	 
			<div>
  			<div class="title" style=" width:120px;" ></div> 
			<div class="temp"  style="background-color:#F4F4F4; "></div>
			<div class="info"  style="width:120px;"></div>
			<div class="temp" style="background-color:#F4F4F4; padding:1px 4px 1px 4px;"><input type="submit" name="Submit" value="Submit" /></div>
			</div>
		</div>
		<div style="clear:both; height:6px;"></div>
	</div>
	<div style="height:10px"></div>
	<div style="border:1px solid #666666;width:741px; background-color:#FFFFFF">
		<CFQUERY datasource="#dsnP21#" name="gethotels">
		SELECT hotels.id, hotels.hotelname, hotels.hotellink, hotels.hotellogo,hotels.hotellogo,
		groupby.groupby
		FROM hotels INNER JOIN
		groupby ON hotels.groupid = groupby.id
		</CFQUERY> 
		<div class="t_detail">	 
			<div>
  			<div class="title" style=" width:100%; background-color:#E0E7FE">Hotel list</div>
  			</div>
		</div>
<cfloop query="gethotels"><cfoutput>
		<div class="t_detail" >	 
			<div>
  			<div class="title" style=" width:120px;" >#gethotels.hotelname#</div>
			<div class="temp" style="">#gethotels.groupby#</div> 
			<div class="del" style=" padding:0px"><img src="../docs/#gethotels.hotellogo#" border="0" /></div>
			<div class="temp" style=" ">#left(gethotels.hotellink, 31)#</div>
			<div class="del" style=""><a href="edit_user_news.cfm?id=#gethotels.id#"><img src="control_enews/file-edit.gif" border="0" /></a></div>
			<div class="del" style=""><a href="hotels.cfm?id=#gethotels.id#"><img src="control_enews/delete.gif" border="0" alt="delete email"></a></div>
			</div>
		</div>
</cfoutput></cfloop>
<div style="clear:both; height:6px;"></div>
	</div>
</div>
</form>
</body>
</html>