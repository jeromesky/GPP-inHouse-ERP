
<cfset indSec = 1>
	<cfquery datasource="#gpp#" name="get">
    SELECT *
    FROM
    	[CRM_Report_User_Country]
    WHERE 
	1=1
        AND
        status = 'c'
        <cfif parameterexists(form.countryID) AND form.countryID NEQ "">
        AND
    	[countryID] IN (#form.countryID#)
        </cfif>
        <cfif parameterexists(form.industrySector) AND form.industrySector NEQ "">
        AND
        (
        	<cfloop list="#form.industrySector#" delimiters="," index="i">
            	<cfif indSec NEQ 1>
                	OR
                </cfif>
                	#i# = 1
             <cfset indSec = indSec +1>
            </cfloop>	
        )
        </cfif>
<!---       AND
        roleID IN (1,2,3)---> 
        
       <!---  <cfif parameterexists(form.chkMail)></cfif> --->
        	AND
            	chkMail <> 1
<!---             AND 
             chkPrioPost = 
             AND
             chkSecPost =--->
        
    </cfquery>