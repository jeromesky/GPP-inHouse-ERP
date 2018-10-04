<cfinclude template="../Application.cfm">

<cftry>

<cfquery name="showbannres" datasource="#dsnP21#">
         	SELECT  TOP 1
            		 [link]
                     ,[img]
                     ,[id]
			FROM      
            		[Newsletters_Get_Banneres] 
        	WHERE 
					[newsletterID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.newsletterID#"> AND [bannerType] = <cfqueryparam cfsqltype="cf_sql_integer" value="10"> AND  [eventdate] > #now()#
</cfquery>   

    <cfif showbannres.link contains "statsBanner.cfm">
    	<cfset bannerlink = "#showbannres.link#&nl=#url.newsletterID#">
	<cfelse>
      	<cfset bannerlink = "#showbannres.link#&nl=#url.newsletterID#&bid=#showbannres.id#">
    </cfif>
    <cfoutput query="showbannres">
<table width="960" border="0" cellspacing="0" cellpadding="0" height="64" bgcolor="##4a4a4a" style="font-family:Arial, Helvetica, sans-serif">
    <tr>
        <td width="160" align="center" style="padding:0 0 0 10px; color:##CCCCCC; font-size:11px">
            To Be  Newsletter Patron<br />
            Contact<br />
            <a href="mailto:info@glopac.com" style="padding:0 0 0 10px; color:##EEEEEE; font-size:11px">info@glopac.com</a>
        </td>
        <td width="640" valign="middle"><a href="#bannerlink#"><img src="http://www.petro21.com/advertising/#showbannres.img#" border="0" width="640" height="60"></a></td>
        <td width="160" align="center" style="padding:0 0 0 10px; color:##CCCCCC; font-size:11px">
            To Sponsor One of Our<br>
            Weekly Newsletters<br>
            <a href="http://www.petro21.com/research/advertising.cfm" style="color:##CCCCCC">Click Here</a>
        </td>
	</tr>
</table>
</cfoutput>

  <cfcatch type="any">
    <cfdump var="#cfcatch.Detail#">
    <cfmail to="#contactAdmin#" FROM="web@petro21.com" SUBJECT="error in corporate banner page, #dateFormat(now(), "yy/mm/dd")# " type="html">
    <cfdump var="#cfcatch.Detail#">
    </cfmail>
  </cfcatch>
</cftry>
<cfoutput><!-- <cfloop from="1" to="#hour(now())#" index="i">#hour(now())#<br ></cfloop> <cfloop from="1" to="#DayOfWeek(now())#" index="i">#DayOfWeek(now())#<br ></cfloop> --></cfoutput>