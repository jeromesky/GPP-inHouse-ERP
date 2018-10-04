<cfinclude template="qry_company_industry_sectors.cfm">

<ul class="checklist cl2"><cfloop query="company_industry_sectors"><cfoutput>
<li><label for="#company_industry_sectors.IngIndustry_ID#"><input id="#company_industry_sectors.IngIndustry_ID#" type="checkbox" name="Company_industry_Type" value="#company_industry_sectors.IngIndustry_ID#">#ucase(company_industry_sectors.strIndustry_Description)#</label></li></cfoutput>
</cfloop></ul>