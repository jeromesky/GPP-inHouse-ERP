<!--- this is the email script 2012P --->
<cfinclude template="../Application.cfm">
<cfsetting requesttimeout="10002">
<cfscript>
	counter = 0;
	loopPause = 2012;
	loopPauseCounter = 1;
</cfscript>

<cfquery name="get_newsletter" datasource="#gpp#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
    SELECT TOP 1
        newsletterID, 
        numrecordsDisplay,
        newsletterName, 
        newsletterBanner AS banner
    FROM 
        newsletters 
    WHERE  
        newsletterID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.newsletterID#">
</cfquery>

<cfquery datasource="#gpp#" name="sendlist" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
	SELECT DISTINCT 
    	[subscriptionID]
    	,[userID] 
        ,[userName] 
        ,[userSurname] 
        ,[userEmail]
        ,[newsletterid]
	FROM 
    	[SITE_ProfileSubs]
	WHERE 
    	[newsletterID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.newsletterID#">
    AND 
    	userID < 0 
    ORDER BY
    	[userEmail]
</cfquery>
<!---<cfdump var="#sendlist#">--->

<cfloop query="sendlist" startrow="1" endrow="#sendlist.RecordCount#">
<!---#sendlist.RecordCount#--->

<!--- GIVE THE SCRIPT TIME TO SEND THE MAIL SO PAUSE FOR SOME TIME --->
<cfif sendlist.currentrow EQ (loopPause * loopPauseCounter)>

      <cfscript>
          thread = CreateObject("java", "java.lang.Thread");
		  // rest for so long.....
          thread.sleep(21003);
		  loopPauseCounter = loopPauseCounter + 1;
      </cfscript>
      
</cfif>

<cfset RecipientEmailAddress = "#Lcase(trim(sendlist.userEmail))#">

<cfif IsValid("email", #RecipientEmailAddress#) >
  <cftry>
    
    <cfmail to="#RecipientEmailAddress#" from="news@petro21.com" subject="#get_newsletter.newsletterName#: #dateFormat(now(), "mmmm d, yyyy")#" type="html" 
    failto="bounce--#trim(sendlist.userID)#@petro21.com">
    <cfmailParam name="Reply-To" value="web@petro21.com">
    <cfinclude template="template.cfm">
    </cfmail>

   <cfcatch type="any">
      <cfmail to="#contactAdmin#" FROM="web@petro21.com" SUBJECT="error sending: #get_newsletter.newsletterName#, #dateFormat(now(), "yy/mm/dd")#" type="html">
      #RecipientEmailAddress#<br />
      <cfdump var="#cfcatch#">
      </cfmail>

      <!--- Something wrong with the email address lets flag it --->
      <cfquery datasource="#gpp#">
		UPDATE 
        	tblIndOptions
        SET
			mailOutFlag = (mailOutFlag + 1) 
        WHERE  
        	lngIndividual_ID = <CFQUERYPARAM Value="#sendlist.userID#">
       </CFQUERY>
       
    </cfcatch>
  </cftry>
  
  <cfset counter= #incrementvalue(val(counter))#>
<cfelse>
  
  <!--- Something wrong with the email address lets flag it --->
  <CFQUERY datasource="#gpp#">
        UPDATE
        	tblIndOptions
        SET
        	mailOutFlag = (mailOutFlag + 1) 
        WHERE 
        	lngIndividual_ID = <CFQUERYPARAM Value="#sendlist.userID#">
  </CFQUERY>
  <!--- send email with bad email format --->
</cfif>
</cfloop>

<!--- send out email for SUCCESFUL EMAIL OUT, as confirming --->
<cfmail to="#contactAdmin#" FROM="web@petro21.com" SUBJECT="Sent: #get_newsletter.newsletterName# OK, on: #dateFormat(now(), "yy/mm/dd")# P">
News Sent OK! #counter#
</cfmail>

<!--- UPDATE RECIEPIENT count --->
<cfquery datasource="#gpp#">
    UPDATE 
      newsletters
    SET 
      recipientCount = <cfqueryparam cfsqltype="cf_sql_integer" value="#counter#">
    WHERE  
      newsletterID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.newsletterID#">
</cfquery>