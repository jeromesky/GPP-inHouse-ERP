<cfinclude template="../Application.cfm">
<!--- get files --->
<cfquery datasource="#dsnP21#"   name="get">
SELECT * FROM welcomePack
Where eventid in (#url.eventid#)
</cfquery>
<!--- get details --->
<cfquery datasource="#dsnP21#"   name="order">
   SELECT * FROM Registrations
   Where id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
</cfquery>
<cfset newfiles = "" >
<cfloop query="get"><cfif right(get.filepath, 4) EQ ".cfm">
<!--- creat new name for the pdf --->
	
	<cfset newname = left(get.filepath,(len(get.filepath)-4)) & ".pdf" >
<!--- Create PDF on the FLY ---->
	<cfdocument format="pdf" filename="G:\websites\my-office\event_registrations\welcomePack\#newname#" overwrite="yes" margintop="0" marginbottom="0" marginleft="0" marginright="0" >
		<cfinclude template="welcomePack/#get.filepath#">
	</cfdocument>
	<cfset newfiles = newfiles & newname & "," >
</cfif></cfloop>
<!--- clean the newfile string --->
<cfset newfiles = Left(newfiles, (len(newfiles)-1)) >
 <CFmail
  	from="#contactfromPersonal#"
	to="#order.gemail#"	
	subject="Your Welcome Pack" type="html"	>


<!--- attache documents here ------------------>
<cfloop query="get" >
	<cfif right(get.filepath, 4) NEQ ".cfm">
		<cfmailparam  file="G:\websites\my-office\event_registrations\welcomePack\#get.filepath#">
	</cfif>
</cfloop>

<!--- AND HERE TO, attache documents here ------------------>
<cfloop list="#newfiles#" delimiters="," index="b">
	<cfmailparam  file="G:\websites\my-office\event_registrations\welcomePack\#b#">
</cfloop>

<!--- START BODU CONTENT ------------------>
<div style="font-family:Arial, Helvetica, sans-serif; font-size:12px">

Dear #order.name# #order.surname#<br /><br />


<!--- start BOOKS here -------->
<cfif ListFindNoCase(order.eventid , 301 , ",") OR ListFindNoCase(order.eventid , 315 , "," )  OR ListFindNoCase(order.eventid , 352 , "," ) AND ListLen(order.eventid , ",") EQ 1>
Please find your confirmation for 
			<cfloop list="#order.event#" index="i" delimiters=",">
   			<cfset IndexOfOccurrence=REFind("/", #i#)>
				<cfoutput>#Left(i, (IndexOfOccurrence-1))#, </cfoutput>
  			</cfloop>.<br />
An invoice and payment details will follow separately. Should payment have already been made, please only use the invoice for your records.
</cfif>
<!--- start events ----------------------------------------------------------->
<cfloop list="#order.event#" index="i">
   	<cfset IndexOf=REFind("/", #i#)>
					
					
<cfif #Right(i, (Len(i)- IndexOf))# eq "event" or #Right(i, (Len(i)- IndexOf))# eq "eb" >
						Please find your welcome letter for the up coming event <br />
		   					<cfloop list="#order.event#" index="i" delimiters=",">
   								<cfset IndexOf=REFind("/", #i#)>
								<cfoutput>#Left(i, (IndexOf-1))#, </cfoutput><br /><br />
  							</cfloop>
						together with a hotel booking form. An invoice and payment details will follow separately. Should payment have already been made, please only use the invoice for your records.  Attendance at the events is permitted once payment has been made in full prior or on-site, and Global Pacific & Partners reserve the right to decline entry to the conference in the case of non-payment.<br />	<br /><br />		
</cfif>
					
					
<cfif #Right(i, (Len(i)- IndexOf))# eq "DIN" >
						We confirm your place at our PetroAfricanus Dinner, and look forward to seeing you there.<br /><br />
                        
                        An invoice and payment details will follow separately. Should payment have already been made, please only use the invoice for your records.  Attendance at the dinner is permitted once payment has been made in full prior or on-site, and Global Pacific & Partners reserve the right to decline entry to the dinner in the case of non-payment.
                        <br /><br />
</cfif>

</cfloop>

We look forward to seeing you there,

Regards<br />
Jerry van Gessel<br />
Global Pacific & Partners<br /><br /><br />

<cfinclude template="../../petro21/htdocs/Components/signaturehtml.cfm">
</div>
</cfmail>
<CFmail
  	from="#contactFrom#"
	to="#contactRego#"
	subject="Welcome pack sent" >
	
	Welcome pack sent to #order.name# #order.surname#
</CFmail>

<cfquery datasource="#dsnP21#" >
SET ANSI_WARNINGS OFF
 
	UPDATE "Registrations"
	SET approved = '1'
	WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
SET ANSI_WARNINGS ON
</cfquery>
<!--- add users e-conference --->


		<CFQUERY datasource="#dsnP21#"  name="findit">
		select userid, EconfData from userinfo
		where userid =  <cfqueryparam cfsqltype="cf_sql_integer" value="#url.userid#">
		</cfquery>
		
<cfif findit.userid EQ "">
			<CFQUERY datasource="#dsnP21#" name="put">
			Insert into userinfo(userid, EconfData)
			values('#url.userid#','#order.eventid#')
			</cfquery>
	<cfelse>
			<cfset added = findit.EconfData & "," & url.eventid >	
			<CFQUERY datasource="#dsnP21#" name="put">
			UPDATE userinfo
			Set EconfData = '#findit.EconfData & "," & url.eventid#'
			Where userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.userid#">
			</cfquery>
	</cfif>	
<CFLOCATION URL="registration.cfm">