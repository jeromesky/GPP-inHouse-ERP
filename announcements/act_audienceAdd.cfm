<cfdump var="#form#">
<cfdump var="#cgi#">
<cfoutput>
<!---<cfdump var="#form#">
<cfdump var="#cgi#">--->

<!--- default values --->
<cfparam name="sql.records" default=-1>
<cfparam name="sql.required" default=0>
<cfparam name="form.errors" default='<br>'>


<cfparam name="form.interestID" default="0">
<cfparam name="form.areaID" default="0">
<cfparam name="form.countryID" default="0">
<cfparam name="form.sectorID" default="0">
<cfparam name="form.companyID" default="0">
<cfparam name="form.roleID" default="0">
<cfparam name="form.eventID" default="0">

<!--- check values --->

  <!--- name valid length --->
  <cfif len(form.audienceName) LT 5>

  <cfset form.errors = form.errors & 'Name is too short, length should be 6 or more in length<br/>'>
  <cfset sql.required =sql.required -100>

  </cfif>
  
  <!--- Interests --->
  <cfif len(form.interestID) GT 0>

  <cfset sql.required =sql.required +1>
  
  </cfif>

  <!--- Area of the world --->  
  <cfif len(form.areaID) GT 0>

  <cfset sql.required =sql.required +1>
  
  </cfif> 

  <!--- Countries --->    
  <cfif len(form.countryID) GT 0>

  <cfset sql.required =sql.required +1>
  
  </cfif>
  
  <!--- Busines Focus --->
  <cfif len(form.sectorID) GT 0>

  <cfset sql.required =sql.required +1>
  
  </cfif> 
  
  <!--- Companies Search --->
  <cfif len(form.companyID) GT 0>

  <cfset sql.required =sql.required +1>
  
  </cfif>
  
  <!--- Roles --->
  <cfif len(form.roleID) GT 0>

  <cfset sql.required =sql.required +1>
  
  </cfif>
  
  <!--- Events --->
  <cfif form.eventID GT 0>

  <cfset sql.required =sql.required +1>
  
  <!--- ATTENDENDANCE TYPE --->
  
  <!--- ATTENDENDANCE incl/exclude --->
  
  </cfif> 

<!--- create sql script --->


<cfquery datasource="#mainDSN#" name="check_audience_numbers" result="total">
  SELECT
    count(distinct strEmail) As TotalCount
  FROM 
    GPP.DBO.tblIndividual
  LEFT OUTER JOIN GPP.DBO.tblIndOptions ON GPP.DBO.tblIndividual.IngIndividual_ID = GPP.DBO.tblIndOptions.lngIndividual_ID	
  WHERE 
    ([status] = 'C')
 <!--- AND 
    (chkEmail = 1) --->
 <!--- AND
    (tblIndOptions.chkRecAlerts <> 1) --->
  AND (
            (tblIndOptions.email_bounce < 15)
            OR
            (tblIndOptions.email_bounce is null)
	) AND ( 
          (tblIndOptions.chkCompetitors <> 1)
          OR
          (tblIndOptions.chkCompetitors is null)
	)	
  AND 
    (strEmail like '%_@__%._%')
  AND 
    (CHARINDEX(' ',LTRIM(RTRIM(strEmail))) = 0) 
  AND 
    LEFT(LTRIM(strEmail),1) <> '@' 
  AND 
    RIGHT(RTRIM(strEmail),1) <> '.' 
  AND 
    CHARINDEX('.',strEmail ,CHARINDEX('@',strEmail)) - CHARINDEX('@',strEmail ) > 1 
  AND 
    LEN(LTRIM(RTRIM(strEmail))) - LEN(REPLACE(LTRIM(RTRIM(strEmail)),'@','')) = 1 
  AND 
    CHARINDEX('.',REVERSE(LTRIM(RTRIM(strEmail)))) >= 3 
  AND 
    (CHARINDEX('.@',strEmail) = 0 
  AND 
    CHARINDEX('..',strEmail) = 0)
  AND 
    (SUBSTRING(strEmail, (len(strEmail)-CHARINDEX('.', REVERSE(strEmail))+2), (CHARINDEX('.', REVERSE(strEmail)))) in (SELECT TLDname FROM GPP.DBO.TLD)) 
   <cfif len(#form.companyID#) GT 0>
  AND   
   lngCompany_ID in (#form.companyID#) 
    </cfif>
</cfquery>

<cfdump var="#check_audience_numbers.TOTALCOUNT#">
<cfdump var="#sql#">


<cfif sql.required GT 0>

<cfquery datasource="#mainDSN#" name="add_audience">
INSERT INTO GPP.dbo.ann_audiences
           ([audienceName]
           ,[audienceTotal]
           ,[AUDIENCESQL]
           ,[audienceWhitelist]
           ,[audienceBlacklist]
           ,[audienceBusinesSector]
           ,[audienceRegions]
           ,[audienceGIS]
           ,[audienceCountryList]
           ,[audienceCompanyList]
           ,[audienceRoleList]
           ,[audienceEventList]
           ,[audienceEventListExclude]
           ,[StaffIDcreated]
           ,[StaffIDupdated]
           ,[DateAdded]
           ,[DateUpdated])
     VALUES
           ('#form.AUDIENCENAME#'
           ,'#check_audience_numbers.TOTALCOUNT#'
           ,'##'
           ,0
           ,0
           ,'#form.sectorID#'
           ,'#form.areaID#'
           ,'-'
           ,'#form.countryID#'
           ,'#form.companyID#'
           ,'#form.roleID#'
           ,'#form.eventID#'
           ,'0'
           ,'90'
           ,'100'
           ,getdate()
           ,getdate()
           )
</cfquery>

</cfif></cfoutput>


<cfdump var="#cgi#">

<cfabort>
