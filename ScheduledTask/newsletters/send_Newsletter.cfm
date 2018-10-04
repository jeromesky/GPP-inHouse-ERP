<!--- this is the email script 8.3b --->
<cfinclude template="../Application.cfm">
<cfsetting requesttimeout="10003" showdebugoutput="yes">

<cfscript>
	function migrationLink(e,i){
        checksum.le = len(e);
        checksum.li = len(i);
        checksum.lexli = checksum.le * checksum.li; 
        checksum.link2mig = 'https://www.petro21.com/portal/?fa=migration&c=#checksum.lexli#&i=#i#&e=#e#';
		RETURN(checksum.link2mig);
	}
</cfscript>

<cfset counter = 0>
<cfset loopPause = 300>
<cfset loopPauseCounter = 1>

<cfquery name="get_newsletter" datasource="#gpp#" cachedwithin="#CreateTimeSpan(0,0,1,0)#">
    SELECT 
        newsletterID, 
        numrecordsDisplay,
        newsletterName, 
        <!---datafield, --->
        newsletterBanner AS banner
    FROM 
        newsletters 
    WHERE  
        newsletterID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.newsletterID#">
</cfquery>

<cfquery datasource="#gpp#" name="sendlist" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
<!---	SELECT DISTINCT
    	 [subscriptionID]
    	,[userID] 
        ,[userName] 
        ,[userSurname] 
        ,[userEmail]
        ,[newsletterid]
        ,[profileID]
	FROM 
    	[SITE_Newsletter_Subscriptions]
	WHERE 
    	[newsletterID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.newsletterID#">
	AND
		[dbo].[ValidEmail](userEmail) = 1
	AND
		[dbo].[EMAILVALIDATE](userEmail) = 1
    ORDER BY
    	[userEmail]--->
        
SELECT DISTINCT 
    	 [subscriptionID]
    	,[userID] 
        ,[userName] 
        ,[userSurname] 
        ,[userEmail]
        ,[newsletterid]
        ,[profileID]
	FROM 
    	[SITE_Newsletter_Subscriptions]
	WHERE 
    	[newsletterID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.newsletterID#">
	AND
		[dbo].[ValidEmail](userEmail) = 1
	AND
		[dbo].[EMAILVALIDATE](userEmail) = 1
    AND
    	profileID = 0
    ORDER BY
    	[userEmail]          

        
        
</cfquery>

<cfloop query="sendlist" startrow="1" endrow="#sendlist.RecordCount#"><!---#sendlist.RecordCount#--->

<!--- GIVE THE SCRIPT TIME TO SEND THE MAIL SO PAUSE FOR  SOME TIME ---->
<cfif sendlist.currentrow EQ (loopPause * loopPauseCounter)>

<!---    <cfmail to="#contactAdmin#" FROM="web@petro21.com" SUBJECT="ping #get_newsletter.newsletterName# sent: #sendlist.currentrow#">
        	userid: #sendlist.userID#
        	username: #sendlist.userName#
            usersurname: #sendlist.userSurname# 
        	useremail: #sendlist.userEmail#
       </cfmail>--->

      <cfscript>
          thread = CreateObject("java", "java.lang.Thread");
          thread.sleep(17124);
      </cfscript>
      <cfset loopPauseCounter = loopPauseCounter + 1>

</cfif>

<!--- #sendlist.RecordCount# #userName# #userSurname# <#lcase(userEmail)#> jerome@glopac-partners.com trim(RecipientEmailAddress) "#Lcase(trim(sendlist.userEmail))#"--->
<cfset RecipientEmailAddress = #Lcase(trim(sendlist.userEmail))#>

<cfif IsValid("email", #RecipientEmailAddress#) >

  <cftry>
    <cfif sendlist.profileID eq 0>
    	<cfset var.migrationBanner = #migrationLink(sendlist.userEmail, sendlist.userID)#>
    <cfelse>
    	<cfset var.migrationBanner = "">
    </cfif>

    <cfmail 
		to="#RecipientEmailAddress#" 
		from="news@global-pacific-partners.com" 
		subject="#get_newsletter.newsletterName# update" 
		type="html" 
		failto="bounce--#trim(sendlist.userID)#@global-pacific-partners.com"
        replyto="jerome@glopac.com"
		server="10.0.0.30"
		>
    <cfmailParam name="Reply-To" value="web@petro21.com">
    	<cfinclude template="template.cfm">
    </cfmail>
    <!---<cfoutput>#name# #userSurname# #lcase(sendlist.email)#<br /></cfoutput> CFCATCH ERROR AND SEND EMAIL NOTICE --->
   <cfcatch type="any">

      <cfmail to="#contactAdmin#" FROM="web@petro21.com" SUBJECT="error sending: #get_newsletter.newsletterName#, #dateFormat(now(), "yy/mm/dd")#" type="html">
      #RecipientEmailAddress#<br />
      <cfdump var="#cfcatch#">
      </cfmail>

      <!--- Something wrong with the email address lets flag it --->

      <cfquery datasource="#gpp#">
		UPDATE 
        	tblIndividual
        SET
			chkE = (chkE + 1) 
        WHERE  
        	IngIndividual_ID = <CFQUERYPARAM Value="#sendlist.userID#">
       </CFQUERY>

    </cfcatch>

  </cftry>
  <cfset counter= #incrementvalue(val(counter))#>

<cfelse>

  <!--- Something wrong with the email address lets flag it --->
  <CFQUERY datasource="#gpp#">
        UPDATE
        	tblIndividual
        SET
        	chkE = (chkE + 1) 
        WHERE 
        	IngIndividual_ID = <CFQUERYPARAM Value="#sendlist.userID#">
	</CFQUERY>

  <!--- send email with bad email format --->
</cfif>

</cfloop>

<!--- send out email NOTIFICATION, SUCCESFULL EMAIL OUT, of to us confirming mailout --->
<cfmail to="#contactAdmin#" FROM="web@petro21.com" SUBJECT="Sent: #get_newsletter.newsletterName# OK, on: #dateFormat(now(), "yy/mm/dd")# !">
News Sent OK! #counter#</cfmail>

<!--- ADD RECIEPIENT count to table --->
<cfquery datasource="#gpp#">
    UPDATE 
      newsletters
    SET 
      recipientCount = <cfqueryparam cfsqltype="cf_sql_integer" value="#counter#">
    WHERE  
      newsletterID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.newsletterID#">
</cfquery>

<!--- UPDATE this mailout--->
<cfquery datasource="#stats#">
    UPDATE referrals
    SET sentCount = <cfqueryparam cfsqltype="cf_sql_integer" value="#counter#">
    WHERE referralID = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.referID#">
</cfquery>