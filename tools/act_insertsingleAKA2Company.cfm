<cfquery name="qryCompanySingle" datasource="#var.dsn#">
    select top 1 *, lower(REPLACE(AKA_companyURL, '/?', '')) as url
    from companyAKA
    where AKA_companyID = #form.akaID#;
</cfquery>

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
           ('#qryCompanySingle.AKA_companyName#'
           ,'#lcase(qryCompanySingle.URL)#'
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
    where (companyID = 0 or companyID = '' or companyId is null) 
    and AKA_companyID in (
    #form.akaID#
    )
</cfquery>

<cflocation url="dsp_AKA2Company.cfm?s1=#form.r1#&s2=#form.r2#&d2=#form.or2#">
</cfoutput>