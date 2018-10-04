<cfinclude template="../Application.cfm">

  <cftry>

<cfquery name="showbannres" datasource="#dsnP21#">
         	SELECT  TOP 7
            		 [link]
                     ,[img]
                     ,[id]
			FROM      
            		[Newsletters_Get_Banneres] 
        	WHERE 
					[newsletterID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.newsletterID#"> AND [bannerType] = <cfqueryparam cfsqltype="cf_sql_integer" value="2"> AND  [eventdate] > #now()#
            ORDER 
            		BY bannerOrder
</cfquery>   
        
    <cfoutput query="showbannres">
    <cfif showbannres.link contains "mailto:babette@glopac-partners.com" OR showbannres.link contains "mailto:duncan@glopac-partners.com"  >
			<cfset bannerlink =  "#showbannres.link#" >
	<cfelseif showbannres.link contains "statsBanner.cfm" >
    	  <cfset bannerlink =  "#showbannres.link#&nl=#url.newsletterID#" >
    		
    <cfelse>
      		<cfset bannerlink =  "#showbannres.link#&nl=#url.newsletterID#&bid=#showbannres.id#" >
    </cfif>
    <div style="margin:0 0 1px 0;"><a href="#bannerlink#"><img src="http://www.petro21.com/advertising/#showbannres.img#" border="0" width="160" height="95"></a></div>
    </cfoutput>
    <cfcatch type="any">
      <cfmail to="#contactAdmin#" FROM="web@petro21.com" SUBJECT="error in external right page, #dateFormat(now(), "yy/mm/dd")#" type="html">
      <cfoutput>error message: #cfcatch.Message#<br>
      error Details: #cfcatch.Detail#<br>
      error in: #cfcatch.Type#<br>
      error Native: <cfif parameterexists(cfcatch.NativeErrorCode)>#cfcatch.NativeErrorCode#</cfif><br>
      SQL state: <cfif parameterexists(cfcatch.SQLState)>#cfcatch.SQLState#</cfif><br>
      Root cause: <cfif parameterexists(cfcatch.RootCause)>#cfcatch.RootCause#</cfif><br>
      #cgi.script_name#</cfoutput>
      </cfmail>
    </cfcatch>
  </cftry>
<cfoutput><!-- <cfloop from="1" to="#hour(now())#" index="i">#hour(now())#<br ></cfloop> <cfloop from="1" to="#DayOfWeek(now())#" index="i">#DayOfWeek(now())#<br ></cfloop> --></cfoutput>