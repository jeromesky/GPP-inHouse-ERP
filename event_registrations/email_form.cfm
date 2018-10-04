<cfinclude template="../Application.cfm">
<cfquery datasource="#dsnP21#" name="getuser">
        SELECT 
            id, title, name, surname, event, gemail, company, hposition, address, city, zip, country, tel, fax, payment_amount_GBP, eventid 
        FROM 
            registrations 
        WHERE 
            id = #url.id#
</cfquery>

<cfquery datasource="#dsnP21#" name="place">
		SELECT 
        	events.event_name, events.event_date, events.event_loc_hotel, events.event_loc_city, events.event_loc_country, hotels.hotelname
        FROM 
        	events
        LEFT JOIN hotels
        ON   events.hotel = hotels.id
        	
		WHERE 
        	events.id IN (#getuser.eventid#)
</cfquery>	

  <cfmail
	  to="#getuser.gemail#" 
  	  from="Petro21.com <#contactfromPersonal#>"
	  subject="Registration on Petro21.com: #dateFormat(datenow, "mmmm d, yyyy")#"
	  type="html"	  >
  <cfmailParam name="Reply-To" value="#contactfromPersonal#?subject=Re:">
<!---  <cfmailParam name="X-Priority" value="1">--->
<cfoutput>Dear #getuser.title# #Ucase(getuser.name)# #Ucase(getuser.surname)#,</cfoutput>
			
			<p>This email is sent out by Petro21 website automatically, after you attempted to register for the following:</p>
			<!---<b><cfloop list="#getuser.event#" index="i"><cfoutput><cfset IndexOfOccurrence=REFind("/", #i#)>#Left(i, (IndexOfOccurrence-1))#<br /> </cfoutput></cfloop></b>--->



<cfloop query="place"><cfoutput>
<b>#place.event_name#,</b> #place.event_date#, #place.hotelname#, #place.event_loc_city#, #place.event_loc_country#	<br />	
</cfoutput></cfloop>
<br />			 
<b>Registration Fee</b>: £<cfoutput>#getuser.payment_amount_GBP#</cfoutput>
			<p>Should you wish to continue with the reservation for your selected item(s), simply reply to this email.    You will be contacted  by a Member of our Team  to finalize the registration. </p>
	<br /><br />		
<p>
<cfoutput>
Title: #getuser.title#<br />
First Name: #getuser.name#<br />
Surname: #getuser.surname#<br />
Company: #getuser.company# <br />
Position: #getuser.hposition#<br />
Address: #getuser.address#<br />
City: #getuser.city#<br />
Postcode: #getuser.zip#<br />
Country: #getuser.country#<br />
Telephone: #getuser.tel#<br />
Fax: #getuser.fax# <br />
Email: #getuser.gemail#
</cfoutput>
</p>		<br />
<cfinclude template="../../petro21/htdocs/Components/signaturehtml.cfm">	

</cfmail>
  <cfmail
	  to="#contactRego#" 
  	  from="Petro21.com <#contactfromPersonal#>"
	  subject="Failled Registration sent from Petro21.com: for #getuser.title# #getuser.name# #getuser.surname# on #dateFormat(datenow, "mmmm d, yyyy")#"
	  type="html"	  >
	

<cfquery datasource="#dsnP21#" name="place">
SELECT event_name, event_date, event_loc_hotel, event_loc_city, event_loc_country FROM events
WHERE id IN (#getuser.eventid#)
</cfquery>	
<cfloop query="place"><cfoutput>
<b>#place.event_name#,</b> #place.event_date#	<br />	
</cfoutput></cfloop>
<br />			 
<b>Total Fee</b>: £<cfoutput>#getuser.payment_amount_GBP#</cfoutput>     <br /><br />
     
<cfoutput>
Title: #getuser.title#<br />
First Name: #getuser.name#<br />
Surname: #getuser.surname#<br />
Company: #getuser.company# <br />
Position: #getuser.hposition#<br />
Address: #getuser.address#<br />
City: #getuser.city#<br />
Postcode: #getuser.zip#<br />
Country: #getuser.country#<br />
Telephone: #getuser.tel#<br />
Fax: #getuser.fax# <br />
Email: #getuser.gemail#
</cfoutput>

</cfmail>	  
<cfquery datasource="#dsnP21#">
SET ANSI_WARNINGS OFF
			UPDATE registrations
			Set
			Transtype 			= 'wire',
			approved			= 0,
			cardpass			= 1
			Where id 	= #url.id#
SET ANSI_WARNINGS ON
</cfquery>
<cflocation url="list_transaction_error.cfm">
