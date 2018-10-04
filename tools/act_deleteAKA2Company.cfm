<cfdump var="#form.akaID#">

<cfquery name="qryCompanyAKAchecking4user" datasource="#var.dsn#">
select *
from tblIndividual
where AKA_companyID = #form.akaID# 
</cfquery>

<cfif qryCompanyAKAchecking4user.recordcount EQ 0>

<cfquery name="qryCompanyAKAdelete" datasource="#var.dsn#">
delete
from companyAKA
    where (companyID = 0 or companyID = '' or companyId is null) 
    and AKA_companyID = #form.akaID#  
</cfquery>

<cfelse>

<cfdump var="#qryCompanyAKAchecking4user#">
<cfabort>

</cfif>

<cfoutput>
<cflocation url="dsp_AKA2Company.cfm?s1=#form.r1#&s2=#form.r2">
</cfoutput>