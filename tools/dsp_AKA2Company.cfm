<cfparam name="url.s1" default="z" type="string">
<cfparam name="url.s2" default="z" type="string">
<cfparam name="url.p" default="0" type="string">
<cfparam name="url.c" default="0" type="string"><!--- country option --->
<cfparam name="url.o" default="0" type="string"><!--- other option --->
<cfparam name="url.d1" default="0" type="string"><!--- sort from z to a option --->
<cfparam name="url.d2" default="0" type="string"><!--- sort from z to a option --->
<cfset numm = 0>

<cfscript>	
function PadBack(list, char, strLen)
{
  Var PaddedList = "";
  Var PadLen = 0;
  Var Delimiter = ",";
  Var i=0;
  if (ArrayLen(arguments) gt 3){
    Delimiter = arguments[4];
  }
  for (i=1; i LTE ListLen(list, delimiter); i=i+1){
    PadLen = strLen-Len(ListGetAt(list, i, delimiter))-20;
    if (PadLen GTE 0){
          PaddedList = ListAppend(PaddedList, RepeatString(char, PadLen), delimiter);
    }
    else {
      PaddedList = ListAppend(PaddedList, ListGetAt(list, i, delimiter), delimiter);
    }
  }
  Return PaddedList;
}
</cfscript>

<cfquery name="qryCompanyAKA" datasource="#var.dsn#">
select top 150 *
from companyAKA
where (active = 1 or valid =1)
and (companyID is null or companyID = '' or companyID = 0)
and AKA_companyName like '<cfif url.p neq '0'>%</cfif>#url.s1#%'
order by AKA_companyName <cfif url.d1 neq '0'>desc</cfif>
</cfquery>

<cfquery name="qryCompanyAKAcount" datasource="#var.dsn#">
select COUNT(*) as total
from companyAKA
where (active = 1 or valid =1)
and (companyID is null or companyID = '' or companyID = 0)
</cfquery>

<cfquery name="qryCompanyList" datasource="#var.dsn#">
select top 500 *
from companies
where companyName like '<cfif url.p neq '0'>%</cfif>#url.s2#%'
<cfif url.c neq '0'>or companyName like '- %'</cfif>
<cfif url.o neq '0'>or companyName like '+%'</cfif>
or companyName like '#url.s2#%'
order by companyName <cfif url.d2 neq '0'>desc</cfif>
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery1.4.js" ></script>
<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.min.js"></script>
<title>AKA</title>

<script language="Javascript">
<!--
function OnButton1()
{
    document.Form1.action = "act_updateAKA2Company.cfm"
    document.Form1.submit();             // Submit the page
    return true;
}

function OnButton2()
{
    document.Form1.action = "dsp_insertAKA2Company.cfm"
    document.Form1.submit();             // Submit the page
    return true;
}

function OnButton3()
{
    document.Form1.action = "act_deleteAKA2Company.cfm"
    document.Form1.submit();             // Submit the page
    return true;
}

function OnButton5()
{
    document.Form1.action = "act_insertsingleAKA2Company.cfm"
    document.Form1.submit();             // Submit the page
    return true;
}

$(document).ready(function() { 
	$('#companyName').autocomplete({
		source: "../companies/JSON_search.cfm",
		select:function( event, ui ) {
					
						$("#cID").val( ui.item.companyID); 
						
		},
		minLength: 2,
		search: function(event, ui) { 
			$( this ).removeClass( "ui-corner-all" ).addClass("ui-corner-top").addClass( "ui-autocomplete-loading");

		 },
		 focus: function(event, ui) { 
		 	$( this ).removeClass("ui-corner-top").removeClass( "ui-autocomplete-loading").addClass( "ui-corner-all" );

		  }
	});
	
	
	$("#akaID").change(function() {
	var aka = $("#akaID option:selected").attr("title");
	var url = $("#akaID option:selected").attr("id");
	$("#labelURL").html(url);
	$("#label").html(aka);
	});
});

function loadGoogle(){
	parent.googleFrame.location.href = "http://www.google.com";	
}
-->
</script>
<style type="text/css">
 select{font-size:12px}
 option{padding:5px 0 5px 5px }
body {font-family:Verdana, Geneva, sans-serif; font-size:12px}
</style>

<div style="width:550px; float:left">
<form method="post" name="Form1">
<!------><div >
Search in parent companies: <input class="ui-corner-all" type="text" id="companyName" /><!---<input type="hidden" name="cID" id="cID" value="" />---><cfoutput>#qryCompanyAKAcount.total#</cfoutput><br />
url: <span id="labelURL"></span><br />
label: <span id="label"></span><br />
</div>

        <form method="post" name="Form1"><cfoutput>
        <input value="#url.s1#" name="r1" type="hidden" />
        <input value="#url.s2#" name="r2" type="hidden" />
        <input value="#url.c#" name="c" type="hidden" />
		<input value="#url.d2#" name="or2" type="hidden" /></cfoutput>
        
        <select multiple="multiple" style="width:550px;" size="27" name="akaID" id="akaID"><cfoutput query="qryCompanyAKA">
        <option value="#AKA_companyID#" title="#AKA_companyName#" id="#AKA_companyURL#" <cfif currentRow Mod 2>style="background-color:##ccc"</cfif>><cfif numm EQ #AKA_companyID#+1>+</cfif><cfif numm EQ #AKA_companyID#-1>-</cfif>#AKA_companyName#<cfif len(#AKA_companyURL#) GT 0> ~----------~ #AKA_companyURL#</cfif></option><cfset numm =#AKA_companyID#></cfoutput>
        </select>
        
        <hr />

        <input type="submit" name="operation1" onclick="return OnButton1();" value="Link" />
        <input type="submit" name="operation2" onclick="return OnButton2();" value="Create the new Company Name" />
        <input type="submit" name="operation2" onclick="return OnButton5();" value="insert this Company Name" />
        <input type="submit" name="operation3" onclick="return OnButton3();" value="Remove" />
</div>
<div style="width:450px; float:left; height:900px">
        <select style="width:450px;" size="28" name="cID">
        <option value="0" selected="selected">----Create & Link----</option>
        <cfoutput query="qryCompanyList">
        <option value="#companyID#">#companyName# - #companyURL#</option></cfoutput>
        </select>
<!---    --->
   
 </div>
 <div style="width:630px; float:left; height:800px">
 <a href="javascript:loadGoogle();">Load google</a>
 	<iframe   width="100%" height="95%" name="googleFrame" id="googleFrame">
      <p>Your browser does not support iframes.</p>
    </iframe>
 </div>
<!------> 





</form>