<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<body>
<cffunction name="getEmailAddresses">
	<cfargument name="stringToParse" type="string" />
	<cfargument name="emailArray" type="array" default="#ArrayNew(1)#" />
		<cfif REFind("([a-zA-Z0-9_\.=-]+@[a-zA-Z0-9_\.-]+\.[[:alpha:]]{2,6})",stringToParse)>
			<cfset sLenPos=REFind("([a-zA-Z0-9_\.=-]+@[a-zA-Z0-9_\.-]+\.[[:alpha:]]{2,6})",stringToParse,1,true) />
			<cfset emailAddress = mid(stringToParse, sLenPos.pos[1], sLenPos.len[1]) />
			<cfset arrayAppend(emailArray, emailAddress)>
            <cfset stringToParse = Mid(stringToParse, sLenPos.pos[1] + sLenPos.len[1], len(stringToParse))>
			<cfif REFind("([a-zA-Z0-9_\.=-]+@[a-zA-Z0-9_\.-]+\.[[:alpha:]]{2,6})",stringToParse)>
				  <cfset emailArray = getEmailAddresses(stringToParse, emailArray)>
			</cfif>
			</cfif>
  <cfreturn emailArray />
</cffunction>
<cfset counter = 1 >
<cfset softBouce = 1 >
<cfset hardbounce = 1 >
<cfpop maxrows="500" server="mail.glopac.com" username="web" password="mm60860202" action="getAll" name="GetEmail" >

<cfloop query="GetEmail">
<cfif
	  GetEmail.Subject CONTAINS "Undelivered" or
      GetEmail.Subject CONTAINS "User unknown" or
      GetEmail.Subject CONTAINS "Returned Mail" or
      GetEmail.Subject CONTAINS "failure" or
      GetEmail.Subject CONTAINS "failed" or
	  GetEmail.body CONTAINS "not exist" or 
	  GetEmail.body CONTAINS "User unknown" or
	  GetEmail.Subject CONTAINS "Warning" 
      >

	        <cftry>
	  	<cfset hardbounce = hardbounce + 1 >
        <cfset emails = getEmailAddresses(#GetEmail.body#)>	
        <cfoutput>#emails[1]#, </cfoutput><br>
          <cfquery name="RemoveEmail" datasource="petro21">
                            UPDATE   email_news
                            SET 
                            PE= 1,
            PAr= 1,
            PL= 1,
            PAs= 1,
            PA= 1,
            no_email= 1,
            IntME= 1,
            IntWo= 1,
            IntAf= 1,
            IntAs= 1,
            IntGen= 1,
            IntNAm= 1,
            IntLa= 1,
            IntEu= 1,
            IntNAf= 1,
            advertising =1,
            removedByCheck =1 
                            WHERE emailAddr = '#emails[1]#'
                        </cfquery>
			<cfcatch>
      		</cfcatch>
      		</cftry>
	

</cfif>
<cfset counter = counter + 1 >

</cfloop>
<br /><br />
<cfoutput>#counter#,<br> SOFT BOINCER : #softBouce# <br>HARD BOUNCE: #hardbounce#</cfoutput>

</body>
</html>
email_bounce