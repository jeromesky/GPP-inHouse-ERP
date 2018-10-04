<cfsetting showdebugoutput="yes">
<cfparam name="url.o" default="0">

<cfinclude template="qry_exludeDomains.cfm">

<cfquery name="qryCompanyAKA" datasource="gpp">
select top 10 *
from companyAKA
where 
	active = 1 
and 
	(companyID is null or companyID = '' or companyID = 0)
and
	(AKA_companyURL = ' ' or AKA_companyURL IS NULL )
<!---and 
	AKA_companyName like '#url.s#%'--->
and 
	valid <> -1
and <!---( select cityID  from dbo.tblIndividual where AKA_companyID = companyAKA.AKA_companyID ) AS ss and (stremail <>'' or  stremail IS not NULL )--->
	1 <= (
  select COUNT(*) from dbo.tblIndividual where AKA_companyID = companyAKA.AKA_companyID  and status = 'c' 
 )
 ORDER BY AKA_companyName  <cfif url.o EQ 1>DESC</cfif>
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/jquery1.4.js" ></script>
<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.min.js"></script>
<style type="text/css">
.row {clear:both; border-bottom:2px solid #999; padding:5px 0px}
.colName{ width:200px; float:left; vertical-aling:top;}
.colResult{width:300px; float:left}
.loadPage {cursor:pointer}
.clear{clear:both}
body{ font-family:Arial, Helvetica, sans-serif; font-size:12px}
.more{padding:10px}
</style>
<script type="text/javascript">

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

$('.loadPage').live('click', function() {
  //alert('Handler for .click() called.');
  var fetch_link = $(this).attr("alt");
  var newURL = 'http://' + fetch_link
  console.log(newURL);
  parent.googleFrame.location.href = newURL;

});

$(".deleteUser").live('change', function(){
		var getUserID = $(this).val();
	$.post("../User_Edit/deleteRegisteredUser.cfm", {"DeleteID": getUserID }, function(){  alert("user dleeted"); } );	
});

$("input[name='addURL']").live('change', function(){
	var fetch_row = $(this).attr("id");
	var fetch_url = $(this).val();
		if (fetch_url == 'typed') {
			var fetch_url = $("#typed"+ fetch_row).val();
		}
	$.post("qry_updateCompanyURL.cfm", { "AKA_companyID": fetch_row, "aka_companyURL": fetch_url }, function(){  
			$("#row_"+fetch_row).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "fast");
	});
	
});

function addToCompany(aka_companyID){
		var companyID = $("#cID").val();
		
		if ( companyID != 0 ){
		$.post("act_updateAKA.cfm", {"cid": companyID, "akaID": aka_companyID, "c": "s", "r1": "s", "r2": "s"}, function(){ alert("Label added to company");  } );
		} else{
			alert("u need to select a parent  company first");	
		}
}

function loadGoogle(){
	parent.googleFrame.location.href = "http://www.google.com";	
}

function moreDetails(id){
	
	var rowid = id;
	$.post('dsp_domainsMoreDetails.cfm', {"aka_companyID": id }, function(data){  $('#more' + rowid).html(data).addClass("more") ; }  )
}

function deleteAKA(id){
		var aka = id;
				$.post('../companyLabels/qry_deleteLabel.cfm', {"aka_companyID": id }, function(){  
				alert("AKA deleted");
				$("#row_"+aka).animate( { backgroundColor: "#fbc7c7" }, "fast").animate({ opacity: "hide" }, "fast");
				 }  )
}
</script>
</head>

<body>

<cfset start  = 0> 
<!---<cfdump var="#qryCompanyAKA#">--->
<div style="width:550px; float:left" >
<form method="post" name="Form1">
<div >
Search in parent companies: <input class="ui-corner-all" type="text" id="companyName" />

<input type="hidden" name="cID" id="cID" value="0" />
</div>

<cfloop query="qryCompanyAKA">
<div id="row_<cfoutput>#qryCompanyAKA.aka_companyID#</cfoutput>" class="row" <cfif qryCompanyAKA.currentrow mod 2>style="background-color:#CCC"</cfif>>
        <cfhttp 
            url = "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&q=#qryCompanyAKA.AKA_companyName#&start=#start#&rsz=large&hl?=en"
            userAgent = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; InfoPath.2; .NET CLR 3.5.3072">
            <cfhttpparam encoded="no" type="CGI" name="referer" value="http://cflove.org/examples/other/google.cfm" />
        </cfhttp> 
        
        <cfset out  = DeserializeJSON(CFHTTP.FileContent)>
	<div class="colName">
        <cfoutput>#qryCompanyAKA.AKA_companyName# <br />
		<ul>
        <li><a href="javascript:moreDetails(#qryCompanyAKA.aka_companyID#);">more details</a></li>
		<li><a href="javascript:addToCompany(#qryCompanyAKA.aka_companyID#)">link to Parent Company</a></li>
		<li></li>
		<li><a href="javascript:deleteAKA(#qryCompanyAKA.aka_companyID#)">delete this label</a></li></ul></cfoutput>
    </div>
    <div class="colResult">
            <cfif IsDefined('out.responseData.results') AND ArrayLen(out.responseData.results) GT 0>
        
                  <!---<cfoutput><input type="checkbox" name="label" id="#qryCompanyAKA.AKA_companyID#" value="" />#out.responseData.results[1].visibleURL# #out.responseData.results[qryCompanyAKA.currentrow].visibleURL#</cfoutput><hr />--->
                  
                  <!--- <cfdump var="#out.responseData.results[start].visibleURL#"><br />--->
                  <cfset resultLenght = ArrayLen(out.responseData.results)>
                  <cfset resultloop = 1>
                  <cfloop to="#ArrayLen(out.responseData.results)#" from="1" index="i">
                        <cfset checkitem =out.responseData.results[i].visibleURL>
                        <cfif listcontainsnocase(exclude,checkitem) EQ 0><cfoutput>
                        <input type="radio" name="addURL" class="addURL" id="#qryCompanyAKA.aka_companyID#" 
                        value="#out.responseData.results[i].visibleURL#" /> 
                        <span alt="#checkitem#" class="loadPage">#checkitem#</span></cfoutput>
                  <br /><cfset resultloop =  resultloop + 1>
                    </cfif>
                  </cfloop>
                  <cfoutput>
                  <input type="radio" name="addURL" class="addURL" id="#qryCompanyAKA.aka_companyID#" value="-1"  />Domain not in list<br />
                  <input type="radio" name="addURL" class="addURL" id="#qryCompanyAKA.aka_companyID#"  value="typed" /> <input type="text" id="typed#qryCompanyAKA.aka_companyID#" />
                  </cfoutput> 
            <cfelse><cfbreak></cfif>
	</div>
    <div class="clear"></div>
    <div id="more<cfoutput>#qryCompanyAKA.aka_companyID#</cfoutput>"></div>
    </div></cfloop>

 </div>
 
 <div style="width:900px; float:left; height:1200px">
 	<div>
    	<a href="javascript:loadGoogle();">Load google</a>
    </div>
    <iframe src="http://www.google.com?" width="100%" height="95%" name="googleFrame" id="googleFrame">
      <p>Your browser does not support iframes.</p>
    </iframe>
</div>

</body>
</html>
            <!---
			<cfdump var="#r#"><br />
            <cfdump var="#out.responseData.results[start].visibleURL#">
            <cfoutput>#out.responseData.results[start].visibleURL#<br /></cfoutput>
	
			     <cfif IsDefined('out.responseData.results')>
      <cfset start  = start+ ArrayLen(out.responseData.results)>
         <cfloop array="#out.responseData.results#" index="r">
             <cfdump var="#r#">
         </cfloop>
     <cfelse>
      <cfbreak>
     </cfif>

                <cfif IsDefined('out.responseData.results')>
              <cfset start  = start+ ArrayLen(out.responseData.results)>
                 <cfloop array="#out.responseData.results#" index="r">
                     <cfdump var="#r#">
                 </cfloop>
             <cfelse>
              <cfbreak>
             </cfif> --->