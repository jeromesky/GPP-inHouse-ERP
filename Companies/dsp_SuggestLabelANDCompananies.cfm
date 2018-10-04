<!---<cfparam name="form.searchCountry" default="0">--->
<cfoutput>

<cfinclude template="qry_labelsANDCompanies.cfm">
	<ul class="listMenu">
    	<li class="">
        	<cfif companyType NEQ  "country">
        	<span class="listParent countries"><a href="javascript:populateCompanySuggest('searchCountry', 1);">load countries</a></span>
            </cfif>
            <cfif companyType NEQ  "academic">
            <span class="listParent accademic"><a href="javascript:populateCompanySuggest('searchAcademic', 1);">load academics</a></span>
            </cfif>
            <cfif companyType NEQ  "association">
            <span class="listParent institutes"><a href="javascript:populateCompanySuggest('searchAssociation', 1);">load Institutions</a></span>
        	</cfif>
            <cfif companyType NEQ  "independent">
            <span class="listParent institutes"><a href="javascript:populateCompanySuggest('searchIndependent', 1);">load Independent</a></span>
        	</cfif>
        </li>
    
	<cfif qryCompanies.recordcount EQ 0>
        	<li class="listParent listNoResult" title="no company was automatically found, search for the company or create it by clicking here">
            	<div style="display:inline; float:left; width:25px"><input class="companyAction" type="radio" name="selectCompanyID" value="" alt="newCompany"></div>No result create comany</li>
    <cfelse>
    		<li class="listParent listNoResult" title="no company was automatically found, search for the company or create it by clicking here">
            	<div style="display:inline; float:left; width:25px"><input class="companyAction" type="radio" name="selectCompanyID" value="" alt="newCompany"></div>company not listed, search comany</li>
    </cfif>

    <cfloop query="qryCompanies">
    	<li class="listParent parentCompany" title="THIS IS A COMPANY, by selecting this option you will need to creat a label if not displayed below">
        		<div style="display:inline; float:left; width:25px"><input class="companyAction" type="radio" name="selectCompanyID" value="#qryCompanies.companyID#" alt="#companyType#">
        		</div>#Ucase(qryCompanies.companyName)#</li></cfloop>
        
    
    <cfif qryCompanyAKA.recordcount EQ 0>
        	<li class="listNoResult">No result</li>
    </cfif>
    <cfloop query="qryCompanyAKA">
    	<li title="THIS IS A LABEL, by selecting this option you will not need any other step">
        <div style="display:inline; float:left; width:25px">
        	<input class="companyAction" type="radio" name="selectCompanyID" value="#qryCompanyAKA.companyID#" alt="companyLabel" title="#Ucase(qryCompanyAKA.AKA_companyName)#" id="#qryCompanyAKA.AKA_companyID#" lang="#trim(qryCompanyAKA.companyName)#" >
       	</div>
        #Ucase(qryCompanyAKA.AKA_companyName)# <br />
        <span class="listDetails">Holding Company: #qryCompanyAKA.companyName# </span> <span class="listUrl">#qryCompanyAKA.AKA_companyURL#</span>
        </li>
   </cfloop>
        
	</ul>
</cfoutput> 

   <!---<cfif companyType NEQ  "country">
		<li class="listParent countries"><a href="javascript:populateCompanySuggest('searchCountry', 1);">load countries</a></li>
	</cfif>
    <cfif companyType NEQ  "academic">
		<li class="listParent accademic"><a href="javascript:populateCompanySuggest('searchAcademic', 1);">load academics</a></li>
	</cfif>
    
    <cfif companyType NEQ  "association">
		<li class="listParent institutes"><a href="javascript:populateCompanySuggest('searchAssociation', 1);">load Institutions</a></li>
	</cfif> --->