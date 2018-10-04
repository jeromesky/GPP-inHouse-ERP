<cfinclude template="qry_company_form.cfm"><cfoutput>
<input type="hidden" id="company_companyID" name="companyID" value="#form.companyID#">
<div class="ui-corner-top ui-widget ui-widget-content podForm">
            <fieldset >
                <legend id="legend_company"><cfif form.companyID EQ 0>Add New Company<cfelse>Edit Company Details</cfif></legend>
                    <b>Active</b>
                    <i class="NoFormat">
                        <input type="checkbox" name="active" id="company_active" value="1" <cfif qry_company.active EQ 1>checked</cfif> <cfif form.companyID EQ 0>checked</cfif>>
                    </i>
                    <b><cfif qry_company.lock NEQ ""><span style="color:##F00">Not editable</span><cfelse>Name</cfif></b>
                    <i class="NoFormat" >
                        <input type="text" name="companyName" id="company_companyName" <cfif qry_company.lock NEQ "">disabled="disabled"</cfif> value="<cfif form.companyID EQ 0 AND form.companyName NEQ "">#form.companyName#<cfelse>#qry_company.companyName#</cfif>" class="ui-corner-all"/> 
                        <input type="hidden" name="companyName_Old" value="#qry_company.companyName#" />
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
                        <input type="hidden" name="VATNumber_Old" value="#qry_company.VATNumber#" />
                    </i>
                    <b>Company Bios</b>
                    <i class="NoFormat">
                        <textarea name="companyBios" id="companyBios" class="ui-corner-all ckeditor" style="height:100px; width:200px;">#qry_company.companyBios#</textarea>
                    </i>
                    <input type="hidden" name="changeDetect" value="companyName,companyName_Old" />    
            </fieldset>
</div></cfoutput>