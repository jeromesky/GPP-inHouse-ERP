<cfsilent>
<cfinclude template="../Application.cfm">

</cfsilent>
<cftry>

    
<cfquery name="showbannres" datasource="#dsnP21#">
         	SELECT  TOP 7
            		 [link]
                     ,[img]
                     ,[id]
			FROM      
            		[Newsletters_Get_Banneres] 
        	WHERE 
					[newsletterID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.newsletterID#"> AND [bannerType] = <cfqueryparam cfsqltype="cf_sql_integer" value="1"> AND  [eventdate] > #now()#
            ORDER 
            		BY bannerOrder
</cfquery>   
    
  	<cfoutput query="showbannres">
<div style="margin:0 0 1px 0;"><a href="#showbannres.link#&nl=#url.newsletterID#&bid=#showbannres.id#"><img src="http://www.petro21.com/advertising/#showbannres.img#" border="0" width="160" height="95"></a></div></cfoutput>

	<cfcatch type="any">
    	<cfmail to="#contactAdmin#" FROM="web@petro21.com" SUBJECT="error in leftGPP banners page, #dateFormat(now(), "yy/mm/dd")# " type="html">
    		<cfoutput>#cfcatch.Detail#</cfoutput>
    	</cfmail>
	</cfcatch>
</cftry>
<cfoutput ><!-- <cfloop from="1" to="#hour(now())#" index="i" >#hour(now())#<br ></cfloop> <cfloop from="1" to="#DayOfWeek(now())#" index="i" >#DayOfWeek(now())#<br ></cfloop> --></cfoutput>