<cfif Hour(now()) EQ 9 >

	<cfinclude template="tasks/dsp_tasks.cfm">

  <cfset futureDate = DateAdd('d', 14, now()) >
  <cfset mailto = "jerome@glopac-partners.com">
  
</cfif>
  <!---<cfloop from="1" to="2" index="i">
  <!---- run & send contact Jerry --->
  <cfquery name="CalendarDates" DATASOURCE="#dsnP21#">
		SELECT
        	id,
            event_title, 
            event, 
            grouped, 
            addtype, 
            companyid, 
            cal_date, 
            details, 
            contact, 
            doemail, 
            note
		FROM
        	companyjob
 		WHERE        
 		<cfif i eq 1 >
			cal_date = <cfqueryparam value="#dateformat(now(), "yyyy,mm,dd")#" cfsqltype="cf_sql_date"> 
        AND 
        	(
            	submitdate = '' 
            OR 
                submitdate IS NULL 
            )
 		<cfelse>
		 	cal_date = <cfqueryparam value="#dateformat(futureDate, "yyyy,mm,dd")#" cfsqltype="cf_sql_date">  
 		</cfif>
		<!--- AND doemail <> 1---> 
	</cfquery>
  <cfset contact = #trim(CalendarDates.contact)# & "@glopac-partners.com" >
  <cfif CalendarDates.recordcount GT 0>
    <cfloop query="CalendarDates">
    <cfquery name="getevent" DATASOURCE="#gpp#">
        	SELECT 
            	event_name, 
                event_year, 
                groupby 
			FROM 
            	CRM_events
			WHERE 
            	eventID = #CalendarDates.event#
 		</cfquery>
    <cfquery name="jobType" DATASOURCE="#dsnP21#">
        	SELECT 
            	title, 
                contact 
            FROM 
            	companyjobtitles 
            WHERE 
            	id = #CalendarDates.addtype#
 		</cfquery>
    <cfset secondContact = #trim(jobType.contact)# >
    <cfmail from="web@petro21.com" to="#contact#;#secondContact#" subject="Contract due: #dateformat(CalendarDates.cal_date, 'dddd, dd mmmm yyyy')#" type="html">
    <cfquery name="companyDetails" DATASOURCE="#dsnP21#" >
				SELECT 
                	contactname, 
                    contactemail, 
                    contactphone, 
                    specs 
				FROM 
                	logos 
                WHERE 
                	id = #CalendarDates.companyid#
			 </cfquery>
    <cfquery datasource="#dsnP21#" name="contDet">
				SELECT 
                	details 
				FROM 
                	companycontractjob 
				WHERE 
                	contractid = '#CalendarDates.grouped#' 
				AND 
                	eventid = #CalendarDates.event#<!--- here it looks strange ---->
			 </cfquery>
    <cfoutput> Dear #companyDetails.contactname#<br />
    <br />
    As part of the contract that Global Pacific & Partners has with you on the #getevent.event_name# #getevent.event_year#, please find attached the files for your urgent attention.<br />
    Jerry has organized this to be completed by
    <cfif i eq 1 >
      <b>Today</b>
    </cfif>
    : #dateformat(CalendarDates.cal_date, "dddd, dd mmmm yyyy")# and requested me to send this through directly to you.<br />
    <br />
    <cfif trim(jobType.title) EQ "Send GPP email to media job ">
      Could you please send proof to jerome@glopac-partners.com before sending out on agreed date <br />
      and include jerry@glopac-partners.com to receive the email blast.<br />
      <br />
    </cfif>
    If you have any specific queries regarding the fulfillment of this contract please direct them to jerry@glopac-partners.com.<br />
    <br />
    <cfif CalendarDates.addtype EQ 3 >
      Please use the following link back to our site for the supplied banner http://www.petro21.com/eventRedirect.cfm?jid=#CalendarDates.id#<br />
      <br />
    </cfif>
    Kind regards<br />
    Jerome <br />
    <br />
    <br />
    <b>#trim(jobType.title)# job </b><br />
    <b>Due date</b>:
    <cfif i eq 1 >
      <b>Today</b>
    </cfif>
    : #dateformat(CalendarDates.cal_date, "dddd, dd mmmm yyyy")# <br />
    <b>Job manager</b>: #CalendarDates.contact# <br />
    <b>Job Id </b>: #CalendarDates.id#<br />
    <br />
    <b>Company</b>: #CalendarDates.event_title#<br />
    <b>Contact Name</b>: #companyDetails.contactname#<br />
    <b>Contact phone</b>: #companyDetails.contactphone#<br />
    <b>Contact email</b>: #companyDetails.contactemail#<br />
    <br />
    <br />
    <br />
    ..................Job specs for #getevent.event_name# #getevent.event_year#..................<br />
    <br />
    <br />
    <br />
    #CalendarDates.details#<br />
    <br />
    <br />
    ..................Contract specs for #getevent.event_name# #getevent.event_year#..................<br />
    <br />
    <br />
    <br />
    #contDet.details#<br />
    <br />
    <br />
    ..................Company Specs..........................................................................................<br />
    <br />
    #companyDetails.specs# <br />
    <br />
    ...........................................................................................<br />
    <br />
    </cfoutput>
    </cfmail>
    </cfloop>
  </cfif>
  </cfloop>--=->
  
  <!--- RUN CRUDE PRICE COLLECTOR --->
  <cfinclude template="crude/qry_crude.cfm">
  
</cfif>

<!---  RunTo check New EVENT Registrationts --->
<cfif Hour(now()) EQ 9 >

  <!--- CHECK COUNT OF NEW USERS on TEMP DATABASE 
  <cfquery datasource="#gpp#" name="qryNewUsers">
                SELECT 
                	COUNT(IngIndividual_ID) AS total
                FROM 
                	tblIndividual
                WHERE 
                	[status] = '2'
            </cfquery>

  <cfif qryNewUsers.recordcount GT 0 >
    <cfmail to="babette@glopac-partners.com; tanya@glopac-partners.com; #contactAdmin#" from="web@petro21.com" subject="#qryNewUsers.total# new users on New System">#qryNewUsers.recordcount# new users to check on system </cfmail>
  </cfif>--->

<!---<cfquery name="get_trans" datasource="#dsnP21#">
SELECT 
    id
FROM 
    Registrations
WHERE 
    (
        cardpass = 0 OR cardpass IS NULL
     )  
     AND 
     (
        approved = 0 OR approved IS NULL
     ) 
     AND 
     (	
        gemail IS NOT NULL OR gemail <> '' 
     ) 
     AND 
     (
        transtype IS NULL OR transtype = 'card'
     )
ORDER BY
    id desc
</cfquery>
		  <cfif get_trans.recordcount GT 0 >
            <cfmail to="tanya@glopac-partners.com; amanda@glopac-partners.com; #contactAdmin#" from="web@petro21.com" subject="#get_trans.recordcount# Incomplete transaction "> </cfmail>
          </cfif>
</cfif>--->

<!--- SEE IF NEWS ARE SELECTED FOR DAYLY  NEWS; duncan@glopac-partners.com; babette@glopac-partners.com 
<cfif Hour(now()) EQ  17>
  <cfif DayOfWeek(now()) EQ 7  >
    <cfset checkNewsTomorrow = 1 >
    <cfelse>
    <cfset checkNewsTomorrow = (DayOfWeek(now()) + 1 ) >
  </cfif>
  <cfquery name="Find_newsletters_added" datasource="#gpp#">
    	SELECT 
        	sendDay, 
            newsletterID AS newsid, 
            sendTime, 
            newsletterName
        FROM 
        	newsletters
        WHERE 
        	( 
        		sendDay = <CFQUERYPARAM Value="#checkNewsTomorrow#"> OR sendDay = 0
            ) 
            AND 
            	live = 1 
            AND 
            	newsletterid <> ''
        	ORDER BY 
            	sendTime 
	</cfquery>
  <cfset Newsletters_name = valuelist(Find_newsletters_added.newsletterName, "/") >
  <cfset Newsletters_newsid = valuelist(Find_newsletters_added.newsid, "/") >
  <cfset lsitPos = 1 >
  <cfmail to="#contactAdmin#" from="web@petro21.com" cc="duncan@glopac-partners.com; babette@glopac-partners.com" subject="Daily Newsletters News Selection Reminder" type="html">
  <cfoutput> News articles selected for newsletters on #dateFormat(now(), "ddd mmm yyyy")# to be sent out on the #DayOfWeekAsString(checkNewsTomorrow)#<br />
  <br />
  <cfloop list="#Newsletters_newsid#" delimiters="/" index="i" >
  <cfquery name="qry_news" datasource="#dsnP21#">
        	SELECT
				news_item_added
        	FROM         
            	dbo.tbl_news_items
        	WHERE 
            	CONVERT(nvarchar(35),news_item_added,101) = CONVERT(nvarchar(35),GETDATE(),101)  
            AND 
            	news_item_cat_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#i#" >
       			<!--- (news_item_added = #now()#)  --->
        </cfquery>
  <b>#ListGetAt(Newsletters_name, lsitPos, "/")# </b> : #qry_news.recordcount#<br  />
  <hr />
  <br />
  <cfset lsitPos = lsitPos + 1 >
  </cfloop>
  </cfoutput>
  </cfmail>
</cfif>--->

<!---<cfinclude template="../../petro21/htdocs/tools/checkVPN.cfm">
<cfsetting requesttimeout="10000">--->
<cfoutput>Hourly</cfoutput>

<!--- CREATE WEB NEWS FLASH NEWS NEWSTICKER CRUDE 
<CFHTTP URL="http://www.petro21.com/components/NewsHome_dy.cfm" METHOD="Get"></CFHTTP>
<CFFILE ACTION="WRITE" FILE="G:\websites\petro21\content\NewsHome.cfm" OUTPUT="#CFHTTP.FileContent#" NAMECONFLICT="overwrite">
<CFHTTP URL="http://www.petro21.com/components/oil_price_dy.cfm" METHOD="Get"></CFHTTP>
<CFFILE ACTION="WRITE" FILE="G:\websites\petro21\components\oil_price.cfm" OUTPUT="#CFHTTP.FileContent#" NAMECONFLICT="overwrite">
<CFHTTP URL="http://www.petro21.com/components/NewsTicker_dyn.cfm" METHOD="Get"></CFHTTP>
<CFFILE ACTION="WRITE" FILE="G:\websites\petro21\content\tickerNews.cfm" OUTPUT="#CFHTTP.FileContent#" NAMECONFLICT="overwrite">
<CFHTTP URL="http://www.petro21.com/content/newsFlash_dyn.cfm" METHOD="Get"></CFHTTP>
<CFFILE ACTION="WRITE" FILE="G:\websites\petro21\content\newsFlash.cfm" OUTPUT="#CFHTTP.FileContent#" NAMECONFLICT="overwrite">--->
<!--- Run & send contact done by JERRY --->