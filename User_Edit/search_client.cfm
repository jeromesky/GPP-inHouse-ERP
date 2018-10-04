<cfinclude template="../application.cfm">

<cfparam name="form.name" default="">
<cfparam name="form.surname" default="">
<cfparam name="form.company" default="">
<cfparam name="form.stremail" default="">
<cfparam name="form.InvoiceNo_LNK" default="">
<cfparam name="form.status" default="">
<cfparam name="form.InvPDBankNumber" default="">

<cfparam name="form.country" default="">
<cfparam name="form.prepercentName" default="%">
<cfparam name="form.prepercentSname" default="%">
<cfparam name="form.prepercentComp" default="%">
<cfparam name="form.prepercentEmail" default="%">
<cfparam name="form.format" default="screen">

<cfif form.name EQ "" AND form.surname EQ "" AND form.company EQ "" AND form.stremail EQ "" AND form.InvoiceNo_LNK EQ "" AND form.InvPDBankNumber EQ "" AND form.searchUserCountryID EQ 0 >
	<h1>No data to Search</h1>
	<cfabort>
</cfif>

<cfif trim(form.InvoiceNo_LNK) NEQ "" OR trim(form.InvPDBankNumber) NEQ "">

<cfquery datasource="#gpp#" name="get">
	SELECT 
      id,  
      title, 
      name, 
      surname, 
      position, 
      company, 
      country, 
      city, 
      strEmail, 
      STATUS, 
      strSecretary_Email, 
      strEmail_Alt, 
      label,
      email_web,
      active
	FROM
		CRM_search_Client_Invoice_N
	WHERE
    	1 = 1
	<cfif form.InvoiceNo_LNK NEQ "">
    AND InvoiceNo_LNK = '#trim(Lcase(form.InvoiceNo_LNK))#'
    </cfif>
    
    <cfif form.InvPDBankNumber NEQ "">
    AND InvPDBankNumber = <cfqueryparam cfsqltype="cf_sql_char" value="#form.InvPDBankNumber#">
    </cfif>
	<!---<cfif form.name NEQ "">
	AND
		LOWER(LTRIM(RTRIM(name))) LIKE '#form.prepercentName##Trim(Lcase(form.name))#%'
	</cfif>
	<cfif form.surname NEQ "">
	AND
		LOWER(LTRIM(RTRIM(surname))) LIKE '#form.prepercentSname##Trim(Lcase(form.surname))#%' 
	</cfif>
	<cfif form.company NEQ "">
	AND
    	(
		LOWER(LTRIM(RTRIM(company))) LIKE '#form.prepercentComp##Trim(Lcase(form.company))#%' 
        OR 
        LOWER(LTRIM(RTRIM(label))) LIKE '#form.prepercentComp##Trim(Lcase(form.company))#%' 
        )
	</cfif>
	<cfif form.strEmail NEQ "">
	AND (  
      LOWER(LTRIM(RTRIM(strEmail))) LIKE '#form.prepercentEmail##Trim(Lcase(form.strEmail))#%' OR
      LOWER(LTRIM(RTRIM(strSecretary_Email))) LIKE '#form.prepercentEmail##Trim(Lcase(form.strEmail))#%' OR
      LOWER(LTRIM(RTRIM(strEmail_Alt))) LIKE '#form.prepercentEmail##Trim(Lcase(form.strEmail))#%' OR
      LOWER(LTRIM(RTRIM(email_web))) LIKE '#form.prepercentEmail##Trim(Lcase(form.strEmail))#%' 
 		)
    </cfif>
	<cfif form.STATUS EQ "*">
		
	<cfelseif form.STATUS EQ "1">
		AND 
        	active IN ('1','5')
	<cfelseif form.STATUS EQ "0">
		AND 
        	active = 0
	</cfif>--->
	ORDER BY label, company, surname, name 
</cfquery>

<cfelse>

	<cfquery datasource="#gpp#" name="get" maxrows="10000">
      SELECT 
        id,  
        title, 
        name, 
        surname, 
        position, 
        company, 
        country, 
        city, 
        strEmail, 
        STATUS,
        strEmail_Alt,
        strSecretary_Email,
        label,
        countryID,
        active,
		ph_Code, 
        ph_No, 
        fax_Code,
        fax_No,
        postalAddress,
        CityNameEN,
        countryNameEN,
        streetAddress, 
        StreetCode
      FROM 
		CRM_Search_Client_N             
      WHERE 
      	1=1
	<cfif form.name NEQ "">
      AND
		LOWER(LTRIM(RTRIM(name))) LIKE '#form.prepercentName##Trim(Lcase(form.name))#%'
	</cfif>
	<cfif form.surname NEQ "">
      AND
		LOWER(LTRIM(RTRIM(surname))) LIKE '#form.prepercentSname##Trim(Lcase(form.surname))#%' 
	</cfif>
	<cfif form.company NEQ "">
      AND
		 (
		LOWER(LTRIM(RTRIM(company))) LIKE '#form.prepercentComp##Trim(Lcase(form.company))#%' 
        OR 
        LOWER(LTRIM(RTRIM(label))) LIKE '#form.prepercentComp##Trim(Lcase(form.company))#%' 
        )
	</cfif>
	<cfif form.strEmail NEQ "">
      AND (  
            LOWER(LTRIM(RTRIM(strEmail))) LIKE '#form.prepercentEmail##Trim(Lcase(form.strEmail))#%' OR
            LOWER(LTRIM(RTRIM(strSecretary_Email))) LIKE '#form.prepercentEmail##Trim(Lcase(form.strEmail))#%' OR
            LOWER(LTRIM(RTRIM(strEmail_Alt))) LIKE '#form.prepercentEmail##Trim(Lcase(form.strEmail))#%' 
			)
	</cfif>
	<cfif form.STATUS EQ "*">

	<cfelseif form.STATUS EQ "1">
		AND active IN ('1','5')
	<cfelseif form.STATUS EQ "0">
		AND active = 0
	</cfif>
	<cfif form.searchUserCountryID NEQ 0 AND form.searchUserCountryID NEQ "">
		AND
        	countryID = #form.searchUserCountryID#
	</cfif>
    
		<cfif form.name NEQ "" OR form.surname NEQ "" OR form.company NEQ "" OR form.strEmail NEQ "">
        UNION 

            SELECT 
                [id]
               ,'' 			AS title
               ,[name]
               ,'' 			AS surname
               ,[position]
               ,[company]
               ,[country]
               ,[city]
               ,[strEmail]    
              ,''			AS STATUS
              ,'' 			AS strEmail_Alt
              ,'' 			AS strSecretary_Email
              ,[company]			AS label
              ,'' 			AS countryID
              ,'10' 		AS active
              ,'' 			AS ph_Code
              ,'' 			AS ph_No
              ,''			AS fax_Code
              ,'' 			AS fax_No
              ,'' 			AS postalAddress
              ,'' 			AS CityNameEN
              ,'' 			AS countryNameEN
              ,'' 			AS streetAddress
              ,'' 			AS StreetCode
          FROM 
                [CRM_Search_Client_Con]
        WHERE	
            1=1
        <cfif form.name NEQ "">
          AND
             [name] LIKE '#form.prepercentName##Trim(Lcase(form.name))#%'
        </cfif>
        <cfif form.surname NEQ "">
          AND
             [name] LIKE '#form.prepercentSname##Trim(Lcase(form.surname))#%'
        </cfif>
         <cfif form.company NEQ "">
          AND
             [company] LIKE '#form.prepercentComp##Trim(Lcase(form.company))#%'
        </cfif>
        <cfif form.strEmail NEQ "">
          AND
             [strEmail] LIKE '#form.prepercentEmail##Trim(Lcase(form.strEmail))#%'
        </cfif>
    </cfif>
	ORDER BY 
        	company, surname, name;
</cfquery>

</cfif>

<cfif form.format EQ "pdf">
	<cfdocument format="pdf" pagetype="A4" marginbottom="0.4" margintop="0.85" marginleft="0.01" marginright="0.01">
		<cfdocumentsection>
			<cfinclude template="../List-Registered/dsp_searchReult.cfm">
        </cfdocumentsection>
	</cfdocument>
<cfelseif form.format EQ "excel">
    <CFHEADER NAME="Content-Disposition" VALUE="inline; filename=UserSearch_Result_#dateformat(now(), "yyyy-mm-dd")#.xls">
        <CFCONTENT TYPE="application/vnd.msexcel">
        <cfinclude template="../List-Registered/dsp_searchReultExcel.cfm">
    </CFCONTENT>     
<cfelse>
	<cfinclude template="../List-Registered/dsp_searchReult.cfm">
</cfif>