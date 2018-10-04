<cfinclude template="../application.cfm">
<cfif #form.do# EQ 1 >
<cfquery datasource="#dsnP21#">
SET ANSI_WARNINGS OFF
		UPDATE "Registrations"
SET eventcost 		= '#form.eventcost#',
 VAT 			= '#form.VAT#',
 vatreg 			= '#form.vatreg#',
 payment_amount	= '#form.payment_amount#',
 currency 		= '#form.currency#',
 TransDate 		= '#form.TransDate#',
 Transtype 		= '#form.Transtype#',
 title 			= '#form.title#',
 name 			= '#form.name#',
 surname 		= '#form.surname#',
 company 		= '#form.company#',
 hposition 		= '#form.hposition#',
 address 		= '#form.address#',
 address2 		= '#form.address2#',
 city 			= '#form.city#',
 zip 			= '#form.zip#',
 tel 			= '#form.tel#',
gemail 			= '#form.gemail#'
   	WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
SET ANSI_WARNINGS ON
</cfquery>

<CFLOCATION URL="registration.cfm">
</cfif>

<cfif #form.do# EQ 0 >
<!--- get User Details details --->
<cfquery datasource="#dsnP21#"   name="order">
   SELECT * FROM Registrations
   Where id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>
<!--- loop throught list and get event details ------->	
<cfmail from="web@petro21.com" to="#order.gemail#" subject="Your Welcome Pack for #ListGetAt(order.event, 1, "/")#...." type="html"	>
Dear <strong>#order.name# #order.surname#</strong><br /><br />
Please find your confirmation for :<br /><br />
<cfloop list="#order.eventid#" index="I" delimiters=",">
	<cfquery datasource="#dsnP21#" name="get">
	SELECT id, groupby, event_type, event_expire, event_days, event_month, event_year, event_name,  event_loc_city AS city, event_loc_country AS country, venueaddress AS address, venuroom AS room, google, Enquir, exhEnq, sponEnq, accPay, GenCont, PaCont, AcoCont, VisCont, hotel, timereg, timestart
	FROM events WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#I#">
	</cfquery>
		<cfset cleanFileName = replace(get.event_name," ","_","All")  >
        <cfinclude template="welcomePack/WLTemplate.cfm">
		<!--- attache pdf ------->	 	
    	<cfmailparam  file="G:\websites\my-office\event_registrations\welcomePack\#cleanFileName#-#get.event_year#.pdf">
        
<strong>#get.event_name#<cfif get.event_year NEQ "" >, #get.event_year#</cfif></strong><br />

<!---  CONTENT TEXT OF EMAIL START HERE ---------------->
</cfloop>
<!--- Attached other documents ------->	
<cfif listlen(order.eventid, ",") GT 0 >
	<cfquery datasource="#dsnP21#"   name="getfiles">
		SELECT * FROM welcomePack
		Where eventid in (#order.eventid#)
	</cfquery>
	<cfloop query="getfiles" >
		<cfmailparam  file="G:\websites\my-office\event_registrations\welcomePack\#getfiles.filepath#">
	</cfloop>   
</cfif>
<!---  FIND ATTACHMENT FOR HOTYEL FORM  ----------------------------------------------->
<cfquery datasource="#dsnP21#"   name="gethotelfile">
	SELECT event_loc_weather AS HotelForm FROM events
    WHERE groupby = #get.groupby# AND event_type = 'week' AND event_year = '#get.event_year#'
</cfquery>
<cfif gethotelfile.HotelForm NEQ "">
		<cfmailparam  file="G:\websites\petro21\htdocs\docs\#gethotelfile.HotelForm#">
</cfif>

<cfif listlen(order.eventid, ",") GT 0 >
<br /><cfif gethotelfile.HotelForm NEQ "">together with a hotel booking form.</cfif> An invoice and payment details will follow separately. Should payment have already been made, please only use the invoice for your records.<br /><br />	
#form.message#<br /><br />
 <cfif get.event_type EQ "event" OR get.event_type EQ "din" OR get.event_type EQ "eb">
For any visa enquiries please visit <a href="http://www.visahq.com/visas.php">here </a><br /><br />
</cfif>
We look forward to seeing you there,<br /><br />
<cfelse>
<br />An invoice and payment details will follow separately. Should payment have already been made, please only use the invoice for your records.<br /><br />
#form.message#<br /><br />
<cfif get.event_type EQ "event" OR get.event_type EQ "din" OR get.event_type EQ "eb">
For any visa enquiries please visit <a href="http://www.visahq.com/visas.php">here </a><br /><br />
</cfif>
We look forward to seeing you there,<br /><br />
</cfif>

<cfinclude template="../../petro21/htdocs/Components/signaturehtml.cfm">
</cfmail>

<CFmail
  	from="#contactFrom#"
	to="#contactRego#"
	subject="Welcome Pack sent for #ListGetAt(order.event, 1, "/")#...."  type="html">
	
	Welcome pack sent to #order.name# #order.surname#<br />
    ref: <strong>#order.netbanx_reference#</strong>
</CFmail>

<cfquery datasource="#dsnP21#" >
SET ANSI_WARNINGS OFF
 
	UPDATE "Registrations"
	SET approved = '1'
	WHERE id = '#form.id#'
SET ANSI_WARNINGS ON
</cfquery>
<!--- add users e-conference --->
<cfif parameterexists(form.AllowAccess)>
	<!--- do nothing, do not add access to econference --->
<cfelse>
		<CFQUERY datasource="#dsnP21#"  name="findit">
		select userid, EconfData from userinfo
		where userid =  #form.userid#
		</cfquery>
		
		<cfif findit.userid EQ "">
                    <CFQUERY datasource="#dsnP21#" name="put">
                    Insert into userinfo(userid, EconfData)
                    values('#form.userid#','#order.eventid#')
                    </cfquery>
        <cfelse>
                    <cfset added = listAppend(findit.EconfData, form.eventid, ",")   >	
                    <CFQUERY datasource="#dsnP21#" name="put">
                    UPDATE userinfo
                    Set EconfData = '#added#'
                    Where userid = #form.userid#
                    </cfquery>
        </cfif>

</cfif>    	
<CFLOCATION URL="registration.cfm">
</cfif>
<!--- delete record --->
<cfif #form.do# EQ 2 >
<cfquery datasource="#dsnP21#" >
SET ANSI_WARNINGS OFF
	UPDATE "Registrations"
	SET approved = '1'
	WHERE id = '#form.id#'
SET ANSI_WARNINGS ON
</cfquery>
<CFLOCATION URL="registration.cfm">
</cfif>

<!---<cfoutput>
Dear #order.name# #order.surname#<br /><br />
Please find your welcome letter for the up coming event (#order.event#), together with a hotel booking form. An invoice and payment details will follow separately. Should payment have already been made, please only use the invoice for your records.<br /><br />
#form.message#<br /><br />
</cfoutput>
	<cfloop query="get" >
	<cfoutput>#get.filepath#, </cfoutput>
	</cfloop>--->