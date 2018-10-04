<script type="text/javascript">
$(document).ready(function() {
    $('#formCompanySave').submit(function() { 
		$(this).ajaxSubmit( { clearForm: false, success: actionCompanySave}); 
		return false; 	
    }); 
}); 
</script>
<cfoutput>

<form id="formCompanySave" action="../companies/qry_company_Update.cfm" method="post">

<div class="c4" id="companyColumForm">
        	<cfinclude template="dsp_form.cfm">
 <!---       <div class="ui-corner-top ui-widget ui-widget-content podForm">
            <fieldset >
                <legend id="legend_company"><cfif form.companyID EQ 0>Add New Company<cfelse>Edit Company Details</cfif></legend>
                    <b>Active</b>
                    <i class="NoFormat">
                        <input type="checkbox" name="active" id="company_active" value="1" <cfif qry_company.active EQ 1>checked</cfif> <cfif form.companyID EQ 0>checked</cfif>>
                    </i>
                    <b> Name</b>
                    <i class="NoFormat" >
                        <input type="text" name="companyName" id="company_companyName" value="<cfif form.companyID EQ 0 AND form.companyName NEQ "">#form.companyName#<cfelse>#qry_company.companyName#</cfif>" class="ui-corner-all"/> 
                        <input type="hidden" id="company_companyID" name="companyID" value="#form.companyID#">
                    </i>
                    <b>Industry Type</b>
                    <i class="NoFormat">
                        <select name="industryID" id="company_industryID" class="ui-corner-all"><cfloop query="qry_industry">
                        <option value="#qry_industry.industryID#"<cfif qry_company.industryID EQ qry_industry.industryID> selected="selected"</cfif>>#qry_industry.industryName#</option></cfloop>
                        </select>
                    </i>
                    <b>Web link</b>
                    <i class="NoFormat">
                        <input type="text" name="companyURL" id="company_companyURL" value="<cfif qry_company.companyURL EQ "">http://<cfelse>#qry_company.companyURL#</cfif>" class="ui-corner-all"/>
                    </i>
                    <b>VAT</b>
                    <i class="NoFormat">
                        <input type="text" id="company_VATNumber" value="#qry_company.VATNumber#" name="VATNumber" class="ui-corner-all">
                    </i>
                    <b>Company Bios</b>
                    <i class="NoFormat">
                        <textarea name="companyBios" id="company_companyBios" class="ui-corner-all ckeditor" style="height:100px; width:200px;">#qry_company.companyBios#</textarea>
                    </i>      
            </fieldset>
        </div>--->

        <div id="companyActions" class="ui-corner-bottom  ui-widget ui-widget-content  podForm podBgFade_bl">
          <button id="SaveCompany" onClick="javascript:SaveCompany();" class="ui-corner-all">Save form</button> 
          <cfif form.companyID NEQ 0 AND form.userID NEQ 0 ><button onClick="javascript:UpdateUserCompany();" class="ui-corner-all">Link this company to user</button></cfif>    
        </div>
</div>
<cfif form.companyID NEQ 0 >
<div class="c4">
        <cfif qry_company.companyLogo NEQ "">
        <div class="marginBottom15 podForm">
        	<img src="http://www.petro21.com/_files/business/#qry_company.companyLogo#" />
        </div></cfif>
        <div class="ui-corner-top ui-widget ui-widget-content podForm podBgFade">
                <fieldset >
                    <legend>Company Options</legend>
                    <ul class="listMenu">                  
                        <cfif form.userID NEQ 0 >
                        <li><a href="javascript:openWindow({ url:'../companyLabels/index.cfm', param: {'companyID': #form.companyID#, 'AKA_companyID' : 0, 'userID' : #form.userid#}, Args:{  title : 'Manage company Labels', height:330, width:670, modal:false}});">Company Labels</a></li></cfif>
                        <li><a href="javascript:openWindow({ url:'../branches/index.cfm', param: {'companyID':#form.companyID#, 'userID':#form.userid#, 'branchID':0 }, Args:{  title : 'Manage Branches', height:550, width:850, modal:false}});">Branches</a></li>
                        <li><a href="javascript:openWindow({ url:'../contacts/index.cfm', param: {'companyID': #form.companyID#, 'userID':#form.userid#}, Args:{  title : 'Manage contacts', height:500, width:940, modal:false}});">Contacts</a></li>
                        <li><a href="javascript:openWindow({ url:'../files/index.cfm', param: {'fileTable':'company', 'fileTableID':#form.companyID# }, Args:{  title : 'Manage files', height:550, width:800, modal:false}});">Upload company files</a> </li>
                        <cfif  Listcontains("jerome,jason,babette,thomas",  trim(Session.staffName), ",")  >
                        <li><a href="javascript:openWindow({ url:'../Companies/dsp_merge_companies.cfm', param: { }, Args:{  title : 'Merge Companies', height:220, width:220, modal:false}});">Merge Companies</a></li></cfif>
                        <li><a href="javascript:loader('client_form_Memberships.cfm', 'areaConfiguration' , 0, #form.companyID#);">Company Membership</a></li>
                    </ul>
        		</fieldset>
		</div>
</div></cfif></cfoutput>
</form>
<!---<cfif form.companyID EQ 0>style="margin-left:0px"</cfif>--->