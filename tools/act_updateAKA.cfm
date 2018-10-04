<cfdump var="#form.cid#">
<hr />
<cfdump var="#form.akaID#">

<cfquery name="qryCompanyAKAupdate" datasource="#var.dsn#">
    update
        companyAKA
    set
        updated = GETDATE(),
        companyID = #form.cid#
    where 
<!---    companyID = 0 
    and --->
    AKA_companyID in (
    #form.akaID#
    )
</cfquery>

<cfoutput>
<cflocation url="aka.cfm?s1=#form.r1#&s2=#form.r2#&c=#form.c#">
</cfoutput>
