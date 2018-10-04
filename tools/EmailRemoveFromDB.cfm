<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<body>
<cfset counter = 0 >
<cfset softBouce = 0 >
<cfset hardbounce = 0 >

<cfpop maxrows="1000" server="mail.glopac.com" username="web" password="mm60860202" action="getAll" name="GetEmail" >
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
      	<!--- Run the parser --->
		<cfset supIDtoRemove = ListGetAt(ListGetAt(getEmail.to,1,"@"),2,"--")>
        <cfoutput>	#supIDtoRemove#,</cfoutput>
     	<!--- Run query to unsubscribe person --->
	        <cftry>
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
                            WHERE id IN (<cfqueryparam value="#supIDtoRemove#" cfsqltype="cf_sql_integer">)
                        </cfquery>
			<cfcatch>
      		</cfcatch>
      		</cftry>
	
      <!--- Add the UUID to the list to delete --->
      <!---	<cfset idsToRemove = listAppend(idsToRemove, getEmail.uid)>
      	<cfoutput>#supIDtoRemove#</cfoutput> BAD<br />--->
	  	<cfset hardbounce = hardbounce + 1 >
      <cfcatch>
      <!--- Do stuf in here that has not got an return id, so lets get the address --->
      	<!---<cfset emails = getEmailAddresses(#GetEmail.body#)>	
        <cfoutput>#emails[1]#</cfoutput>--->
      </cfcatch>
      </cftry>

      <!--- Delete the delayed messages that are annoying --->
<!---<cfelseif
      GetEmail.Subject CONTAINS "Delay" or
      GetEmail.Subject CONTAINS "Delayed" or
      GetEmail.Subject CONTAINS "Mail Delivery Problem" or
	  GetEmail.Subject CONTAINS "Warning" or 
      GetEmail.Subject CONTAINS "Auto-Reply" or 
      GetEmail.Subject CONTAINS "automated"
      >
      <cfset idsToRemove = listAppend(idsToRemove, getEmail.uid)>
      			<cftry>
                <cfset supIDtoRemove = ListGetAt(ListGetAt(getEmail.to,1,"@"),2,"--")>
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
    removedByCheck =1 ,
                    FlagDelay = FlagDelay + 1
                    WHERE id = (<cfqueryparam value="#supIDtoRemove#" cfsqltype="cf_sql_integer">)
                	</cfquery>
                    
               <cfcatch>
<!---                     	<cfset emails = getEmailAddresses(#GetEmail.body#)>	
        				<cfoutput>#emails[1]#</cfoutput>--->
      		</cfcatch>
      		</cftry>
            <cfoutput>#supIDtoRemove#</cfoutput> SOFT BOUNCE<br />
            <cfset softBouce = softBouce +1 >
<cfelse>--->
     	 	<!---<cfmail from="#getemail.from#" to="jerome@glopac-partners.com" subject="#getemail.subject#">
     			 #getemail.textbody#
     		 </cfmail>--->
     		 <!--- Just Delete messages that are not bounce messages <cfset idsToRemove = "no">
             	
      			<cfset idsToRemove = listAppend(idsToRemove, getEmail.uid)>--->
</cfif>
<cfset counter = counter + 1 >

</cfloop>

<!--- Delete the messages --->

<cfloop list="idsToRemove" delimiters="," index="i" >
<cftry>
<cfpop server="mail.glopac.com" username="web" password="mm60860202" action="delete" uid="#i#">
<cfcatch>
</cfcatch>
</cftry>
</cfloop>

<!---
<br /><br />
<cfoutput>#counter#,<br> SOFT BOINCER : #softBouce# <br>HARD BOUCE: #hardbounce#<br /><br />
#idsToRemove#
</cfoutput>--->
</body>
</html>