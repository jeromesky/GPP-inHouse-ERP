<cfinclude template="qry_suggest.cfm"><cfoutput>
<ul class="listMenu">
    <li class="">
        <cfif companyType NEQ "country">
        <span class="listParent countries"><a href="javascript:populateCompanySuggest('searchCountry', 1);">Load Countries</a></span>
        </cfif>
        <cfif companyType NEQ "academic">
        <span class="listParent accademic"><a href="javascript:populateCompanySuggest('searchAcademic', 1);">Load Academics</a></span>
        </cfif>
        <cfif companyType NEQ "association">
        <span class="listParent institutes"><a href="javascript:populateCompanySuggest('searchAssociation', 1);">Load Institutions</a></span>
        </cfif>
        <cfif companyType NEQ "independent">
        <span class="listParent institutes"><a href="javascript:populateCompanySuggest('searchIndependent', 1);">Load Independent</a></span>
        </cfif>
    </li>
    <cfloop query="qryCompanies">
	<li class="listParent parentCompany" title="THIS IS A COMPANY, by selecting this option you will need to create a label if not displayed below">
		<div style="display:inline; float:left; width:25px"><input class="companyAction" type="radio" name="selectCompanyID" value="#qryCompanies.companyID#" alt="#companyType#">
        </div>#Ucase(qryCompanies.companyName)#</li>
   </cfloop>
   		<li class="listParent listNoResult" title="no company was automatically found, search for the company or create it by clicking here">
			<div style="display:inline; float:left; width:25px"><input class="companyAction" type="radio" name="selectCompanyID" value="" alt="newCompany"></div>Company not listed, search Company</li>
</ul></cfoutput>