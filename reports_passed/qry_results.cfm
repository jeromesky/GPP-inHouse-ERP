<cfparam name="tempDSN" default="gppdata">
<cfparam name="form.output_layout" default='print'>
<cfparam name="form.output_format" default='.htm'>

<!--- defaults --->
<cfparam name="form.NAMEFULL" default=0>
<cfparam name="form.NAMETITLE" default=0>
<cfparam name="form.NAMEFIRST" default=0>
<cfparam name="form.NAMELAST" default=0>
<cfif form.NAMEFULL EQ 1>
	<cfset form.NAMETITLE=1>
	<cfset form.NAMEFIRST=1>
	<cfset form.NAMELAST=1>
</cfif>

<cfparam name="form.COMPANY" default=0>
<cfparam name="form.PERSONAL_INFO" default=0>

<cfparam name="form.DISPLAY_COUNT" default=0>

<cfparam name="form.commsPhone" default=0>
<cfparam name="form.commsFAX" default=0>
<cfparam name="form.commsEmail" default=0>
<cfparam name="form.commsEmail" default=0>
<cfparam name="form.commsEmail" default=0>

<cfparam name="form.STATUS" default="C">

<cfparam name="form.POSTALALLOW" default="0">
<cfparam name="form.POSTALADDRESS" default=0>
<cfparam name="form.POSTALSTREET" default=0>
<cfparam name="form.POSTALCODE" default=0>
<cfparam name="form.POSTALCITY" default=0>
<cfif form.POSTALALLOW EQ 1>
	<cfset form.POSTALADDRESS=1>
	<cfset form.POSTALSTREET=1>
	<cfset form.POSTALCODE=1>
	<cfset form.POSTALCITY=1>
</cfif>

<cfparam name="form.POSTALSTATE" default=0>
<cfparam name="form.SOURCEVIEW" default=0>
<cfparam name="form.MEALNEEDS" default=0>

<cfparam name="form.CountryIncluded" default="0">
<cfparam name="form.CountryVisible" default=0>
<cfparam name="form.Country" default="">

<!--- Role/BPADESIGNATION --->

<cfparam name="form.EVENTS" default=0>

<!--- to do list
INVCOMMENTS,
COMMENT_PUBLIC,
COMMENT_PRIVATE,
COMMENT_PAID_STATUS,

SECTOR_EXP,
SECTOR_POWER,
SECTOR_DRPC,
SECTOR_GREEN,
SECTOR_GAS,

REGION_INTEREST_POSTAL,

CHKMAIL,
CHKPRIOPOST,
CHKSECPOST,

COMPANY_INDUSTRY_TYPE,
SEPOTENTIAL,
POSTALSTATE,
SOURCEVIEW,
POSTALCOUNTRYIN,
?,
for dsp page: OUTPUT_LAYOUT,
--->

<cfquery datasource="#dsnP21#" name="qry_results" maxRows="1000">
      SELECT 
		<cfif form.NAMEFULL EQ 1>
            UPPER(tblIndividual.Title) AS _personTitle,
            tblIndividual.strFirst_Name AS _personName,  
            tblIndividual.strSurname AS _personSurname, 
            UPPER(tblIndividual.Title) + ' ' + UPPER(tblIndividual.strFirst_Name) + ' ' + UPPER(tblIndividual.strSurname)  AS personFullName,
		<cfelse>
			<cfif form.NAMETITLE EQ 1>	
            	UPPER(tblIndividual.Title) AS _personTitle,
			</cfif>
            	tblIndividual.strFirst_Name AS _personName,
            	tblIndividual.strSurname AS _personSurname,
		</cfif>
            UPPER(BPA_Designation) AS role, 
            UPPER(strDesignation) AS Designation, 
            UPPER(tblCompany.strCompany_Name) AS companyName,
            sendPOSTAL =
                  CASE
                        WHEN strPostal_Adress = '' THEN strStreet_Adress
                        ELSE strPostal_Adress
                  END,
            strCity,
            intCode,
            Addr_State =
                  CASE
                        WHEN Addr_State is null THEN ''
                        ELSE Addr_State
                  END,
            <cfif form.CountryVisible NEQ 0>UPPER(CountryName) as countryName,</cfif>
		 IngIndividual_ID
      FROM
            GPP.dbo.tblCompany 
		INNER JOIN GPP.dbo.tblIndividual 
			ON GPP.dbo.tblCompany.IngCompany_ID = GPP.dbo.tblIndividual.lngCompany_ID 
		INNER JOIN GPP.dbo.tblConference_Registration 
			ON GPP.dbo.blIndividual.IngIndividual_ID = GPP.dbo.tblConference_Registration.lngIndividual_ID 
		INNER JOIN GPP.dbo.tblConference 
			ON GPP.dbo.tblConference_Registration.lngConference_ID = GPP.dbo.tblConference.IngCon_ID
      WHERE
                  (
			<cfif form.EVENTS NEQ 0>
                        tblConference.IngCon_ID in (#form.EVENTS#) 
                  AND   
			</cfif>
                        tblConference_Registration.ChkCancelled = 0
                  AND 
                        tblIndividual.STATUS = '#form.status#'
                  AND
                        strCity !='no details - city - db'
                  AND
                        strPostal_Adress !='no details - postal address - db'
                  AND
                        strStreet_Adress !='no details - street address - db'
			<cfif form.COUNTRY NEQ "">
			AND
				CountryName in (#form.COUNTRY#)
			</cfif>
                  )
      ORDER BY
            tblCompany.strCompany_Name,
            tblIndividual.strSurname,
            tblIndividual.strFirst_Name;
</cfquery>

<cfset DISPLAY_COUNT = qry_results.recordcount>