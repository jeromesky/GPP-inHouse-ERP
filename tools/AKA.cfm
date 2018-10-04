<cfparam name="url.s1" default="z" type="string">
<cfparam name="url.s2" default="z" type="string">
<cfparam name="url.p" default="1" type="string">
<cfparam name="url.c" default="1" type="string"><!--- country option --->
<cfparam name="url.o" default="1" type="string"><!--- other option --->
<cfparam name="url.d1" default="0" type="string"><!--- sort from z to a option --->
<cfparam name="url.d2" default="0" type="string"><!--- sort from z to a option --->

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
<!---SELECT DISTINCT    dbo.tblIndividual.strEmail, dbo.Countries.countryNameEN, dbo.companyAKA.AKA_companyID, dbo.companyAKA.companyID, 
                      dbo.companyAKA.AKA_companyURL, dbo.companyAKA.AKA_companyName
FROM         dbo.companyAKA INNER JOIN
                      dbo.tblIndividual ON dbo.companyAKA.AKA_companyID = dbo.tblIndividual.AKA_companyID LEFT OUTER JOIN
                      dbo.Countries ON dbo.tblIndividual.countryID = dbo.Countries.countryID
where companyAKA.companyID = 0
and companyAKA.active = 1
<!---and AKA_companyName like '<cfif url.p neq '0'>%</cfif>#url.s1#%'
and dbo.Countries.countryNameEN IN ('egypt', 'tunisia', 'lybia', 'kanya', 'gabon', 'ivory coast')--->

and companyAKA.AKA_companyID in (
   select AKA_companyID
   from dbo.tblIndividual
   where status ='C'
   group by AKA_companyID
   having count(AKA_companyID) >= 2
)

order by AKA_companyName <cfif url.d1 neq '0'>desc</cfif>--->
select top 150 *
from companyAKA
where active = 1
and (companyID is null
or
	companyID = ''
or 
	companyID = 0)
and AKA_companyName like '<cfif url.p neq '0'>%</cfif>#url.s1#%'
order by AKA_companyURL <cfif url.d1 neq '0'>desc</cfif>

</cfquery>

<cfquery name="qryCompanyAKAcount" datasource="#var.dsn#">
<!---select count(*) as total
from companyAKA
where companyID = 0
and active = 1
and AKA_companyID in (
   select AKA_companyID
   from dbo.tblIndividual
   where status ='C'
   group by AKA_companyID
   having count(AKA_companyID) >= 2
)--->
select COUNT(*) as total
from companyAKA
where active = 1
and (companyID is null
or
	companyID = ''
or 
	companyID = 0)
</cfquery>

<!---<cfquery name="qryCompanyList" datasource="#var.dsn#">
select * 
from companies
where companyName like '<cfif url.p neq '0'>%</cfif>#url.s2#%'
<cfif url.c neq '0'>or companyName like '- %'</cfif>
<cfif url.o neq '0'>or companyName like '+%'</cfif>
or companyName like '+#url.s2#%'
order by companyName <cfif url.d2 neq '0'>desc</cfif>
</cfquery>--->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>p21</title>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery1.4.js" ></script>
<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.min.js"></script>
<script language="Javascript">
<!--
function OnButton1()
{
    document.Form1.action = "act_updateAKA.cfm"
    document.Form1.submit();             // Submit the page
    return true;
}

function OnButton2()
{
    document.Form1.action = "dsp_insertAKA.cfm"
    document.Form1.submit();             // Submit the page
    return true;
}

function OnButton3()
{
    document.Form1.action = "act_deleteAKA.cfm"
    document.Form1.submit();             // Submit the page
    return true;
}

$(document).ready(function() { 
	$('#companyName').autocomplete({
		source: "../companies/JSON_search.cfm?nocache=090909",
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
});
-->
</script>

<noscript>You need Javascript enabled for this to work</noscript>
<style type="text/css">
 select{font-size:14px}
 option{padding:2px 0 2px 5px }

</style>
</head>
<body>
<div style="width:800px; float:left">
<form method="post" name="Form1">
<div >
Search in parent companies: <input class="ui-corner-all" type="text" id="companyName" />

<input type="hidden" name="cID" id="cID" value="" />
</div>
<cfoutput>
<input value="#url.s1#" name="r1" type="hidden" />
<input value="#url.s2#" name="r2" type="hidden" />
<input value="#url.c#" name="c" type="hidden" /></cfoutput>

<select multiple="multiple" style="width:800px;" size="35" name="akaID"><cfoutput query="qryCompanyAKA">
<option value="#AKA_companyID#" <cfif currentRow Mod 2>style="background-color:##ccc"</cfif>>#AKA_companyName#<!---#strEmail# --- #countryNameEN#---><cfif len(#AKA_companyURL#) GT 0>#padBack(AKA_companyName, '_', 80)#<b>#AKA_companyURL#</b></cfif></option></cfoutput>
</select>

<!---<select style="width:800px;" size="40" name="cID">
<option value="0">----Create & Link----</option>
<cfoutput query="qryCompanyList">
<option value="#companyID#">#companyName# - #companyURL# </option></cfoutput>
</select>--->

<hr />

<input type="submit" name="operation1" onclick="return OnButton1();" value="Link" />
<input type="submit" name="operation2" onclick="return OnButton2();" value="Lets Add the Parent Company" />
<input type="submit" name="operation3" onclick="return OnButton3();" value="Remove" />

<cfoutput>#qryCompanyAKAcount.total#</cfoutput>

</form>
</div>
<div style="width:700px; float:left; height:900px">

    <iframe src="http://www.google.com" width="100%" height="95%" >
      <p>Your browser does not support iframes.</p>
    </iframe>
   
 </div>
</body>
</html>