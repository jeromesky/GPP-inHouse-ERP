<cfinclude template="../application.cfm">

<cfquery datasource="#gpp#" name="get">
 	select  
    	[userID]
        ,[Holding_Company]
        ,[companyID]
        ,[company]
	from 
    	[CRM_Individual_Company_TEMP]
	WHERE
    	[userID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>
<cfoutput>

<table cellpadding="0" cellspacing="0" border="0" >
 <tr>
   <td valign="top" class="JustRight" >
<fieldset >
		<legend>Company</legend>
    <b>Company</b>
    <i class="company"> #get.company#</i>
    <i class="field_button_container"><a href="javascript:loader('../companies/Company_search.cfm', 'area_search_company', #get.userID#, <cfif get.companyID NEQ "">#get.companyID#<cfelse>0</cfif>);" ><img src="../img/blue_But_Plus.jpg" border="0" /></a>
                        </i><!---javascript:ExternalModalOpen('../--companies/index.cfm', #get.userID#, <cfif get.companyID NEQ "">#get.companyID#<cfelse>0</cfif>, 800, 600, 'Manage Company for this  Individual');--->
    <b>Holding Company</b>
    <i class="Holding_Company" >#get.Holding_Company#</i>
                
  <div id="area_search_company"></div> 
</fieldset>
  
<div id="area_company_Form"></div></td>
        <td valign="top"><div id="areaConfiguration"></div></td>
</tr>
</table>   
</cfoutput>
<!---
	<!---<cfif get.company EQ "">
        				<div id="search_Company" class="tagbox"><input class="inputField" type="text"  id="company_search_missing" name="company"  ></div>
        	 <input type="hidden" id="lngCompany_ID" name="lngCompany_ID"   /> 
		<cfelse></cfif>--->

<cfif get.company EQ "">
<script type="text/javascript">

 $('#search_Company').tagdragon({
 						'field':'company_search_missing',
						'url':'../components/JSON_Company.cfm',
						'charMin' : 3, 
						'cache' : true,
						'max' : 100,
						onSelectItem: function(val) { 
								$('#lngCompany_ID').val(val.id);  
								$('#button_get_Address').css( { 'visibility' : 'visible' } );
								//LoadForm(val.id);
								}
						});
</script>
</cfif>--->