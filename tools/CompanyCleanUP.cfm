<cfparam name="url.s" default="z" type="string">
<cfparam name="url.act" default="1" type="string">

<cfparam name="url.p" default="0" type="string">
<cfparam name="url.c" default="0" type="string"><!--- country option --->
<cfparam name="url.o" default="0" type="string"><!--- other option --->
<cfparam name="url.d1" default="0" type="string"><!--- sort from z to a option --->
<cfparam name="url.d2" default="0" type="string"><!--- sort from z to a option --->

<cfquery name="qryCompanyAZ" datasource="#var.dsn#" cachedwithin="#CreateTimeSpan(0, 6, 0, 0)#">
    select distinct (substring(companyName,1,1)) as alpha
    from companies
    where active = #url.act#
    order by (substring(companyName,1,1))
</cfquery>

<cfquery name="qryCompanyList" datasource="#var.dsn#">
    select companyID, companyName, companyURL
    from companies
    where active = #url.act# 
    and companyName like '#url.s#%'
    order by companyName
</cfquery>

<cfquery name="qryCompanyTotal" datasource="#var.dsn#">
    select count(companyID) as total 
    from companies
    where active = #url.act# 
    and companyName like '#url.s#%'
</cfquery>

<cfquery name="qryCompanyGrandTotal" datasource="#var.dsn#">
    select count(companyID) as total 
    from companies
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery1.4.js" ></script>
<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.min.js"></script>
<title><cfoutput>#qryCompanyGrandTotal.total#</cfoutput></title>
</head>
<style>
body, td, .link {font-family:Verdana, Geneva, sans-serif; font-size:11px; text-decoration:none;}
a {font-size:15px; text-decoration:none;}
a:active {font-size:15px; text-decoration:underline;}
.bb {font-weight:bold}
</style>

<body>

<div id="company" style="width:500px" align="left">

<center>
<cfoutput query="qryCompanyAZ"><a href="?s=#alpha#">#alpha# <cfif url.s EQ alpha><font color="##FF0000">- <b>#qryCompanyTotal.total#</b></font></cfif></a> |
<cfif currentrow mod 17><cfelse><br /></cfif></cfoutput>
</center>
<hr width="500" size="1" />

<table width="500" cellpadding="0" cellspacing="0">
<cfoutput query="qryCompanyList">
<tr<cfif currentrow mod 2> bgcolor="##ddd"</cfif>>
<td>#companyID#&nbsp;</td>
<td class="bb">&nbsp;<a class="link" href="javascript:loadDetails('#companyID#');">#companyName#</a></td>
<td>#companyURL#</td>
</tr></cfoutput>
</table>

</div>

<div id="companyLabels" style="width:500px; position:fixed; left:510px; top:0px;" align="left">
<cfoutput>#qryCompanyGrandTotal.total#</cfoutput>
</div>

<!---<script src="//ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.js"></script>
<script>window.jQuery || document.write("<script src='js/libs/jquery-1.5.1.min.js'>\x3C/script>")</script>--->

<script type="text/javascript">
	function loadDetails(id) {
		$("#companyLabels").load("CompanyCleanUPDetails.cfm?id="+id+"");
	}
	
	function loadContent(id) {
		$("#sectionContent").load("content?c="+id+"");
	}
	
	function deleteCompany(companyID){
		alert(companyID);	
		$.post("qry_deleteCompany.cfm", { "companyID": companyID } );
	} 
	
	function deleteLabel(){
			//var selected = new Array();
		var fetch_lebalID = $(".companyLebel:checked").val();
	<!---	$(".companyLebel:checked").each(function() {  selected.push($(this).val()); });--->
		alert("deleting: " + fetch_lebalID);	
		$.post("qry_deleteLabel.cfm", { "aka_companyID": fetch_lebalID } );
	}
</script>
    
</body>
</html>