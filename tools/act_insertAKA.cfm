<cfoutput>
<cfquery name="qryCompanyAKAupdate" datasource="#var.dsn#">
INSERT INTO [GPP].[dbo].[companies]
           ([companyName]
           ,[companyURL]
           ,[active]
           ,[createDate]
           ,[updated]
           ,[VATNumber])
     VALUES
           ('#form.companyName#'
           ,'#form.companyURL#'
           ,1
           ,getdate()
           ,GETDATE()
           ,'')
SELECT (@@Identity) AS newID
</cfquery>

<cfscript>
form.cid = qryCompanyAKAupdate.newID;
</cfscript>

<cfquery name="qryCompanyAKAupdate" datasource="#var.dsn#">
    update
        companyAKA
    set
        updated = GETDATE(),
        companyID = #form.cid#
    where <!---companyID = 0 
    and---> AKA_companyID in (
    #form.akaID#
    )
</cfquery>

<cflocation url="aka.cfm?s1=#form.r1#&s2=#form.r2#&c=#form.c#">
</cfoutput>