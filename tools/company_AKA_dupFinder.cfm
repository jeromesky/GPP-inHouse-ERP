<cfscript>
	var.dsn = 'gpp';
</cfscript>

<cfquery name="qryCompanyList" datasource="#var.dsn#">
select top 10 AKA_companyName
from companyAKA
group by AKA_companyName
having COUNT(AKA_companyName) >= 2
order by AKA_companyName DESC
</cfquery>
<!---<cfdump var="#qryCompanyList#" expand="no">--->

<cfloop query="qryCompanyList">

    <cfquery name="qryCompanyListID" datasource="#var.dsn#">
    select top 10 AKA_companyID
    from companyAKA
    where AKA_companyName = '#qryCompanyList.AKA_companyName#'
    order by AKA_companyID
    </cfquery>
	<!---<cfdump var="#qryCompanyListID#" expand="no">--->

    <cfloop query="qryCompanyListID">
    
        <cfquery name="qryUserCount" datasource="#var.dsn#">
        select count(*) as total
        from tblIndividual
        where lngCompany_ID = #AKA_companyID#
        </cfquery>
        <cfoutput>#AKA_companyID#: #qryUserCount.total#</cfoutput><br />

    </cfloop>
    <hr />
</cfloop>