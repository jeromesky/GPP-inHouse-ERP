<cfinclude template="../Application.cfm">
<cfsetting requesttimeout="10003">

<cftry>

	<!--- make the news for P21 this is for the DUNCAN VERSION --->
    <CFHTTP URL="http://www.petro21.com/my-office/ScheduledTask/newsletters/News_dyn.cfm?newsletterID=#url.newsletterID#" METHOD="Get"></CFHTTP>
    <!---
 	<cfif len(CFHTTP.FileContent) LT 512>
        <cfmail to="#contactAdmin#" from="web@petro21.com" subject="error no news items for newsletterID: #url.newsletterID#">
			error no news items
        </cfmail>
        <cfabort>
    </cfif> --->
    
    <CFFILE ACTION="WRITE" FILE="G:\websites\my-office\ScheduledTask\output\news_#url.newsletterID#.html" OUTPUT="#CFHTTP.FileContent#" NAMECONFLICT="overwrite">

    <!--- make the TOP 3 line BANNER --->
    <CFHTTP URL="http://www.petro21.com/my-office/ScheduledTask/newsletters/bannerTOP3_dyn.cfm?newsletterID=#url.newsletterID#" METHOD="Get"></CFHTTP>
    <CFFILE ACTION="WRITE" FILE="G:\websites\my-office\ScheduledTask\output\bannerTOP3_#url.newsletterID#.html" OUTPUT="#CFHTTP.FileContent#" NAMECONFLICT="overwrite">
    
    <!--- make the CORPORATE BANNER --->
    <CFHTTP URL="http://www.petro21.com/my-office/ScheduledTask/newsletters/bannerCorporate_dyn.cfm?newsletterID=#url.newsletterID#" METHOD="Get"></CFHTTP>
    <CFFILE ACTION="WRITE" FILE="G:\websites\my-office\ScheduledTask\output\bannerCorporate_#url.newsletterID#.html" OUTPUT="#CFHTTP.FileContent#" NAMECONFLICT="overwrite">
    
    <!--- make the LEFT BANNER --->
    <CFHTTP URL="http://www.petro21.com/my-office/ScheduledTask/newsletters/bannerLeft_dyn.cfm?newsletterID=#url.newsletterID#" METHOD="Get"></CFHTTP>
    <CFFILE ACTION="WRITE" FILE="G:\websites\my-office\ScheduledTask\output\bannerLeft_#url.newsletterID#.html" OUTPUT="#CFHTTP.FileContent#" NAMECONFLICT="overwrite">
    
    <!--- make the Sky BANNER --->
    <CFHTTP URL="http://www.petro21.com/my-office/ScheduledTask/newsletters/bannerSkyScraper_dyn.cfm?newsletterID=#url.newsletterID#" METHOD="Get"></CFHTTP>
    <CFFILE ACTION="WRITE" FILE="G:\websites\my-office\ScheduledTask\output\bannerSkyScraper_#url.newsletterID#.html" OUTPUT="#CFHTTP.FileContent#" NAMECONFLICT="overwrite">
    
    
    
    
    <cfquery datasource="#stats#" name="qryStats">
	INSERT INTO referrals (referralDate, referenceID, referralsType )
    VALUES
    	(
        <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
        ,<cfqueryparam cfsqltype="cf_sql_integer" value="#url.newsletterID#">
        ,<cfqueryparam cfsqltype="cf_sql_char" value="l">
        )
        SELECT @@IDENTITY AS refereID
	</cfquery>
    

	<cfscript>
        thread = CreateObject("java", "java.lang.Thread");
        thread.sleep(3000);
    </cfscript>
    
    <cflocation url="send_Newsletter.cfm?newsletterID=#url.newsletterID#&referID=#qryStats.refereID#">

<cfcatch type="any">
	<cfmail to="#contactAdmin#" FROM="web@petro21.com" SUBJECT="ping newsletter process page :#cgi.SCRIPT_NAME# step 1 of 1" type="html">
	error: <cfdump var="#cfcatch#">
	</cfmail>
</cfcatch>
</cftry>