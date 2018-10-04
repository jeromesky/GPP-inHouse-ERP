<cfinclude template="../Application.cfm">
<cftry>
<cfquery name="get_event" DATASOURCE="#gpp#"  cachedWithin=#CreateTimeSpan(0,0,30,0)# >
   	SELECT groupby, YEAR(event_expire) AS event_year, parentID
	FROM tblAnnual_Conf
	WHERE  IngConference_ID = #getjob.eventid# <!---<cfqueryparam cfsqltype="cf_sql_integer" value="#getjob.eventid#" > --->
</cfquery>
<cfset  logos 			= ""  >	
<cfset  mainlogos 			= ""  >	

<cfquery name="get_group" DATASOURCE="#gpp#" cachedWithin=#CreateTimeSpan(0,0,30,0)# >
   	SELECT 
    		tblAnnual_Conf.webid AS id, 
            tblAnnual_Conf.IngConference_ID AS id_gpp,  
            tblAnnual_Conf.ColorD, 
            tblAnnual_Conf.ColorL, 
            tblAnnual_Conf.logos_supporter, 
            tblAnnual_Conf.supportedby,	
            tblAnnual_Conf.logo_CorpSponsor,	
            tblAnnual_Conf.logo_corpMembers,	
            tblAnnual_Conf.sponsor_gold,	
            tblAnnual_Conf.sponsor_platinum,	
            tblAnnual_Conf.sponsor_silver,	
            tblAnnual_Conf.sponsor_bronze, 
            tblAnnual_Conf.logo_Contributing,
            tblAnnual_Conf.sponsor_Airline,
            tblAnnual_Conf.sponsor_lead
	FROM tblAnnual_Conf
	WHERE
    	IngConference_ID = #get_event.parentID#  AND event_type = 'week'  <!---[groupby] = #get_event.groupby#  AND YEAR(event_expire)  = #get_event.event_year#  <cfqueryparam cfsqltype="cf_sql_integer" value="#get_event.groupby#" ><cfqueryparam cfsqltype="cf_sql_integer" value="#get_event.event_year#" >--->
</cfquery>

<!--- ValueList(get_group.supportedby,"," )  ---->
	
				<cfset  mainlogos 			= ListPrepend(mainlogos, ValueList(get_group.sponsor_platinum,"," ), ",")  >	
                <cfset  mainlogos 			= ListPrepend(mainlogos, ValueList(get_group.sponsor_gold,"," ), ",")  >	
                <cfset  mainlogos 			= ListPrepend(mainlogos, ValueList(get_group.sponsor_silver,"," ), ",")  >
                 <cfset  mainlogos 		= ListPrepend(mainlogos, ValueList(get_group.sponsor_bronze,"," ), ",")  >
				
				<cfset  logos 			= ListPrepend(logos, ValueList(get_group.sponsor_Airline,"," ), ",")  >	
				<cfset  logos 			= ListPrepend(logos, ValueList(get_group.logos_supporter,"," ), ",")  >		
				<cfset  logos 			= ListPrepend(logos, ValueList(get_group.supportedby,"," ), ",")  >	
                <cfset  logos 			= ListPrepend(logos, ValueList(get_group.logo_CorpSponsor,"," ), ",")  >
                <cfset  logos				= ListPrepend(logos, ValueList(get_group.logo_corpMembers,"," ), ",")  >	
                <cfset  logos 			= ListPrepend(logos, ValueList(get_group.logos_supporter,"," ), ",")  >		
                <cfset  logos 			= ListPrepend(logos, ValueList(get_group.logo_Contributing,"," ), ",")  >
                

<!---<cfloop query="get_group">
				<cfset  logos 			= ListPrepend(logos, supportedby, ",")  >	
                <cfset  logos 			= ListPrepend(logos, logo_CorpSponsor, ",")  >
                <cfset  logos				= ListPrepend(logos, logo_corpMembers, ",")  >	
                <cfset  logos 			= ListPrepend(logos, logos_supporter, ",")  >		
                <cfset  logos 			= ListPrepend(logos, sponsor_bronze, ",")  >
                <cfset  logos 			= ListPrepend(logos, sponsor_silver, ",")  >
                <cfset  logos 			= ListPrepend(logos, sponsor_gold, ",")  >	
                <cfset  logos 			= ListPrepend(logos, sponsor_platinum, ",")  >	
                <cfset  logos 			= ListPrepend(logos, logo_Contributing, ",")  >	
</cfloop> - --->
<cfset  mainlogos 			= ListToArray(mainlogos, ",")  >	
<cfset  mainlogos 			= ArrayToList(mainlogos, ",")  >	

<cfset  logos 			= ListToArray(logos, ",")  >	
<cfset  logos 			= ArrayToList(logos, ",")  >	
<cfoutput>


<cfif get_group.sponsor_lead NEQ "" >
            <cfquery datasource="#dsnP21#" name="getLeadLogo" cachedWithin="#CreateTimeSpan(0,0,30,0)#" >
                SELECT logofile, link
                FROM logos
                WHERE id = #get_group.sponsor_lead# <!---<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#mainlogos#" >--->
            </cfquery>
            
            <cfif getLeadLogo.recordcount GT 0 >
                    <h3 style="color: rgb(255, 0, 0);">Lead Sponsors</h3>
                    <cfloop query="getLeadLogo">
                    <a href="#getLeadLogo.link#"><img  src="http://www.petro21.com/_files/business/#trim(getLeadLogo.logofile)#"   border="0"  width="105" height="45" hspace="4" vspace="4"  /></a>
                    </cfloop> 
                    <br>
            </cfif>
</cfif>


<cfif ListLen(mainlogos, ",") GTE 1 >
            <cfquery datasource="#dsnP21#" name="getMainLogo" cachedWithin="#CreateTimeSpan(0,0,30,0)#" >
                SELECT logofile, link
                FROM logos
                WHERE id IN (#mainlogos#) <!---<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#mainlogos#" >--->
            </cfquery>
            
            <h3 style="color: rgb(255, 0, 0);">Main Sponsors</h3>
            <cfloop query="getMainLogo">
            <a href="#getMainLogo.link#"><img  src="http://www.petro21.com/_files/business/#trim(logofile)#"   border="0"  width="100" height="41" hspace="4" vspace="4"  /></a>
            </cfloop> 

</cfif>
<cfif ListLen(logos, ",") GTE 1 >

            <cfquery datasource="#dsnP21#" name="getLogo" cachedWithin="#CreateTimeSpan(0,0,30,0)#" >
                SELECT logofile, link
                FROM logos
                WHERE id IN ( #logos# ) <!---<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#logos#" >--->
            </cfquery>
            <br >
             <h3 style="color: rgb(255, 0, 0);">Partners & Associates</h3>
            <cfloop query="getLogo">
            <a href="#getLogo.link#"><img  src="http://www.petro21.com/_files/business/#trim(logofile)#"   border="0"  width="80" height="33" hspace="4" vspace="4"  /></a>
            <!---src="cid:#trim(logofile)#"<cfmailparam file="http://www.petro21.com/_files/business/#trim(logofile)#"  contentid="#trim(logofile)#" disposition="inline" />--->
            </cfloop> 
            
</cfif>

</cfoutput>
<cfcatch type="any">
	<cfmail to="#contactAdmin#" FROM="web@glopac.com" SUBJECT="error sending on :#cgi.script_name#" type="html"><cfdump var="#CFCATCH#" >user ID: <!---#sendlist.id# <br> #lcase(email)# ---><br>#CFCATCH.Message# <br>#cfcatch.Detail#<br >#cgi.script_name#</cfmail>
</cfcatch>
</cftry>