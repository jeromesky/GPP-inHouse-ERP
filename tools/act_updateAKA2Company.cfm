<cfdump var="#form.cid#">
<hr />
<cfdump var="#form.akaID#">

<cfquery name="qryCompanyAKAupdate" datasource="#var.dsn#">
    update
        companyAKA
    set
        updated = GETDATE(),
        companyID = #form.cid#
    where AKA_companyID in (
    #form.akaID#
    )
</cfquery>

<cfoutput>
<cflocation url="dsp_AKA2Company.cfm?s1=#form.r1#&s2=#form.r2#&c=#form.c#">
</cfoutput>