<cfinclude template="../Application.cfm" >
<cfquery datasource="InportData" name="get" >
SELECT * FROM Aussie 
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>
<body>
<cfoutput query="get">
  <cfquery datasource="#gppServer#" name="newRecord" >
    INSERT INTO tblIndividual_WEB (dtmCaptured)
    VALUES (<cfqueryparam cfsqltype="cf_sql_date" value="#now()#" >)
    SELECT @@IDENTiTY AS id
    </cfquery>
  <cfquery datasource="#gppServer#"  >
    UPDATE tblIndividual_WEB
    SET
	
    strFirst_Name	= <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(get.strFirst_Name, 100)#">,
	strSurname		= <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(get.strSurname, 100)#">,
    
			<cfif get.Title EQ "" >
                 Title 					= 'Mr',
            <cfelse>
                Title 					= <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(get.Title, 15)#">,
            </cfif>
    strDesignation	= <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(get.strDesignation, 100)#">,
    
    	<cfset  address = "#get.strStreet_Adress_1# #get.strStreet_Adress_2# #get.strStreet_Adress_3#" >
    
    strStreet_Adress = <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(address, 200)#">,
    Addr_State			= <cfqueryparam cfsqltype="cf_sql_varchar" value="#get.Addr_State#">,
    strMobile_No		= '#left(get.strMobile_No, 50)#',
    strEmail				= <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(get.strEmail, 50)#">,<!---	--->
    CountryName		= <cfqueryparam cfsqltype="cf_sql_varchar" value="#left(get.CountryName, 100)#">,
    strPhDirect_No	= <cfqueryparam cfsqltype="cf_sql_varchar" value="#Replace(left(get.strPhDirect_No, 50), "+61", "", "ALL")#">,
    strFaxDirect_No	= <cfqueryparam cfsqltype="cf_sql_varchar" value="#Replace(left(get.strFaxDirect_No, 50), "+61", "", "ALL")#">,
    
    intCode				= <cfqueryparam value="#get.intCode#">,
    strCity					= <cfqueryparam value="#get.strCity#">,
    strWebSite			= <cfqueryparam cfsqltype="cf_sql_varchar" value="#get.strWebSite#">,
    CapBy					= <cfqueryparam value="web">,
    
<cfif get.IngCompany_ID NEQ "">    
                    <cfquery datasource="#gppServer#" name="findCompany">
                        SELECT IngCompany_ID
                        FROM tblCompany
                        WHERE strCompany_Name LIKE '%#get.IngCompany_ID#%'
                        ORDER BY strCompany_Name
                    </cfquery>
  <cfif findCompany.recordcount EQ 1 >
    lngCompany_ID = #findCompany.IngCompany_ID#
    <cfelseif findCompany.recordcount GT 1 >
    lngCompany_ID = #findCompany.IngCompany_ID#
    <cfelseif findCompany.recordcount EQ 0 >
    <cfquery datasource="#gppServer#" name="addCompany">
                                    INSERT INTO tblCompany (strCompany_Name, chkW, chkNA, chkLA, chkME, chkE, chkAF, chkA)
                                    VALUES ('#trim(get.IngCompany_ID)#', 0, 0, 0, 0, 0, 0, 0)
                                    SELECT @@IDENTITY AS newCompanyID
                                    </cfquery>
    lngCompany_ID =
    <cfqueryparam cfsqltype="cf_sql_integer" value="#addCompany.newCompanyID#">
  </cfif>
  <cfelse>
  lngCompany_ID = 0
  </cfif>
  WHERE RecID  =
  <cfqueryparam cfsqltype="cf_sql_integer" value="#newRecord.id#" >
  </cfquery>
  <cfquery datasource="#gppServer#">    
    INSERT INTO tblIndOptions_WEB
    (
    	IND_RecID
        ,chkW
        ,chkAF
        ,chkSAENews
        ,chkWebIntWo
        ,chkWebIntAf
        ,chkWebIntGen
        ,chkWebIntAdvertising
        ,chkWebIntSAE
        ,chkWebIntEAf
        ,chkWebIntWAf
        ,chkEAENews
        ,chkWAENews
        ,chkNOCNews
        ,chkPCapNews
    	,chkNigerNews
      	,chkIndiaNews
      	,chkBrazilNews
      	,chkChinaNews
      	,chkRussiaNews
      	,chkAngolaNews
      	,chkPetEurasNews
      	,chkUSANews
      	,chkWebIntAus
      	,chkAtlanticNews
       	,chkWebIntAs
       )
    VALUES
    (
    	#newRecord.id#
        , 1
        , 0
        , 0
        , 1
        , 0
        , 1
        , 1
        , 1
        , 1
        , 1
        , 1
        , 0
        ,0
        , 0
        ,0
        ,0
        ,0
        ,0
        ,0
        ,0
        ,0
        ,1
        ,1
        ,1
        ,1
        )
 </cfquery>
</cfoutput>
</body>
</html>