<cfinclude template="../Application.cfm">
<!--- get files --->
<!--- get User Details details --->
<cfquery datasource="#dsnP21#"   name="order">
   SELECT * FROM Registrations
   Where id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
</cfquery>
<!--- loop throught list and get event details ------->	
<cfmail from="web@petro21.com" to="jerome@glopac.com" subject="Your Welcome Pack for #ListGetAt(order.event, 1, "/")#...." type="html"	>
<cfloop list="#order.eventid#" index="I" delimiters=",">

	<cfquery datasource="#dsnP21#" name="get">
			SELECT id, groupby, event_type, event_expire, event_days, event_month, event_year, event_name, event_loc_city AS city, event_loc_country AS country, venueaddress AS address, venuroom AS room, google, Enquir, exhEnq, sponEnq, accPay, GenCont, PaCont, AcoCont, VisCont, hotel, timereg, timestart
			FROM events WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#I#">
	</cfquery>
		<cfset cleanFileName = replace(get.event_name," ","_","All")  >
        <cfinclude template="welcomePack/WLTemplate.cfm">
		<!--- attache pdf ------->	 	
    	<cfmailparam  file="G:\websites\my-office\event_registrations\welcomePack\#cleanFileName#-#get.event_year#.pdf">  
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
<!---  CONTENT TEXT OF EMAIL START HERE ---------------------------------------------------------------------->
</cfloop>
</cfmail>
<html>
<body>
emIL SENT 
</body>
</html>