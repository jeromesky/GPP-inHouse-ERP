<cfoutput>

<cfinclude template="qry_suggest.cfm">
<ul class="listMenu">
<cfloop query="qryCompanyAKA">
    	<li title="THIS IS A LABEL, by selecting this option you will not need any other step">
        <div style="display:inline; float:left; width:25px">
        	<input class="companyAction" type="radio" name="selectCompanyID" value="#qryCompanyAKA.companyID#" alt="companyLabel" title="#Ucase(qryCompanyAKA.AKA_companyName)#" id="#qryCompanyAKA.AKA_companyID#" lang="#trim(qryCompanyAKA.companyName)#" >
       	</div>
        #Ucase(qryCompanyAKA.AKA_companyName)# <br />
    	<span class="listDetails">Holding Company: #qryCompanyAKA.companyName# </span> <span class="listUrl">#qryCompanyAKA.AKA_companyURL#</span>
	</li>
</cfloop></ul></cfoutput>