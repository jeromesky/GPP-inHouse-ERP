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

<cfquery name="qryCompanyAKAupdate" datasource="#var.dsn#">
    update
        companyAKA
    set
        updated = GETDATE(),
        companyID = #qryCompanyAKAupdate.newID#
    where AKA_companyID in (
    #form.akaID#
    )
</cfquery>

<cflocation url="dsp_AKA2Company.cfm?s1=#form.r1#&s2=#form.r2#">
</cfoutput>