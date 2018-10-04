<cfinclude template="../Application.cfm">
<!---<cfinclude template="../tools/checkVPN.cfm">--->
<cfsetting requesttimeout="10002"> 
<!--- check the VPN Connection --->
<cfparam name="getjob.ContactName" default="Global Pacific & Partners">

<cfif parameterexists(Session.staffName)>    
     <cfset logedInEmail = "; #Session.staffName#@glopac-partners.com">
<cfelse>
	<cfset logedInEmail = " ">
</cfif>

<cfset responceFormList = 0 >
<cfset counter= 0>
<cfset creteriaCount = 0>
<!--- SET DATABASE VIEW TO SEARCH ---->
<cfset vewToSearch = "SITE_Email_SendTo_RegionExclEvent" >
<cfset SenderContact =  "" >
<cfset regionOfInterest = 0 >
<cfset attachements = "" >
<cfset CollectBadEmail = "" >
<cfset loopPause = 5000>
<cfset loopPauseCounter = 1>

<CFQUERY DATASOURCE="#dsnP21#" name="getjob">
SELECT 
		[fileName]
      ,[domain_name]
      ,[ID]
      ,[datesend]
      ,[name]
      ,[namefROM]
      ,[EmailFrom]
      ,[subject]
      ,[tracking]
      ,[calendar]
      ,[interRestRegion]
      ,[contraJob_id]
      ,[eventid]
      ,[createFile]
      ,[company_id]
      ,[dateToSend]
      ,[country]
      ,[chkWebIntWo]
      ,[chkWebIntAf]
      ,[chkWebIntNaf]
      ,[chkWebIntSAE]
      ,[chkWebIntMe]
      ,[chkWebIntAs]
      ,[chkWebIntNa]
      ,[chkWebIntLa]
      ,[chkWebIntEu]
      ,[chkWebIntGen]
      ,[chkWebIntAdvertising]
      ,[template]
      ,[exactSearch]
      ,[delegate]
      ,[speaker]
      ,[guest]
      ,[moderator]
      ,[exhibitor]
      ,[press]
      ,[research]
      ,[sponsor]
      ,[operatorAttType]
      ,[content]
      ,[test]
      ,[displayDate]
      ,[flashnews]
      ,[conferenceExclude]
      ,[eventExact]
      ,[textmailSpeakers]
      ,[textmailfocus]
      ,[templateSize]
      ,[col1color]
      ,[col2color]
      ,[col3color]
      ,[textmailTitle]
      ,[textmailpricing]
      ,[textmailcombine]
      ,[textmailOverview]
      ,[textmailLogos]
      ,[timeToSend]
      ,[updated]
      ,[OnlyRegistered]
      ,[signature]
      ,[chkWebIntEA]
      ,[chkWebIntWa]
      ,[mailSent]
      ,[textmailDetails]
      ,[selectAllEmails]
      ,[chkWebIntAus]
      ,[DomainName]
      ,[CompanySearch]
      ,[CompanySearchExact]
      ,[ContactName]
      ,[email]
      ,[city]
      ,[tel]
      ,[possition]
      ,[username]
      ,[countryID]
      ,[areaID]
      ,[roleID]
FROM 
	SITE_Mailer_buildEmailTemplate
WHERE   
	id = <cfqueryparam  value="#form.emailid#">
</CFQUERY>

<!--- GET ATTACHEMENTS IF ANY --->
        <CFQUERY datasource="#dsnP21#" name="get_attachements">
                SELECT filename
                FROM  MailOut_attachment 
                WHERE emailid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.emailid#">  
        </cfquery>
    
<cfif get_attachements.recordcount GT 0 >
		<cfset attachements = valuelist(get_attachements.filename, ",")>
</cfif>

<cfset SenderContact = "#trim(getjob.username)#@#trim(getjob.domain_name)#">

<!--- SET EVENT 
        <cfquery datasource="#dsnP21#" name="geteventidGPP" > 
        SELECT *
        FROM SITE_Mailer_BuildEventInformation
        WHERE id = #getjob.eventid#
        </cfquery>
		<cfset selectEvent = #geteventidGPP.id_gpp# >----->

<!--- GET the id number of the conference  AND ADD OR REMOVE PEOPLE THAT ARE for the event  ---->
<cfset andLoop = 0 >
<cfset andLoopAttType = 0 >
<cfset unsubscribe = 1 >
<cfset isNotemail = 0 >
<cfset emailIsEmpty = 0 >

<!---<cftry >--->

<!--- Test to see if sending as an TEST email <script>
 alert("this is only Test")
 </script> --->
  <!--- sent emails  as TEst or to contract --->
<cfif getjob.test EQ 1 >  
      
                <CFQUERY DATASOURCE="#dsnP21#" name="sendlist">
                        SELECT *
                        FROM  SITE_Mailer_sentToContact
                        WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#getjob.company_id#">
                </CFQUERY>
	            <cfset testEmail = 1 >
                <cfset email = "#sendlist.email#">
      
<!--- SEND TO COMPANY SEARCH  
 alert("this is Only registered")
 </script>  --->
 <!--- sent emails to companies ---->
<cfelseif trim(getjob.CompanySearch) NEQ "">
				<CFQUERY datasource="#gpp#" name="sendlist">
				SELECT 		* 
                FROM 		
                		CRM_Individual_Company
                WHERE 
                		<cfif getjob.CompanySearchExact EQ 1 >
		                		company = '#getjob.CompanySearch#%'
                        <cfelse>
                        		company = <cfqueryparam value="#getjob.CompanySearch#">
                        </cfif>
                </CFQUERY>		

<!--- SEND TO ONLY PEOPLE REGISTERED TO EVENT  ---->
<cfelseif getjob.OnlyRegistered EQ 1 AND getjob.test NEQ 1 AND getjob.conferenceExclude NEQ 1 AND getjob.areaID EQ "" >

                <CFQUERY datasource="#gpp#" name="sendlist">
                SELECT 		* 
                FROM 		SITE_Mailer_SendTo_AttendingEvent
                WHERE 		EventID = #getjob.eventid# AND (
							<cfif getjob.sponsor EQ 1 ><cfif andLoopAttType NEQ 0 >OR chkSponsor = 1 <cfset andLoopAttType = 1 > <cfelse> chkSponsor = 1 <cfset andLoopAttType = 1 ></cfif></cfif>
                            <cfif getjob.research EQ 1 ><cfif andLoopAttType NEQ 0 >OR chkResearch = 1 <cfset andLoopAttType = 1 ><cfelse>  chkResearch = 1 <cfset andLoopAttType = 1 ></cfif></cfif>
                            <cfif getjob.press EQ 1 ><cfif andLoopAttType NEQ 0 >OR chkPress = 1 <cfset andLoopAttType = 1 ><cfelse> chkPress = 1 <cfset andLoopAttType = 1 ></cfif> </cfif>
                            <cfif getjob.exhibitor EQ 1 ><cfif andLoopAttType NEQ 0 >OR chkExhibitor = 1 <cfset andLoopAttType = 1 ><cfelse> chkExhibitor = 1 <cfset andLoopAttType = 1 ></cfif></cfif>
                                    <cfif getjob.moderator EQ 1 ><cfif andLoopAttType NEQ 0 >OR chkModerator = 1 <cfset andLoopAttType = 1 ><cfelse> chkModerator = 1 <cfset andLoopAttType = 1 ></cfif></cfif>
                                    <cfif getjob.guest EQ 1 ><cfif andLoopAttType NEQ 0 >OR chkGuest = 1 <cfset andLoopAttType = 1 ><cfelse> chkGuest = 1 <cfset andLoopAttType = 1 ></cfif></cfif>
                                    <cfif getjob.speaker EQ 1 ><cfif andLoopAttType NEQ 0 >OR chkSpeaker = 1 <cfset andLoopAttType = 1 ><cfelse>chkSpeaker = 1 <cfset andLoopAttType = 1 ></cfif> </cfif>
                                    <cfif getjob.delegate EQ 1 ><cfif andLoopAttType NEQ 0 >OR chkDelegate = 1 <cfset andLoopAttType = 1 ><cfelse>chkDelegate = 1 <cfset andLoopAttType = 1 ></cfif></cfif>
                                    )
                           <cfif getjob.mailsent EQ 1 >
                                    AND ( formsent IS NULL OR formsent = '' )
                           </cfif>
                </CFQUERY>

<cfelseif  getjob.OnlyRegistered EQ 0 AND getjob.test EQ 0 <!---AND getjob.areaID NEQ ""  getjob.countryID NEQ 0---> >

<!--- Query from database to collect users <script>
 alert("this is excluding registered")  getjob.conferenceExclude EQ 1 AND
 </script> --->

<!--- SEND TO REGION OF INTEREST --->
<CFQUERY datasource="#gpp#" name="sendlist">
SELECT 	 DISTINCT 
		name, 
        surname , 
		id,  
        email, 
        emailSecond, 
        emailSecretary, 
        password ,  
        email_web
FROM  	Temp_Mailer	<!---SITE_Email_SendTo_RegionExclEvent --->
WHERE 	
		1=1
        <cfif getjob.areaid NEQ "">
			AND (	 
				 areaID IN (#getjob.areaID#) 
                <cfset andLoop = 1 >
	<!---			AND deliveryFormat = 1  
        		AND areaActive			= 1 --->
               )
        </cfif>
                     <cfif getjob.countryID NEQ 0 >
						AND
						<!---		<cfif andLoop NEQ 0 >		AND </cfif> --->
                               	countryID IN ( #getjob.countryID# )  
                                <cfset andLoop = 1 >  
                               <!---country = '#getjob.country#'--->
					</cfif>
                    <cfif getjob.roleID NEQ 0 >
                    			<cfif andLoop NEQ 0 >		
                                    AND 
                               </cfif> 
                            roleID = <cfqueryparam cfsqltype="cf_sql_integer" value="#getjob.roleID#">
                    </cfif>
							<cfif getjob.conferenceExclude EQ 1 >
                                AND id NOT IN (	
                                SELECT 		id 
                                  FROM 	SITE_Mailer_SendTo_AttendingEvent
                                  WHERE EventID = #getjob.eventid# AND (
              <cfif getjob.sponsor EQ 1 ><cfif andLoopAttType NEQ 0 >OR chkSponsor = 1 <cfset andLoopAttType = 1 > <cfelse> chkSponsor = 1 <cfset andLoopAttType = 1 ></cfif></cfif>
              <cfif getjob.research EQ 1 ><cfif andLoopAttType NEQ 0 >OR chkResearch = 1 <cfset andLoopAttType = 1 ><cfelse> chkResearch = 1 <cfset andLoopAttType = 1 ></cfif></cfif>
             <cfif getjob.press EQ 1 ><cfif andLoopAttType NEQ 0 >OR chkPress = 1 <cfset andLoopAttType = 1 ><cfelse> chkPress = 1 <cfset andLoopAttType = 1 ></cfif></cfif>
             <cfif getjob.exhibitor EQ 1 ><cfif andLoopAttType NEQ 0 >OR chkExhibitor = 1 <cfset andLoopAttType = 1 ><cfelse> chkExhibitor = 1 <cfset andLoopAttType = 1 ></cfif></cfif>
             <cfif getjob.moderator EQ 1 ><cfif andLoopAttType NEQ 0 >OR chkModerator = 1 <cfset andLoopAttType = 1 ><cfelse> chkModerator = 1 <cfset andLoopAttType = 1 ></cfif> </cfif>
            <cfif getjob.guest EQ 1 ><cfif andLoopAttType NEQ 0 >OR chkGuest = 1 <cfset andLoopAttType = 1 ><cfelse> chkGuest = 1 <cfset andLoopAttType = 1 ></cfif></cfif>
            <cfif getjob.speaker EQ 1 ><cfif andLoopAttType NEQ 0 >OR chkSpeaker = 1 <cfset andLoopAttType = 1 ><cfelse>chkSpeaker = 1 <cfset andLoopAttType = 1 ></cfif></cfif>
            <cfif getjob.delegate EQ 1 ><cfif andLoopAttType NEQ 0 >OR chkDelegate = 1 <cfset andLoopAttType = 1 ><cfelse> chkDelegate = 1 <cfset andLoopAttType = 1 ></cfif></cfif>)
                               )<!--- #ValueList( registerUsers.id, ", " )# --->
            </cfif><!---ORDER BY surname desc--->
</CFQUERY>

</cfif>

<cfloop query="sendlist" > 

<!--- GIVE THE SCRIPT TIME TO SEND THE MAIL SO PAUSE FOR  SOME TIME --->
<cfif sendlist.currentrow EQ  (loopPause * loopPauseCounter)  >
      <cfscript>
          thread = CreateObject("java", "java.lang.Thread");
          thread.sleep(20000);
      </cfscript>
      <cfset loopPauseCounter = loopPauseCounter + 1>
</cfif>

<!--- cfset the email to send out with  --->
<cfif getjob.test NEQ 1 >
					<cfif sendlist.email NEQ "" AND sendlist.email_web NEQ "" >
                            <cfset email = sendlist.email  >
                    <cfelseif sendlist.email EQ "" AND sendlist.email_web NEQ "" >
                            <cfset email = sendlist.email_web  >
                    <cfelseif sendlist.email NEQ ""  >
							<cfset email = sendlist.email  >
                    <cfelseif sendlist.emailSecond NEQ "" >
                            <cfset email = sendlist.emailSecond  >
					<cfelseif sendlist.emailSecretary NEQ "" >
                    		<cfset email = sendlist.emailSecretary  >
					<cfelse >
                            <cfset email = "">
                    </cfif> 
</cfif>
      <!---jerome@glopac-partners.com #email#---> 
                   <cfset CCadress = "" >
                   <cfif getjob.selectAllEmails EQ 1  >
				   		<cfset CCadress = listappend(CCadress, #sendlist.emailSecond#, ";") > 
                        <cfset CCadress = listappend(CCadress, #sendlist.emailSecretary#, ";") >
                        <cfset CCadress = listappend(CCadress, #sendlist.email_web#, ";") >  
                        <cfset CCadress = listappend(CCadress, #sendlist.email_web#, ";") > 
                        <cfset CCadress = listToArray(CCadress, ";") >
                        <cfset CCadress = ArrayToList(CCadress, ";") >
                   </cfif>   

<cfset email = Lcase(trim(email))>
<cfif email NEQ "">

	<cftry>
    	<!---  isvalid ---->
		<cfif IsValid("email", #Lcase(email)#) >  
            
                   <cfmail to="#Lcase(email)#" cc="#CCadress#" failto="bounce--#trim(sendlist.id)#@petro21.com" from="#getjob.ContactName# <#SenderContact#>" subject="#getjob.subject#" type="html" >

                    	<cfif ListLen(attachements, ",") GT 0 >
                        	<cfloop index="i" list="#attachements#" delimiters=",">
                    				<cfmailparam file="G:\websites\my-office\Mailing\attachements\#i#" >
                            </cfloop>
                        </cfif>

                            <cfif getjob.template NEQ 0 >
                                    <cfinclude  template="../../petro21/post/templates/#getjob.filename#">
                                   <!--- <cfdump var="#sendlist#">--->
                            <cfelse>
                                    <div style="font-family:Arial, Helvetica, sans-serif; font-size:12px">
                                    <cfif getjob.textmailTitle EQ 1 ><cfinclude template="Text_Title.cfm"><br><br></cfif>
                                    <cfif getjob.textmailDetails EQ 1 ><cfinclude template="Text_MDeatils.cfm"><br></cfif>
                                    <cfif getjob.textmailOverview EQ 1 ><cfinclude template="Text_Overview.cfm"><br></cfif>
                                    <cfif getjob.textmailLogos EQ 1 ><cfinclude template="Text_logos.cfm"><br ></cfif>
                                    #getjob.content#<br><br><!--- #HTMLEditFormat(getjob.content)# --->
                                    <cfif getjob.textmailfocus EQ 1 >><cfinclude template="Text_Focus.cfm"></cfif>
                                    <cfif ListLen(getjob.flashnews) GT 0 ><cfinclude template="text_FlashNews.cfm" ></cfif>
                                    <cfif getjob.textmailSpeakers EQ 1 ><cfinclude template="Text_Speakers.cfm"></cfif>
                                    <cfif getjob.textmailpricing EQ 1 ><cfinclude template="Text_pricing.cfm"></cfif>
                                   <cfinclude template="Text_Signature.cfm">

                                     <!--- DISPLAY UNREGISTER LINK for TEST EMAIL --->
                                    <cfif parameterexists(testEmail) OR getjob.OnlyRegistered EQ 1 ><cfelse>
                                        <br />
                                        <div style="border:1px solid ##CCCCCC; background-color:##FAFAFA; padding:20px; margin:10px; font-family:Arial, Helvetica, sans-serif; font-size:10px; color:##999999">
                                         If you do not wish to receive information on Oil & Gas Events 
                                                <a href="http://petro21.com/post/dsp_communications.cfm?id=<cfoutput>#sendlist.id#</cfoutput>" >click here</a> to unsubscribe<br />
                                                Content and Design &copy;Copyright of Global Pacific & Partners 2012
                                        </div>
                                    </cfif>
                                    </div>
                            </cfif>
                            
                </cfmail>
                <cfset counter = counter + 1>
                                
        <cfelse><!---  /isvalid add the email addresss to the list of bad email in the DB ---->   
                                   
                <CFQUERY datasource="#gpp#"><!--- Something wrong with the email address lets flag it ----->
                UPDATE tblIndOptions
                SET
                mailOutFlag = (mailOutFlag + 1)  
                WHERE lngIndividual_ID = #sendlist.id#
                </CFQUERY>
						<cfset counter = counter - 1>
                        <cfset isNotemail = isNotemail + 1 >
                        <cfset CollectBadEmail = #listappend(CollectBadEmail , Lcase(email) ,",")# >
                
        </cfif><!--- end isvalid ---->   
	<cfcatch>
			<cfmail to="#contactAdmin#" FROM="web@glopac.com" SUBJECT="error sending:#getjob.subject#, #dateFormat(datenow, "yy/mm/dd")# " type="html">
            		CFCATCH ERROR BLOCK LOOP<br />user ID: #sendlist.id# <br> #lcase(email)# <br>#CFCATCH.Message# <br>#cfcatch.Detail#<br >#cgi.script_name#
                     <br>
 					SQL state: <cfif parameterexists(cfcatch.SQLState)>#cfcatch.SQLState#</cfif><br> 
 					Root cause: <cfif parameterexists(cfcatch.RootCause)>#cfcatch.RootCause#</cfif><br />
                    <cfdump var="#cgi#">
                 <cfdump var="#cfcatch#">
                  
            </cfmail>
			<CFQUERY datasource="#gpp#" > <!--- Something wrong with the email address lets flag it --->
			UPDATE  tblIndOptions
			SET
			mailOutFlag = (mailOutFlag + 1) 
			WHERE  lngIndividual_ID = #sendlist.id#
			</CFQUERY>
			<cfset counter = counter - 1>
			<cfset emailIsEmpty = emailIsEmpty + 1 >
	</cfcatch>
	</cftry>

</cfif>
</cfloop>

       <cfmail to="#contactAdmin# #logedInEmail#" FROM="web@glopac.com" SUBJECT="mail sent from system #dateFormat(datenow, "yy/mm/dd")#, #getjob.subject#" type="html">
        Email name: #getjob.name#<br/>
        Subject: #getjob.subject# <br />
        Sent emails OK! #counter# <br />
        Badly formed emails: #isNotemail# <br />
        Email field is empty: #emailIsEmpty#<br/>
        Sent out on Profile: #session.staffID# - #Session.staffName#<br>
       </cfmail>

<cfoutput>
     #counter#<br />
     badly formed emails: #isNotemail# <br />
     Email field is empty: #emailIsEmpty#
    <hr />
    from list of #sendlist.RecordCount#
    <br /><br />
    Badly formed emails: <br />
    <cfloop list="#CollectBadEmail#" delimiters="," index="i">
    #i#<br /></cfloop>
</cfoutput>

<!--- <cfoutput>#sendlist.recordcount# // #ValueList( registerUsers.id, ", " )#</cfoutput>--->
<!--- #sendlist.RecordCount#  startrow="1" startrow="1" endrow="1" endrow="#sendlist.RecordCount#"--->
<!---<cfoutput> <cfif sendlist.email NEQ ""> #sendlist.email#<cfelseif sendlist.emailsecond NEQ "">#sendlist.emailsecond#<cfelseif sendlist.email_web NEQ "" >#sendlist.email_web#<cfelseif sendlist.emailsecretary NEQ "">#sendlist.emailsecretary#</cfif> </cfoutput> <br>--->
<!--- Check  if there is an email to send with  <cfset email = Replace(Replace(email, ".", " ", "ALL"), ",", " ", "ALL")   >#Replace(Replace(trim(sendlist.name), ".", " ", "ALL"), ",", " ", "ALL")# # Replace(Replace(trim(sendlist.surname), ".", " ", "ALL"), ",", " ", "ALL")# ------>
               <!---<cfif getjob.selectAllEmails EQ 1  >
                     cc=" <cfif sendlist.emailSecond NEQ "" >; #sendlist.emailSecond#</cfif><cfif sendlist.emailSecretary NEQ "" >;#sendlist.emailSecretary#</cfif><cfif sendlist.email_web NEQ "" >;#sendlist.email_web#</cfif>"
				</cfif>--->
               		<!---to="#email#" 
                    failto="bounce--#trim(sendlist.id)#@petro21.com" 
                    from="#SenderContact#" 
                    subject="#getjob.subject#" 
                    type="html">   --->    
<!---    end email field is empty ----> 
<!--- HERE ADD FUNCTION TO MARK SENT EMAILS FROM ATTENDENCE FORM 
			<cfif getjob.mailsent EQ 1 >
            		<cfset responceFormList = listappend(responceFormList, sendlist.RegTable_id ) >
            </cfif>--->

        <!---<cfif getjob.chkWebIntWo EQ 1 ><cfif andLoop NEQ 0 >#OperatorInterest#  chkWebIntWo = 1<cfset andLoop = 1 ><cfelse>chkWebIntWo = 1 <cfset andLoop = 1 ></cfif></cfif>  
              <cfif getjob.chkWebIntAf EQ 1 ><cfif andLoop NEQ 0 >#OperatorInterest# chkWebIntAf = 1 <cfset andLoop = 1 ><cfelse>chkWebIntAf = 1 <cfset andLoop = 1 ></cfif></cfif>
             <cfif getjob.chkWebIntNaf EQ 1 ><cfif andLoop NEQ 0 >#OperatorInterest# chkWebIntNaf = 1<cfset andLoop = 1 ><cfelse>chkWebIntNaf = 1 <cfset andLoop = 1 ></cfif></cfif>
            <cfif getjob.chkWebIntMe EQ 1 ><cfif andLoop NEQ 0 >#OperatorInterest# chkWebIntMe = 1<cfset andLoop = 1 ><cfelse>chkWebIntMe = 1 <cfset andLoop = 1 ></cfif></cfif>
            <cfif getjob.chkWebIntAs EQ 1 ><cfif andLoop NEQ 0 >#OperatorInterest# chkWebIntAs = 1<cfset andLoop = 1 ><cfelse>chkWebIntAs = 1 <cfset andLoop = 1 ></cfif></cfif>
            <cfif getjob.chkWebIntNa EQ 1 ><cfif andLoop NEQ 0 >#OperatorInterest# chkWebIntNa = 1<cfset andLoop = 1 ><cfelse>chkWebIntNa = 1 <cfset andLoop = 1 ></cfif></cfif>
            <cfif getjob.chkWebIntLa EQ 1 ><cfif andLoop NEQ 0 >#OperatorInterest# chkWebIntLa = 1<cfset andLoop = 1 ><cfelse>chkWebIntLa = 1 <cfset andLoop = 1 ></cfif></cfif>
            <cfif getjob.chkWebIntEu EQ 1 ><cfif andLoop NEQ 0 >#OperatorInterest# chkWebIntEu = 1<cfset andLoop = 1 ><cfelse>chkWebIntEu = 1 <cfset andLoop = 1 ></cfif></cfif>
            <cfif getjob.chkWebIntGen EQ 1 ><cfif andLoop NEQ 0 >#OperatorInterest# chkWebIntGen = 1<cfset andLoop = 1 ><cfelse>chkWebIntGen = 1 <cfset andLoop = 1 ></cfif></cfif>
            <cfif getjob.chkWebIntSAE EQ 1 ><cfif andLoop NEQ 0 >#OperatorInterest# chkWebIntSAE = 1<cfset andLoop = 1 ><cfelse>chkWebIntSAE = 1 <cfset andLoop = 1 ></cfif></cfif>
           <cfif getjob.chkWebIntEA EQ 1 ><cfif andLoop NEQ 0 >#OperatorInterest# chkWebIntEAf = 1<cfset andLoop = 1 ><cfelse>chkWebIntEAf = 1 <cfset andLoop = 1 ></cfif></cfif>
           <cfif getjob.chkWebIntWa EQ 1 ><cfif andLoop NEQ 0 >#OperatorInterest# chkWebIntWAf = 1<cfset andLoop = 1 ><cfelse>chkWebIntWAf = 1 <cfset andLoop = 1 ></cfif></cfif>
                   <cfif getjob.chkWebIntAus EQ 1 ><cfif andLoop NEQ 0 >#OperatorInterest# chkWebIntAus = 1<cfset andLoop = 1 ><cfelse>chkWebIntAus = 1 <cfset andLoop = 1 ></cfif></cfif>--->
                    <!---<cfif getjob.chkWebIntAdvertising EQ 1 >AND chkWebIntAdvertising = 1</cfif>--->
<!---<cfcatch type="any">
    <cfmail to="#contactAdmin#" FROM="web@glopac.com" SUBJECT="error on sending mail" type="html">
                 error message: #cfcatch.Message# <br>
                error Details: #cfcatch.Detail# <br>
                 error in:  #cfcatch.Type# <br> 
                 error Native|:<cfif parameterexists(cfcatch.NativeErrorCode)> #cfcatch.NativeErrorCode#</cfif> <br>
                 SQL state:<cfif parameterexists(cfcatch.SQLState)>  #cfcatch.SQLState#</cfif><br> 
                 Root cause: <cfif parameterexists(cfcatch.RootCause)>#cfcatch.RootCause#</cfif><br> 
                 <br >#cgi.script_name# - - #CGI.PATH_INFO#<br> <br> 
                 <cfdump var="#cgi#">
                 <cfdump var="#cfcatch#">

     </cfmail>
 <hr>
 error in the code: Administrator contacted
</cfcatch>
</cftry>--->

<!---<cfif parameterexists(Session.staffName ) >    
    cc="#Session.staffName#@glopac-partners.com"
</cfif>--->
<!---   HERE is code for attachment<cfif getjob.filename neq ""><cfquery DATASOURCE="#dsnP21#" name="getfile">SELECT * FROM user_news_attache WHERE jobid = #getjob.id#</cfquery><cfloop query="getfile"><cfmailparam  file="G:\Websites\petro21\post\attachement\#trim(getfile.filename)#"></cfloop></cfif>--->

			<!--- ATTENDENCE FOR EMAIL HAS BEEN SENT, MARK ON DB
				<cfif getjob.mailsent EQ 1 >
                            <cfquery datasource="#gpp#"  >
                            UPDATE tblConference_Registration
                            SET formsent = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#" >
                            WHERE IngClient_Conf_ID IN (#responceFormList#) 
                            </cfquery>
                </cfif> ----->
				
                <!--- CHECH TO SEE IF REGION OF INTEREST  
<cfif 	getjob.chkWebIntWo EQ 1 OR  
		getjob.chkWebIntAf EQ 1 OR  
		getjob.chkWebIntNaf EQ 1 OR  
		getjob.chkWebIntMe EQ 1 OR 
		getjob.chkWebIntAs EQ 1 OR  
		getjob.chkWebIntNa EQ 1 OR  
		getjob.chkWebIntLa EQ 1 OR  
		getjob.chkWebIntEu EQ 1 OR  
		getjob.chkWebIntGen EQ 1 OR  
		getjob.chkWebIntSAE EQ 1  OR
		getjob.chkWebIntEA EQ 1  OR
		getjob.chkWebIntWa EQ  1 OR
		getjob.chkWebIntAus EQ 1  > 
        
  		<cfset regionOfInterest = 1 >
 </cfif> ------>
 <!---<cfelseif  getjob.countryID NEQ "" AND getjob.OnlyRegistered EQ 0 AND getjob.test EQ 0 AND getjob.areaID EQ ""   >

<!--- Query from database to collect users <script>
 alert("this is excluding registered")  getjob.conferenceExclude EQ 1 AND
 </script> --->

<!--- SEND TO REGION OF INTEREST AND REMOVE   registered users  TO EVENT --->
<CFQUERY datasource="#gpp#" name="sendlist"  >
SELECT 	 	
		name, 
        surname ,
         
		id,  
        email, 
        emailSecond, 
        emailSecretary,  
        password ,  
        email_web
FROM  		Temp_Mailer	<!---SITE_Email_SendTo_RegionExclEvent --->
WHERE 
		1=1
 								<cfif getjob.countryID NEQ 0>
                               AND countryID IN ( #getjob.countryID# )
                               	<cfset andLoop =1  >	</cfif>
									<cfif getjob.conferenceExclude EQ 1 >
                                    AND id NOT IN (	
                                                    SELECT 		id 
                                                    FROM 			SITE_Mailer_SendTo_AttendingEvent
                                                    WHERE 		EventID = #selectEvent# AND (
                                                    <cfif  getjob.sponsor EQ 1 ><cfif andLoopAttType NEQ 0 >#OperatorAttType# chkSponsor = 1 <cfset andLoopAttType = 1 > <cfelse> chkSponsor = 1 <cfset andLoopAttType = 1 ></cfif></cfif>
                                                    <cfif  getjob.research EQ 1 ><cfif andLoopAttType NEQ 0 >#OperatorAttType#  chkResearch = 1 <cfset andLoopAttType = 1 ><cfelse>  chkResearch = 1 <cfset andLoopAttType = 1 ></cfif></cfif>
                                                    <cfif  getjob.press EQ 1 ><cfif andLoopAttType NEQ 0 >#OperatorAttType#  chkPress = 1 <cfset andLoopAttType = 1 ><cfelse> chkPress = 1 <cfset andLoopAttType = 1 ></cfif> </cfif>
                                                    <cfif  getjob.exhibitor EQ 1 ><cfif andLoopAttType NEQ 0 >#OperatorAttType# chkExhibitor = 1 <cfset andLoopAttType = 1 ><cfelse> chkExhibitor = 1 <cfset andLoopAttType = 1 ></cfif></cfif>
                                                    <cfif  getjob.moderator EQ 1 ><cfif andLoopAttType NEQ 0 >#OperatorAttType# chkModerator = 1 <cfset andLoopAttType = 1 ><cfelse> chkModerator = 1 <cfset andLoopAttType = 1 ></cfif> </cfif>
                                                    <cfif  getjob.guest EQ 1 ><cfif andLoopAttType NEQ 0 >#OperatorAttType# chkGuest = 1 <cfset andLoopAttType = 1 ><cfelse>  chkGuest = 1 <cfset andLoopAttType = 1 ></cfif></cfif>
                                                    <cfif  getjob.speaker EQ 1 ><cfif andLoopAttType NEQ 0 >#OperatorAttType# chkSpeaker = 1 <cfset andLoopAttType = 1 ><cfelse>chkSpeaker = 1 <cfset andLoopAttType = 1 ></cfif> </cfif>
                                                    <cfif  getjob.delegate EQ 1 ><cfif andLoopAttType NEQ 0 >#OperatorAttType# chkDelegate = 1 <cfset andLoopAttType = 1 ><cfelse> chkDelegate = 1 <cfset andLoopAttType = 1 ></cfif>  </cfif>)
                                          ) </cfif>
                                    <cfif getjob.roleID NEQ 0>
                                            <cfif andLoop NEQ 0 >	 AND </cfif>  
                                            roleID = <cfqueryparam cfsqltype="cf_sql_integer" value="#getjob.roleID#">
                                    </cfif>
            <!---ORDER BY surname desc--->
</CFQUERY>--->

<!---<cfif 	getjob.sponsor EQ 1  OR
		getjob.research EQ 1  OR 
		getjob.press EQ 1  OR 
		getjob.exhibitor EQ 1  OR 
		getjob.moderator EQ 1  OR 
		getjob.guest EQ 1  OR 
		getjob.speaker EQ 1  OR 
		getjob.delegate EQ 1  >
        <!---<cfset vewToSearch = "VIEWEmailBlast">--->
</cfif>--->

<!--- set search cretiria type for egion --->
<!---<cfif getjob.exactSearch eq 1 >
		<cfset OperatorInterest = "AND" >
<cfelse>
		<cfset OperatorInterest = "OR" >
</cfif>
<!--- set search creteria type for attendence --->
<cfif getjob.operatorAttType eq 1 >
		<cfset OperatorAttType = "AND" >
<cfelse>
		<cfset OperatorAttType = "OR" >
</cfif>--->