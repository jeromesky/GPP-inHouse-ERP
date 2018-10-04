<cfinclude template="../Application.cfm" >
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Petro21</title>
</head>
<body>
<cfset foundMatch = 0 >

<!--- <cfquery datasource="gppdata" name="getData" >
SELECT strEmail, RecID
FROM tblIndividual_WEB  

</cfquery>--->

<cfquery datasource="gppdata" name="getData" >
SELECT *
FROM tblIndividual_web
WHERE  
	strFirst_Name  <> '' AND
	strSurname <> '' AND
	strDesignation <> '' AND
	strPhDirect_No <> '' AND
	strFaxDirect_No <> '' AND
	strEmail <> '' AND
	strStreet_Adress <> '' AND
	strPostal_Adress <> '' AND
	strCity <> '' AND
	intCode <> '' AND
	CountryName <> '' 
</cfquery>

<cfloop query="getData">

    <cfquery datasource="gppdata" name="getMatch" >
        SELECT tblIndividual.IngIndividual_ID , tblIndividual.strFirst_Name, tblIndividual.strSurname, tblIndividual.strEmail, tblIndividual.strSecretary_Email, tblIndividual.strEmail_Alt
        FROM tblIndividual INNER JOIN
                      tblIndOptions ON tblIndividual.IngIndividual_ID = tblIndOptions.lngIndividual_ID
        WHERE tblIndividual.strFirst_Name LIKE'%#getData.strFirst_Name#%'  AND tblIndividual.strSurname LIKE  '%#getData.strSurname#%'  AND ( tblIndOptions.merged IS NULL ) 
        </cfquery>
		<cfif getMatch.recordcount NEQ 0  >
        	<cfset foundMatch = foundMatch + 1 >
            
                <cfquery datasource="gppdata"  >
            UPDATE tblIndOptions
            SET
                 chkW 		= <cfif getData.chkW EQ 1>1<cfelse>0</cfif>,
                 chkLA 		= <cfif getData.chkLA EQ 1>1<cfelse>0</cfif>,
                 chkME 		= <cfif getData.chkME EQ 1>1<cfelse>0</cfif>,
                 chkE 		= <cfif getData.chkE EQ 1>1<cfelse>0</cfif>,
                 chkAF 		= <cfif getData.chkAF EQ 1>1<cfelse>0</cfif>,
                 chkA   		= <cfif getData.chkA EQ 1>1<cfelse>0</cfif>,
                 chkSAENews		= <cfif getData.chkSAENews EQ 1>1<cfelse>0</cfif>,
                 chkCaNews 
                 chkOzNews 
                 chkMedNews 
                 chkEAENews 
                 chkWAENews 
                 chkNOCNews 
                 chkPCapNews 
                 chkWebIntWo  	= <cfif getData.chkWebIntWo EQ 1>1<cfelse>0</cfif>,
                 chkWebIntAf 	= <cfif getData.chkWebIntAf EQ 1>1<cfelse>0</cfif>,
                 chkWebIntNaf 	= <cfif getData.chkWebIntNaf EQ 1>1<cfelse>0</cfif>,
                 chkWebIntMe 	= <cfif getData.chkWebIntMe EQ 1>1<cfelse>0</cfif>,
                 chkWebIntAs 	= <cfif getData.chkWebIntAs EQ 1>1<cfelse>0</cfif>,
                 chkWebIntLa 	= <cfif getData.chkWebIntLa EQ 1>1<cfelse>0</cfif>,
                 chkWebIntNa 	= <cfif getData.chkWebIntNa EQ 1>1<cfelse>0</cfif>,
                 chkWebIntEu 	= <cfif getData.chkWebIntEu EQ 1>1<cfelse>0</cfif>,
                 chkWebIntGen 	= <cfif getData.chkWebIntGen EQ 1>1<cfelse>0</cfif>,
                 chkWebIntSAE 	= <cfif getData.chkWebIntSAE EQ 1>1<cfelse>0</cfif>,
                 chkWebIntAdvertising		= <cfif getData.chkWebIntAdvertising  EQ 1>1<cfelse>0</cfif>,
                 merged			= 1
                 
                 chkWebIntEAf 	= 
                 chkWebIntWAf 	= 

                  WHERE  lngIndividual_ID  =  <cfqueryparam cfsqltype="cf_sql_integer" value="#getMatch.IngIndividual_ID#" >
            </cfquery>

		</cfif>

<!---
<cfquery datasource="gppdata" name="addMark" >UPDATE tblIndividual_web SET flagIt = 1 
WHERE IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#getData.IngIndividual_ID#"></cfquery>		--->	
        		
</cfloop>

<cfoutput>
WEB Count #getData.recordcount# <br />
Found:  #foundMatch# </cfoutput>


	 


</body>
</html>
<!---


        		<cfquery datasource="gppdata" name="getnew" >
                 INSERT INTO  tblIndividual_WEB (
                strIndSource,
                STATUS,
                strFirst_Name, 
                strSurname,
                strDesignation,
                strPhDirect_No,
                strFaxDirect_No,
                strEmail,
                strStreet_Adress, 
                strPostal_Adress, 
                strCity,
                intCode,
                CountryName,
                dtmCaptured,
                UpdBy,
                CapBy,
                company_web
                 
                 )
                 VALUES( 
				  'web',
				  'C',
                  '#getData.name#',
                  '#getData.surname#',
                  '#getData.position#',
                  '#getData.phone#',
                  '#getData.fax#',
                  '#Left(getData.emailAddr, 50)#',
                  '#getData.address#',
                  '#getData.postal#',
                  '#getData.city#',
                  '#getData.citycode#',
                  '#getData.country#',
                  <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">,
                  'web',
                  'web',
                  '#Left(getData.company, 84)#'
                 )
                SELECT @@IDENTITY AS NewGPPID
            </cfquery> 
         
                <cfquery datasource="gppdata"  >
            INSERT INTO  tblIndOptions_WEB (
            	IND_RecID,
                 chkW,
                 chkLA,
                 chkME,
                 chkE,
                 chkAF,
                 chkA,
                 chkSAENews,
                 chkMedNews,
                 chkEAENews, 
                 chkWAENews,
                 chkOzNews,
                 chkCaNews,
                 chkNOCNews,
                 chkPCapNews,
                 chkWebIntWo,
                 chkWebIntAf,
                 chkWebIntNaf,
                 chkWebIntMe,
                 chkWebIntAs,
                 chkWebIntLa,
                 chkWebIntNa,
                 chkWebIntEu,
                 chkWebIntGen,
                 chkWebIntSAE,
                 chkWebIntAdvertising,
                 chkWebIntEAf,
				 chkWebIntWAf
                 	)
                 
           VALUES (
           		 #getnew.NewGPPID#,
                 <cfif getData.no_email EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.PL EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.PAr EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.PE EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.PA EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.PAs EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.SAENews EQ 0>1<cfelse>0</cfif>,
                 
                 <cfif getData.PA EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.PA EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.PA EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.PAs EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.PL EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.no_email EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.no_email EQ 0>1<cfelse>0</cfif>,

                 <cfif getData.IntWo EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.IntAf EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.IntNAf EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.IntME EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.IntAs EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.IntLa EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.IntNAm EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.IntEu EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.IntGen EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.IntSAE EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.advertising  EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.IntAf EQ 0>1<cfelse>0</cfif>,
                 <cfif getData.IntAf EQ 0>1<cfelse>0</cfif>
                  
           
		)

            </cfquery>

<!---<cfquery datasource="#dsnP21#" name="addMark" >UPDATE email_news SET dataMoved   = 1  WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#getData.id#"></cfquery>--->


    <cfquery datasource="gppdata" name="getMatch" >
        SELECT IngIndividual_ID 
        FROM tblIndividual 
        WHERE email_web ='%#getData.strEmail#%'  OR strEmail =  '#getData.strEmail#'  OR strSecretary_Email =  '#getData.strEmail#'   OR strEmail_Alt =  '#getData.strEmail#'  
        </cfquery>


        		<cfquery datasource="gppdata"  >
					UPDATE tblIndividual_WEB  
                    SET flagIt = 1 
					WHERE    RecID = <cfqueryparam cfsqltype="cf_sql_integer" value="#getData.RecID#" >
				</cfquery>

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tblIndOptions_WEB]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tblIndOptions_WEB]
GO

CREATE TABLE [dbo].[tblIndOptions_WEB] (
	[TBLIDX] [int] IDENTITY (1, 1) NOT NULL ,
	[IND_RecID] [int] NULL ,
	[lngIndividual_ID] [int] NULL ,
	[chkRA] [bit] NULL ,
	[intRA] [int] NULL ,
	[chkJournal] [bit] NULL ,
	[chkAPJ] [bit] NULL ,
	[chkLPJ] [bit] NULL ,
	[chkASPJ] [bit] NULL ,
	[chkP21] [bit] NULL ,
	[chkW] [bit] NULL ,
	[chkNA] [bit] NULL ,
	[chkLA] [bit] NULL ,
	[chkME] [bit] NULL ,
	[chkE] [bit] NULL ,
	[chkAF] [bit] NULL ,
	[chkA] [bit] NULL ,
	[chkSAENews] [bit] NULL ,
	[chkGPI] [bit] NULL ,
	[chkSE] [bit] NULL ,
	[chkSEW] [bit] NULL ,
	[chkSENA] [bit] NULL ,
	[chkSELA] [bit] NULL ,
	[chkSEME] [bit] NULL ,
	[chkSEE] [bit] NULL ,
	[chkSEAF] [bit] NULL ,
	[chkSEA] [bit] NULL ,
	[chkRANew] [bit] NULL ,
	[chkSMag] [bit] NULL ,
	[ChkRecAlerts] [bit] NULL ,
	[chkWebIntWo] [bit] NULL ,
	[chkWebIntAf] [bit] NULL ,
	[chkWebIntNaf] [bit] NULL ,
	[chkWebIntMe] [bit] NULL ,
	[chkWebIntAs] [bit] NULL ,
	[chkWebIntLa] [bit] NULL ,
	[chkWebIntNa] [bit] NULL ,
	[chkWebIntEu] [bit] NULL ,
	[chkWebIntGen] [bit] NULL ,
	[chkWebIntAdvertising] [bit] NULL ,
	[chkWebIntSAE] [bit] NULL ,
	[chkSEEAF] [bit] NULL ,
	[chkSEWA] [bit] NULL ,
	[chkWebIntEAf] [bit] NULL ,
	[chkWebIntWAf] [bit] NULL ,
	[chkCaNews] [bit] NULL ,
	[chkOzNews] [bit] NULL ,
	[chkMedNews] [bit] NULL ,
	[chkEAENews] [bit] NULL ,
	[chkWAENews] [bit] NULL ,
	[chkNOCNews] [bit] NULL ,
	[chkPCapNews] [bit] NULL 
) ON [PRIMARY]
GO


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
	

	 = 0,
	 = 0,
	 = 0,
	 = 0,
	 = 0,
	 = 0,
	SAENews, PE, PAr, PL, PAs, PA, no_email  name, surname,  position, phone, fax, emailAddr, address, postal, city, citycode,  country, company, 
	
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
	
	                
[RecID] [int] IDENTITY (1, 1) NOT NULL ,
	[IngIndividual_ID] [int] NULL ,
	[lngCompany_ID] [int] NULL ,
	[Title] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strFirst_Name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strSurname] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[intConfirmed] [smallint] NULL ,
	[lngSource_Code_ID] [int] NULL ,
	[strDesignation] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[BPA_Designation] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strPersonal_Info] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strPhSwitchboard_Code] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strPhSwitchboard_No] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strPhDirect_Code] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strPhDirect_No] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strPhAlt1_Code] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strPhAlt1_No] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strPhAlt2_Code] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strPhAlt2_No] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strFaxSwitchboard_Code] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strFaxSwitchBoard_No] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strFaxDirect_Code] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strFaxDirect_No] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strFaxAlt1_Code] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strFaxAlt1_No] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strFaxAlt2_Code] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strFaxAlt2_No] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strMobile_No] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strEmail] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strSecretary_Email] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strEmail_Alt] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strStreet_Adress] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strPostal_Adress] [nvarchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strCity] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[intCode] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Addr_State] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CountryName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strWebSite] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lngFlag_ID] [int] NULL ,
	[dtmUpdated] [datetime] NULL ,
	[chkCore_Client] [bit] NULL ,
	[chkClient_Check] [bit] NULL ,
	[dtmCaptured] [datetime] NULL ,
	[chkW] [bit] NULL ,
	[chkNA] [bit] NULL ,
	[chkL] [bit] NULL ,
	[chkME] [bit] NULL ,
	[chkE] [bit] NULL ,
	[chkAF] [bit] NULL ,
	[chkA] [bit] NULL ,
	[chkAU] [bit] NULL ,
	[chkMag] [bit] NULL ,
	[chSAE] [bit] NULL ,
	[chkRecAlerts] [bit] NULL ,
	[chkNoRegion] [bit] NULL ,
	[chkExploration] [bit] NULL ,
	[chkRefining] [bit] NULL ,
	[chkPower] [bit] NULL ,
	[chkNoInterest] [bit] NULL ,
	[txtGeneral1] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[txtGeneral2] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[chkMD] [bit] NULL ,
	[chkMail] [bit] NULL ,
	[chkFax] [bit] NULL ,
	[chkFaxSelect] [bit] NULL ,
	[FaxOut] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[chkEmail] [bit] NULL ,
	[lngConference_ID] [int] NULL ,
	[chkBlocked] [bit] NULL ,
	[lngTempConf] [int] NULL ,
	[STATUS] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ARCHNO] [int] NULL ,
	[DateUPDNum] [int] NULL ,
	[DateCAPNum] [int] NULL ,
	[UpdBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CapBy] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[chkGas] [bit] NULL ,
	[PAMemberEndDate] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PAMemberEndDateNum] [int] NULL ,
	[PAMemberType] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strIndSource] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[strSecretary_Email2] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SecretaryName1] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SecretaryName2] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FinanceName] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FinanceEmail] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ChkFaxDirect] [bit] NULL ,
	[ChkFaxAlt1] [bit] NULL ,
	[ChckFaxAlt2] [bit] NULL ,
	[ChkEMailAlt] [bit] NULL ,
	[ChkEMailSec1] [bit] NULL ,
	[ChkEMailSec2] [bit] NULL ,
	[ChkEMailFin] [bit] NULL ,
	[IND_MealPREF] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[IND_WebFlag] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[lngOffice_ID] [int] NULL ,
	[lngTitle_ID] [int] NULL ,
	[lngDesignation_ID] [int] NULL ,
	[Archive_Reason] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[password] [nvarchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[chkRenBio] [bit] NULL ,
	[chkWA] [bit] NULL ,
	[chkEAF] [bit] NULL ,
	[company_web] [nvarchar] (85)

--->