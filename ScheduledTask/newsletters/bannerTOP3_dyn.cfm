<cfsilent>
<cfinclude template="../Application.cfm">
</cfsilent>

<cftry>

<cfquery name="showbannres" datasource="#dsnP21#">
    SELECT  TOP 3
             [link]
             ,[img]
             ,[id]
    FROM      
            [Newsletters_Get_Banneres] 
    WHERE 
            [newsletterID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.newsletterID#"> AND [bannerType] = <cfqueryparam cfsqltype="cf_sql_integer" value="11"> AND  [eventdate] > #now()#
    ORDER 
            BY bannerOrder
</cfquery>
<table border="0" cellpadding="0" cellspacing="0" height="62">
	<tr><cfoutput query="showbannres">
    	<td width="320" height="60" valign="middle"><a href="#showbannres.link#&nl=#url.newsletterID#<!---&bid=#showbannres.id#--->"><img src="http://www.petro21.com/advertising/#showbannres.img#" border="0" width="320" height="60"></a></td></cfoutput>
	</tr>
</table>
	
<cfcatch type="any">
    <cfmail to="#contactAdmin#" FROM="web@petro21.com" SUBJECT="error in 3 top banners page, #dateFormat(now(), "yy/mm/dd")#" type="html">
        <cfoutput>#cfcatch.Detail#</cfoutput>
    </cfmail>
</cfcatch>

</cftry>
<cfoutput><!-- <cfloop from="1" to="#hour(now())#" index="i">#hour(now())#<br></cfloop><cfloop from="1" to="#DayOfWeek(now())#" index="i">#DayOfWeek(now())#<br></cfloop> --></cfoutput>