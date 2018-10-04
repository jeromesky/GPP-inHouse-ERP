<cfparam name="url.id" default="0" type="string">

<cfquery name="qryCompanyDetails" datasource="#var.dsn#" maxrows="1">
    select *
    from companies
    where active = 1 
    and companyID = #url.id#
</cfquery>

<cfquery name="qryCompanyLabelcount" datasource="#var.dsn#" maxrows="1">
    select count(*) as count
    from companyAKA
    where active = 1 
    and companyID = #url.id#
</cfquery>

<cfquery name="qryCompanyLabels" datasource="#var.dsn#" maxrows="50">
    select *
    from companyAKA
    where active = 1 
    and companyID = #url.id#
    order by AKA_companyName
</cfquery>

<cfquery name="qryCompanyPeopleCount" datasource="#var.dsn#" maxrows="1">
	select count(*) as count
	from tblIndividual
    where status = 'c'
    and AKA_companyID in (
    
        select AKA_companyID
        from companyAKA
        where active = 1 
        and companyID = #url.id#
        
    )
</cfquery>

<cfquery name="qryCompanyPeople" datasource="#var.dsn#" maxrows="150">
	select *
	from tblIndividual
    where status = 'c'
    and AKA_companyID in (
    
        select AKA_companyID
        from companyAKA
        where active = 1 
        and companyID = #url.id#
        
    )
    order by strEmail
</cfquery>
<script type="text/javascript">
		<!---$(document).ready(function() { --->
	$('#companyName').autocomplete({
			source:  '../Companies/JSON_search.cfm',
	<!---	source: function(request, response) {
        										$.ajax({
         										url: "http://www.petro21.com/my-office/companies/JSON_search.cfm",
               									dataType: "json",
          										data: { term : request.term, nocache: 989865465 },
          										success: function(data) { response(data); }
        										});
      										},--->
		select:function( event, ui ) {
					
						//$("#cID").val( ui.item.companyID); 
						
		},
		minLength: 3,
		search: function(event, ui) { 
			$( this ).removeClass( "ui-corner-all" ).addClass("ui-corner-top").addClass( "ui-autocomplete-loading");

		 },
		 focus: function(event, ui) { 
		 	$( this ).removeClass("ui-corner-top").removeClass( "ui-autocomplete-loading").addClass( "ui-corner-all" );

		  }
	});
<!---});--->
</script>

<form method="post" name="Form1">
Company Details<br />
<table>
<cfoutput query="qryCompanyDetails"><tr>
<td>ID</td>
<td>#companyID#</td>
</tr>
<tr>
<td>Name</td>
<td>#companyName#</td>
</tr>
<tr>
<td>URL</td>
<td>#companyURL#</td>
</tr></cfoutput>
</table>
<hr />

<cfoutput>#qryCompanyLabelcount.count#</cfoutput> - Label Detail/s<br />
<table>
<tr>
  <td>&nbsp;</td>
<td>ID</td>
<td>Name/label</td>
<td>URL</td>
</tr>
<cfoutput query="qryCompanyLabels"><tr<cfif currentrow mod 2> bgcolor="##ddd"</cfif>>
  <td><input type="radio" class="companyLebel" name="aka_companyID" value="#AKA_companyID#" /></td>
<td>#AKA_companyID#</td>
<td>#AKA_companyName#</td>
<td>#AKA_companyURL#</td>
</tr></cfoutput>
</table>
<cfoutput>#qryCompanyPeopleCount.count#</cfoutput> - Personal Detail/s<br />
<cfdump var="#qryCompanyPeople#" expand="no" top="15">
<hr />

<div >
Search in parent companies: <input class="ui-corner-all" type="text" id="companyName" />

<input type="hidden" name="cID" id="cID" value="" />
</div>
<hr />
</form>
<cfif qryCompanyPeopleCount.count EQ 0>
<hr />
DELETE Label
<div style="padding:10px; background-color:#CCC">
<button onclick="javascript:deleteLabel();">Delete Label</button></div>
<hr />
DELETE Company
<div style="padding:10px; background-color:#CCC">
<input name="companyID" type="text" value="<cfoutput>#url.id#</cfoutput>" />
<button id="deleteCompany" onclick="javascript:deleteCompany(<cfoutput>#url.id#</cfoutput>)">Delete Company</button></div>



</cfif>


