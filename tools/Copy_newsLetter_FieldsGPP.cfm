<cfinclude template="../Application.cfm" >
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<body>
<cfset foundMatch = 0 >


    <cfquery datasource="gppdata" name="getData" >
        SELECT lngIndividual_ID
       
        FROM tblIndOptions 
        WHERE  chkW = 1 
        </cfquery> 

<cfloop query="getData">
                <cfquery datasource="gppdata"  >
            UPDATE  tblIndOptions
			SET 
            	  
                 chkUSANews = 1

                 WHERE lngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#getData.lngIndividual_ID#" >
            </cfquery>
</cfloop>
<cfoutput>
WEB Count #getData.recordcount# <br />
Found:  #foundMatch# </cfoutput>---> 

</body>
</html>
<!---
 WHERE IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#getMatch.IngIndividual_ID#" >

email_web = <cfqueryparam value="#getData.emailAddr#">

dataMoved

OR dataMoved IS NULL AND emailaddr <> ''

AND id > 28420

AND (tblIndividual.STATUS = 'C')


                <cfquery datasource="gppdata"  >
            UPDATE tblIndOptions
            SET
                 chkW 		= <cfif getData.no_email EQ 0>1<cfelse>0</cfif>,
                 chkLA 		= <cfif getData.PL EQ 0>1<cfelse>0</cfif>,
                 chkME 		= <cfif getData.PAr EQ 0>1<cfelse>0</cfif>,
                 chkE 		= <cfif getData.PE EQ 0>1<cfelse>0</cfif>,
                 chkAF 		= <cfif getData.PA EQ 0>1<cfelse>0</cfif>,
                 chkA   		= <cfif getData.PAs EQ 0>1<cfelse>0</cfif>,
                 chkSAENews		= <cfif getData.SAENews EQ 0>1<cfelse>0</cfif>,
             <!---
                 chkCaNews 
                 chkOzNews 
                 chkMedNews 
                 chkEAENews 
                 chkWAENews 
                 chkNOCNews 
                 chkPCapNews --->
                 chkWebIntWo  	= <cfif getData.IntWo EQ 0>1<cfelse>0</cfif>,
                 chkWebIntAf 	= <cfif getData.IntAf EQ 0>1<cfelse>0</cfif>,
                 chkWebIntNaf 	= <cfif getData.IntNAf EQ 0>1<cfelse>0</cfif>,
                 chkWebIntMe 	= <cfif getData.IntME EQ 0>1<cfelse>0</cfif>,
                 chkWebIntAs 	= <cfif getData.IntAs EQ 0>1<cfelse>0</cfif>,
                 chkWebIntLa 	= <cfif getData.IntLa EQ 0>1<cfelse>0</cfif>,
                 chkWebIntNa 	= <cfif getData.IntNAm EQ 0>1<cfelse>0</cfif>,
                 chkWebIntEu 	= <cfif getData.IntEu EQ 0>1<cfelse>0</cfif>,
                 chkWebIntGen 	= <cfif getData.IntGen EQ 0>1<cfelse>0</cfif>,
                 chkWebIntSAE 	= <cfif getData.IntSAE EQ 0>1<cfelse>0</cfif>,
                 chkWebIntAdvertising		= <cfif getData.advertising  EQ 0>1<cfelse>0</cfif>,
                 merged			= 1
                 <!---
                 chkWebIntEAf 	= 
                 chkWebIntWAf 	= 
                 
                 --->	  	
                  
                  WHERE  lngIndividual_ID  =  <cfqueryparam cfsqltype="cf_sql_integer" value="#getMatch.IngIndividual_ID#" >
            </cfquery>
  WHERE  lngIndividual_ID  =  <cfqueryparam cfsqltype="cf_sql_integer" value="#getMatch.IngIndividual_ID#" >


	name
	surname
	emailAddr

	title
	position <> '' AND
	company <> '' AND
	
	address <> '' AND
	postal
	city <> '' AND
	citycode <> '' AND
	country  <> '' AND
	phone <> '' AND
	Fax <> ''
	

	SAENews = 0,
	PE = 0,
	PAr = 0,
	PL = 0,
	PAs = 0,
	PA = 0,
	no_email = 0,
	
	IntME = 0,
	IntWo = 0,
	IntAf = 0,
	IntAs = 0,
	IntGen = 0,
	IntNAm = 0,
	IntLa = 0,
	IntEu = 0,
	IntNAf = 0,
	
	IntSAE = 0
	
	
	PE = 1 AND
	PAr = 1 AND
	PL = 1 AND
	PAs = 1 AND
	PA = 1 AND
	no_email = 1 AND
	
	IntME = 1 AND
	IntWo = 1 AND
	IntAf = 1 AND
	IntAs = 1 AND
	IntGen = 1 AND
	IntNAm = 1 AND
	IntLa = 1 AND
	IntEu = 1 AND
	IntNAf = 1

	IngIndividual_ID
	
	
	strFirst_Name 
	strSurname
	
	strDesignation
	
	strPhDirect_No
	
	strFaxDirect_No

	strEmail
	
	strStreet_Adress 
	strPostal_Adress 
	strCity
	intCode
	
	CountryName
	
	dtmCaptured 

	STATUS
	
	UpdBy
	CapBy

--->