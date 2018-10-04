<cfinclude template="../Application.cfm" >
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<body>

<cfquery datasource="#gppServer#" name="getDup">
SELECT  chkWebIntAf
FROM VIEWCountNL
WHERE chkWebIntAf = 1
</cfquery>
<cfoutput>#getDup.recordcount#</cfoutput>
<!---
<cfdump var="#getDup#">--->
</body>
</html>

<!---
<cfquery datasource="#gppServer#" name="getDup">
SELECT CountryName, COUNT(*)
FROM tblIndividual
WHERE STATUS = 'C'
GROUP BY CountryName HAVING COUNT(*) > 1
ORDER BY CountryName 
</cfquery>

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tblIndividual]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tblIndividual]
GO

CREATE TABLE [dbo].[tblIndividual] (
	
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
	[chkPrioPost] [bit] NULL ,
	[chkSecPost] [bit] NULL ,
	[username] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

--->