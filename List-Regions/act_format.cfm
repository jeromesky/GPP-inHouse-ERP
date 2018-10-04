<cfset counter = 1 >
<CFSET fieldcount = 0 >

<cfquery datasource="#gpp#" name="get">
	SELECT distinct
        	 [Title]
              ,[name]
              ,[surname]
              ,[company]
              ,[possition]
              ,[email]
              ,[countryName] AS country
              ,[address]
              ,[city]
              ,[zip]
              ,[userID]
        FROM 
        	[Temp_report_regions] 
        WHERE 
        	areaID IN (#form.areaID#)  
        <cfif parameterexists(form.chkMail)>
        	AND chkMail <> 1
        </cfif>
        <cfif parameterexists(form.chkPrioPost)>
        	AND chkPrioPost <> 1
       </cfif>
       <cfif parameterexists(form.chkSecPost)>
        	AND chkSecPost <> 1
       </cfif>  
        AND userID not in (
			SELECT DISTINCT [userID] FROM [CRM_Reports_mailing] WHERE areaID IN (#form.areaID#) 
		)   
		ORDER BY 
        	company
</cfquery>

<cfif form.format EQ "excel">
	<CFHEADER NAME="Content-Disposition" VALUE="inline; filename=Regions-W-L_#dateformat(now(), "yyyy-mm-dd")#.xls">
		<CFCONTENT TYPE="application/vnd.msexcel">
			<cfinclude template="dsp_columns.cfm">
        </CFCONTENT>
  
<cfelseif form.format EQ "pdf">
	
    <cfdocument format="pdf" pagetype="A4" marginbottom="0.4" margintop="0.85" marginleft="0.01" marginright="0.01">
		<cfdocumentsection>
			<cfinclude template="dsp_columns.cfm">
		</cfdocumentsection>
	</cfdocument>
       
<cfelseif form.format EQ "screan">
		<cfinclude template="dsp_columns.cfm">
</cfif>

<!--- (chkL = 1 OR chkW = 1 ) AND
(chkAF = 1 OR chkMag = 1 OR chSAE = 1 OR chkEAF = 1 OR chkWA = 1 ) AND 
(chkSecPost = 1 OR chkSecPost IS NULL) AND 
(chkPrioPost = 1 OR chkPrioPost IS NULL
AND
(status = 'C' )--->