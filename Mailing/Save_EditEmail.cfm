<!---<cfif parameterexists(form.id)>--->
<cfquery datasource="#dsnP21#" name="add">
	UPDATE  MailOut_configuration SET 
	<cfif parameterexists(form.eventid)>              
	   <cfif parameterexists(form.delegate)>delegate = 1,<cfelse>delegate = 0,</cfif>
       <cfif parameterexists(form.speaker)>speaker = 1,<cfelse>speaker = 0,</cfif>
       <cfif parameterexists(form.guest)>guest = 1,<cfelse>guest = 0,</cfif>
       <cfif parameterexists(form.moderator)>moderator = 1,<cfelse>moderator = 0,</cfif>
       <cfif parameterexists(form.exhibitor)>exhibitor = 1,<cfelse>exhibitor = 0,</cfif>
       <cfif parameterexists(form.press)>press = 1,<cfelse>press = 0,</cfif>
       <cfif parameterexists(form.research)>research = 1,<cfelse>research = 0,</cfif>
       <cfif parameterexists(form.sponsor)>sponsor = 1,<cfelse>sponsor = 0,</cfif>
       <cfif parameterexists(form.operatorAttType) >operatorAttType = 1,<cfelse>operatorAttType = 0,</cfif>
       <cfif parameterexists(form.eventid)>eventid = #form.eventid#,</cfif>
       <cfif parameterexists(form.conferenceExclude)>conferenceExclude = 1,<cfelse>conferenceExclude = 0,</cfif>
       <cfif parameterexists(form.eventExact)>eventExact = 1,<cfelse>eventExact = 0,</cfif>
       <cfif parameterexists(form.OnlyRegistered)>OnlyRegistered = 1,<cfelse>OnlyRegistered = 0,</cfif>
       <cfif parameterexists(form.mailsent)>mailsent = 1,<cfelse>mailsent = 0,</cfif>
    </cfif>             
<!---             
<cfif parameterexists(form.dateToSend)>
	dateToSend 	= <cfqueryparam cfsqltype="cf_sql_date" value="#form.dateToSend#">,
    timeToSend 	= '#form.timeToSend#',
</cfif>    --->			 
	<cfif parameterexists(form.regions)>   </cfif>
	  <cfif parameterexists(form.exactSearch) >exactSearch = 1,<cfelse>exactSearch = 0,</cfif>
     <cfif parameterexists(form.chkWebIntAus) AND form.chkWebIntAus EQ "chkWebIntAus">chkWebIntAus = 1,<cfelse>chkWebIntAus = 0,</cfif>
     <cfif parameterexists(form.chkWebIntNa) AND form.chkWebIntNa EQ "chkWebIntNa">chkWebIntNa = 1,<cfelse>chkWebIntNa = 0,</cfif>
      <cfif parameterexists(form.chkWebIntWo) AND form.chkWebIntWo EQ "chkWebIntWo">chkWebIntWo = 1,<cfelse>chkWebIntWo = 0,</cfif>
      <cfif parameterexists(form.chkWebIntAf) AND form.chkWebIntAf EQ "chkWebIntAf">chkWebIntAf = 1,<cfelse>chkWebIntAf = 0,</cfif>
      <cfif parameterexists(form.chkWebIntNaf) AND form.chkWebIntNaf EQ "chkWebIntNaf">chkWebIntNaf = 1,<cfelse>chkWebIntNaf = 0,</cfif>
      <cfif parameterexists(form.chkWebIntMe) AND form.chkWebIntMe EQ "chkWebIntMe">chkWebIntMe = 1,<cfelse>chkWebIntMe = 0,</cfif>
      <cfif parameterexists(form.chkWebIntAs) AND form.chkWebIntAs EQ "chkWebIntAs">chkWebIntAs = 1,<cfelse>chkWebIntAs =  0,</cfif>
      <cfif parameterexists(form.chkWebIntLa) AND form.chkWebIntLa EQ "chkWebIntLa">chkWebIntLa = 1,<cfelse>chkWebIntLa = 0,</cfif>
      <cfif parameterexists(form.chkWebIntEu) AND form.chkWebIntEu EQ "chkWebIntEu">chkWebIntEu = 1,<cfelse>chkWebIntEu = 0,</cfif>
      <cfif parameterexists(form.chkWebIntGen) AND form.chkWebIntGen EQ "chkWebIntGen">chkWebIntGen = 1,<cfelse>chkWebIntGen = 0,</cfif>
      <cfif parameterexists(form.chkWebIntWa) AND form.chkWebIntWa EQ "chkWebIntWa">chkWebIntWa = 1,<cfelse>chkWebIntWa = 0,</cfif>
      <cfif parameterexists(form.chkWebIntEA) AND form.chkWebIntEA EQ "chkWebIntEA">chkWebIntEA = 1,<cfelse>chkWebIntEA = 0,</cfif>
      <cfif parameterexists(form.chkWebIntAdvertising) AND form.chkWebIntAdvertising EQ "chkWebIntAdvertising">chkWebIntAdvertising = 1,<cfelse>chkWebIntAdvertising = 0,</cfif>
      <cfif parameterexists(form.chkWebIntSAE) AND form.chkWebIntSAE EQ "chkWebIntSAE">chkWebIntSAE = 1,<cfelse>chkWebIntSAE = 0,</cfif> 
      <cfif parameterexists(form.role) >roleID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.role#"> ,<cfelse>roleID = 0,</cfif> 

	<cfif parameterexists(form.country)>country = '#trim(form.country)#',</cfif>
    <cfif parameterexists(form.countryID)>countryID = <cfqueryparam cfsqltype="cf_sql_char" value="#form.countryID#"><cfelse>countryID = <cfqueryparam cfsqltype="cf_sql_char" value=""></cfif>,
    <cfif parameterexists(form.areaID)>areaID = <cfqueryparam cfsqltype="cf_sql_char" value="#form.areaID#"><cfelse>areaID = <cfqueryparam cfsqltype="cf_sql_char" value=""></cfif>,
     <cfif parameterexists(form.content)>
        content 			= '#trim(form.content)#',
        textmailDetails		= <cfif parameterexists(form.textmailDetails)>1<cfelse>0</cfif>,
        textmailSpeakers 	= <cfif parameterexists(form.textmailSpeakers)>1<cfelse>0</cfif>,
        textmailfocus		= <cfif parameterexists(form.textmailfocus)>1<cfelse>0</cfif>,
        textmailTitle		= <cfif parameterexists(form.textmailTitle)>1<cfelse>0</cfif>,
        textmailpricing		= <cfif parameterexists(form.textmailpricing)>1<cfelse>0</cfif>,
        textmailcombine		= <cfif parameterexists(form.textmailcombine)>1<cfelse>0</cfif>,
        textmailOverview	= <cfif parameterexists(form.textmailOverview)>1<cfelse>0</cfif>,
        textmailLogos		= <cfif parameterexists(form.textmailLogos)>1<cfelse>0</cfif>,
     </cfif>
     <cfif parameterexists(form.company_id)>           
                createFile =  <cfif parameterexists(form.createFile)>1,<cfelse>0,</cfif>
                contraJob_id = <cfif parameterexists(form.contraJob_id )> #trim(form.contraJob_id)#,<cfelse>0,</cfif>
                <cfif parameterexists(form.company_id)>company_id = #form.company_id#,</cfif>
    </cfif>
    <cfif parameterexists(form.template)>
            template 	= '#trim(form.template)#',
            col1color 	= <cfqueryparam value="#trim(form.col1color)#">,
            col2color	= <cfqueryparam value="#trim(form.col2color)#">,
            col3color	= <cfqueryparam value="#trim(form.col3color)#">,
    </cfif>
    <cfif parameterexists(form.flashnews)>flashnews = <cfqueryparam value="#trim(form.flashnews)#">,<cfelse>flashnews = <cfqueryparam value="">,</cfif>

    <cfif parameterexists(form.name)>            
        name = '#trim(form.name)#',
        signature = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.signature#">,
        <cfif parameterexists(form.namefrom)>namefrom = '#trim(form.namefrom)#',</cfif>
        <cfif parameterexists(form.emailfrom)>emailfrom = '#trim(form.emailfrom)#',</cfif>
        DomainName	= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.DomainName#">,
        <cfif parameterexists(form.selectAllEmails)>selectAllEmails = 1,<cfelse>selectAllEmails = 0,</cfif>
        <cfif parameterexists(form.subject)>subject = '#trim(form.subject)#',</cfif>
        <cfif parameterexists(form.displayDate)>displayDate = <cfqueryparam cfsqltype="cf_sql_date" value="#form.displayDate#">,</cfif>
        calendar = <cfif parameterexists(form.calendar)>1,<cfelse>0,</cfif>
        templateSize = <cfif parameterexists(form.templateSize)>1,<cfelse>0,</cfif>
        test = <cfif parameterexists(form.test)>1,<cfelse>0,</cfif>
      <cfif parameterexists(form.CompanySearch)>CompanySearch = <cfqueryparam  value="#trim(form.CompanySearch)#"> ,</cfif>
      <cfif parameterexists(form.CompanySearchExact)>CompanySearchExact = 1,<cfelse>CompanySearchExact = 0, </cfif>
    </cfif>
updated	= <cfqueryparam cfsqltype="cf_sql_date" value="#now()#" >
WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>
            
<CFPARAM name="add.id" default="#form.id#">
<!--- insert TIME TO SEND OUT EMAIL  --->
<cfif parameterexists(form.dateToSend)>
	<cfquery datasource="#DSNP21#">
 		INSERT INTO 
        	MailOut_calendar (emailid, dateToSend, TIMETOSEND)
		Values (#form.id#, <cfqueryparam cfsqltype="cf_sql_date" value="#form.dateToSend#" >, '#form.timeToSend#')
	</cfquery>
</cfif>
<!---<cfelse>
	<cfquery datasource="#dsnP21#" name="add">
	 INSERT INTO MailOut_configuration (
	 
	<cfif parameterexists(form.name)>name, </cfif>
	<cfif parameterexists(form.namefROM)>namefROM, </cfif>
	<cfif parameterexists(form.EmailFrom)>EmailFrom, </cfif>
	<cfif parameterexists(form.subject)> subject , </cfif>
	<cfif parameterexists(form.name)>calendar,</cfif>
	<cfif parameterexists(form.displayDate)>displayDate,</cfif>
	<cfif parameterexists(form.test)>test,</cfif>
	 datesend
	 )
	 VALUES(
	<cfif parameterexists(form.name)> '#trim(form.name)#',</cfif>
	<cfif parameterexists(form.namefrom)>'#trim(form.namefrom)#',</cfif>
	<cfif parameterexists(form.emailfrom)> '#trim(form.emailfrom)#',</cfif>
	<cfif parameterexists(form.subject)> '#trim(form.subject)#',</cfif>
	<cfif parameterexists(form.calendar)>1,<cfelse>0,</cfif>
	<cfif parameterexists(form.displayDate)><cfqueryparam cfsqltype="cf_sql_date" value="#form.displayDate#">,</cfif>
	<cfif parameterexists(form.test)>1,</cfif>
	<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
	  )
	  SELECT @@Identity AS id
	</cfquery>
</cfif>--->