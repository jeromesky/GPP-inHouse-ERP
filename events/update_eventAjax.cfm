<cfinclude template="../Application.cfm">

<cfparam name="url.field" default="0">

<!---<cfset editedField = '#url.field#'>--->
<cfset editedField = '#form.fieldname#'>

<cfif editedField eq '0'>
  <cfset editedField = '#form.fieldname#'>
</cfif>

<cfset value = '#URLDecode(form.value)#'>

<cfif listcontains("event_blurb, focusOn, event_blurb_sponsors, event_blurb_exhib", editedField, ",")>
	<cfscript>
        editedField = Replace(editedField, "<p>&nbsp;</p>", " ", "ALL");
    </cfscript>
</cfif>

<cfquery datasource="#gpp#" name="get">
UPDATE tblAnnual_Conf
SET  
                        <cfif isdate(value) AND len(value) GTE 8 >
                        #editedField# = <cfqueryparam cfsqltype="cf_sql_date" value="#value#">
                        
                        <cfelseif Isnumeric(value) >
                        #editedField# = <cfqueryparam  value="#value#">

						<cfelseif IsBoolean(value) >
                        #editedField# = <cfqueryparam  cfsqltype="cf_sql_bit" value="#value#">       		                        
						<cfelse  >
                        #editedField# = <cfqueryparam  value="#value#">
                		</cfif>	
WHERE webid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>

<!--- UPDATE CHANGE TO THE CHANGE DB ---------->
<cfquery datasource="#dsnP21#" >
        INSERT INTO 
        	tableChanges 
        (
        eventID
        ,insertDate
        ,field
        ,NewValue
        <cfif parameterexists(form.oldValue)>
        ,oldValue
        </cfif>
        ,staffID
        )
        VALUES
        (
        <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
        ,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
        ,<cfqueryparam value="#editedField#">
        ,<cfqueryparam value="#value#"> 
       
        <cfif parameterexists(form.oldValue)>
        	,<cfqueryparam value="#form.oldValue#">
        </cfif>
       
        ,<cfqueryparam value="#session.staffID#" >
        )
</cfquery>

<cfoutput>

<cfif editedField eq "hotelname">
		<cfquery datasource="#gpp#" name="hotel">
        	SELECT VenueName FROM Venues where venueID = '#form.hotelname#'
        </cfquery>
        	#hotel.VenueName#

<cfelseif editedField eq "Econf">
	<cfif form.Econf EQ 1 OR form.Econf EQ "yes" >Yes <cfelse>No</cfif>

<cfelseif editedField eq "groupby">
        <cfquery name="clubs" datasource="#dsnP21#">
           SELECT groupby
           FROM groupby
           WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#value#">
        </cfquery>
			#clubs.groupby#

	<cfelseif editedField eq "event_type">
            <cfif editedField eq "Event" > 
                    Conference
                <cfelseif editedField eq "eb" >
                    Briefing
                <cfelseif editedField eq "DIN" >
                    Dinner
                 <cfelseif editedField eq "week" >
                    Oil week
                  <cfelseif editedField eq "bu_pr" >
                    Business Presentation
			</cfif>   
    
    <cfelseif listcontains("event_blurb, event_blurb_sponsors, event_blurb_exhib", editedField, ",") >
        { 'field' : 'event_blurbResult', 'data' : 'Data Saved' }
    
    <cfelseif editedField EQ "event_cost_eu">
            <cfif value eq "£">£<cfelse>#value#</cfif>							
    
    <cfelseif isdate(value) AND len(value) GTE 8>
    #dateFormat(value, "dd mmmm yyyy")#  
    
    <cfelseif Isnumeric(value) >
    #numberFormat(value, "99999")#
    
    <cfelseif IsBoolean(value) >
    #value#   		                        
    <cfelse  >
    #trim(value)#
    </cfif>	

</cfoutput>


<!---
<cfquery datasource="#gpp#" name="get">

UPDATE tblAnnual_Conf
SET  

<cfif parameterexists(form.club)>
	club = '#trim(form.club)#'
</cfif>

<cfif parameterexists(form.live)>
				live = #form.live#
</cfif>

<cfif parameterexists(form.event_blurb)>
		<cfset 	event_blurb = Replace(trim(form.event_blurb), "<P>&nbsp;</P>", " ", "ALL") >
	event_blurb = '#trim(event_blurb)#'
</cfif>

<cfif parameterexists(form.event_blurb_sponsors)>
	<cfset 	event_blurb_sponsors = Replace(trim(form.event_blurb_sponsors), "<P>&nbsp;</P>", " ", "ALL") >
	event_blurb_sponsors = '#trim(event_blurb_sponsors)#'
</cfif>

<cfif parameterexists(form.event_blurb_exhib)>
	<cfset 	event_blurb_exhib = Replace(trim(form.event_blurb_exhib), "<P>&nbsp;</P>", " ", "ALL") >
	event_blurb_exhib = '#trim(event_blurb_exhib)#'
</cfif>

<cfif parameterexists(form.event_name)>
	event_name = '#trim(form.event_name)#'
</cfif>

<cfif parameterexists(form.event_abbr)>
	event_abbr = '#trim(form.event_abbr)#'
</cfif>

<cfif parameterexists(form.event_year)>
	event_year = '#trim(form.event_year)#'
</cfif>

<cfif parameterexists(form.event_days)>
	event_days = '#trim(form.event_days)#'
</cfif>

<cfif parameterexists(form.event_loc_city)>
	event_loc_city = '#trim(form.event_loc_city)#'
</cfif>

<cfif parameterexists(form.venuRoom)>
	venuRoom = '#trim(form.venuRoom)#'
</cfif>

<cfif parameterexists(form.colorD)>
	colorD = '#trim(form.colorD)#'
</cfif>

<cfif parameterexists(form.colorL)>
	colorL = '#trim(form.colorL)#'
</cfif>

<cfif parameterexists(form.timereg)>
	timereg = '#trim(form.timereg)#'
</cfif>

<cfif parameterexists(form.timestart)>
	timestart = '#trim(form.timestart)#'
</cfif>

<cfif parameterexists(form.event_cost_uk)>
	event_cost_uk = <cfqueryparam cfsqltype="cf_sql_money" value="#form.event_cost_uk#">
</cfif>

<cfif parameterexists(form.event_cost_us)>
	event_cost_us = <cfqueryparam cfsqltype="cf_sql_money" value="#form.event_cost_us#">
</cfif>

<cfif parameterexists(form.event_cost_currency)>
	event_cost_currency = <cfif form.event_cost_currency eq "£"><cfqueryparam cfsqltype="cf_sql_char" value="£"><cfelse>'#form.event_cost_currency#'</cfif>
</cfif>

<cfif parameterexists(form.event_month)>
	event_month = '#trim(form.event_month)#'
</cfif>

<cfif parameterexists(form.event_type)>
	event_type = '#trim(form.event_type)#'
</cfif>

<cfif parameterexists(form.groupby)>
	groupby = #trim(form.groupby)#
</cfif>

<cfif parameterexists(form.Econf)>
	Econf = <cfif form.Econf EQ 1 OR form.Econf EQ "yes" >1 <cfelse>0</cfif>
</cfif>

<cfif parameterexists(form.event_expire)>
	event_expire = <cfqueryparam cfsqltype="cf_sql_date" value="#form.event_expire#">
</cfif>

<cfif parameterexists(form.hotelname)>
	hotel = #form.hotelname#
</cfif>

<cfif parameterexists(form.sloganSub)>
	sloganSub = '#form.sloganSub#'
</cfif>

<cfif parameterexists(form.Slogan)>
	Slogan = '#form.Slogan#'
</cfif>

<cfif parameterexists(form.focusOn)>
	<cfset 	focusOn = Replace(trim(form.focusOn), "<P>&nbsp;</P>", " ", "ALL") >
	focusOn = <cfqueryparam value="#focusOn#" >
</cfif>

<cfif parameterexists(form.linkedIn)>
	linkedIn = '#form.linkedIn#'
</cfif>

<cfif parameterexists(form.briefingSlogan)>
	briefingSlogan = '#form.briefingSlogan#'
</cfif>

<cfif parameterexists(form.discountValue)>
	discountValue = <cfqueryparam value="#form.discountValue#" >
</cfif>
<cfif parameterexists(form.discountDate)>
	discountDate = <cfqueryparam cfsqltype="cf_sql_date" value="#form.discountDate#" >
</cfif>
<cfif parameterexists(form.singleEventNot)>
	singleEventNot = <cfqueryparam cfsqltype="cf_sql_bit" value="#form.singleEventNot#" >
</cfif>
<cfif parameterexists(form.preRegistration)>
	preRegistration = <cfqueryparam  value="#left(form.preRegistration, 100)#" >
</cfif>
<cfif parameterexists(form.event_loc_country)>
	event_loc_country = <cfqueryparam  value="#form.event_loc_country#" >
</cfif>

<cfif parameterexists(form.filesAvailableDate)>
	filesAvailableDate = <cfqueryparam cfsqltype="cf_sql_date"  value="#form.filesAvailableDate#" >
</cfif>
<cfif parameterexists(form.AttendFormDate)>
	AttendFormDate = <cfqueryparam  cfsqltype="cf_sql_date"   value="#form.AttendFormDate#" >
</cfif>

<cfif parameterexists(form.boothDateSetup)>
	boothDateSetup = <cfqueryparam  cfsqltype="cf_sql_date"   value="#form.boothDateSetup#" >
</cfif>
<cfif parameterexists(form.boothTimeSetup)>
	boothTimeSetup = <cfqueryparam     value="#form.boothTimeSetup#" >
</cfif>
<cfif parameterexists(form.boothTimeRemove)>
	boothTimeRemove = <cfqueryparam     value="#form.boothTimeRemove#" >
</cfif>

<cfif parameterexists(form.boothDateRemove)>
	boothDateRemove = <cfqueryparam  cfsqltype="cf_sql_date"   value="#form.boothDateRemove#" >
</cfif>
<cfif parameterexists(form.preRegistrationDate)>
	preRegistrationDate = <cfqueryparam  cfsqltype="cf_sql_date"   value="#form.preRegistrationDate#" >
</cfif>
<cfif parameterexists(form.preRegistrationTime)>
	preRegistrationTime = <cfqueryparam     value="#form.preRegistrationTime#" >
</cfif>
<cfif parameterexists(form.eventDateEnd)>
	eventDateEnd = <cfqueryparam cfsqltype="cf_sql_date" value="#form.eventDateEnd#" >
</cfif>

	<!---, last_updated = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#" >--->
WHERE webid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>

<!--- UPDATE CHANGE TO THE CHANGE DB ---------->
<cfif parameterexists(url.field) >
        <cfquery datasource="#dsnP21#" >
        INSERT INTO Updated_Fields 
        (eventID, insertDate, inputUser, field, NewValue)
        VALUES
        (<cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">, <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">, <cfqueryparam value="#Session.staffName#" >, <cfqueryparam value="#url.field#">, '#left(Evaluate("form.#url.field#"), 499)#'  )
        </cfquery>
</cfif>--->