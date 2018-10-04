<cfif  form.link CONTAINS "bid=" AND form.bannerType NEQ 1>
  <cfset cleancompany = ListGetAt(form.link, 2, "&bid=")>
  
  <!--- CHECK see if the record is in company job table --->
  <cfquery datasource="stats" name="checkJob">
  SELECT id FROM companyJob 
  WHERE bannerid =<cfqueryparam cfsqltype="cf_sql_integer" value="#form.bannerID#">
  </cfquery>
  <!--- CHECK see if the record is in company job table --->
  <cfif checkJob.recordcount GTE 1 >
    <cfelse>
    <cfquery datasource="stats">
    INSERT INTO companyJob(company, bannerid, bannertype, startdate) 
    VALUES (#cleancompany#, #form.bannerID#, #form.bannerType#, #now()#)</cfquery>
  </cfif>
  <cfelseif parameterexists(form.link) AND form.link CONTAINS "tc=">
  <cfset cleancompany =0 >
  <cfelseif parameterexists(form.link) AND form.link CONTAINS "id=">
  <cfset cleancompany = 0 >
  <cfelse>
  <cfset cleancompany = 0 >
</cfif>

<!--- UPLOAD BANNER --->
<cfif form.img NEQ "">
  <!--- check logo --->
  <cfquery datasource="#dsnP21#" name="get_file">
      SELECT 
              img 
      FROM 
              newsletter_banners 
      WHERE 
              id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.bannerID#">
 </cfquery>
  <cfif get_file.img NEQ "" AND form.img NEQ "">
    <!--- delete file --->
    <cfif  FileExists("G:\websites\petro21\advertising\#get_file.img#")>
      <cffile action="delete" file="G:\websites\petro21\advertising\#get_file.img#">
    </cfif>
  </cfif>
  <!--- UPLOAD file --->
  <cffile action="upload" filefield="Form.img" destination= "G:\websites\petro21\advertising\" accept="image/swf, image/jpeg, image/gif" nameconflict="overwrite">
</cfif>

<!--- UPLOAD BANNER --->
<cfset bannerID = form.bannerID>
<cfif form.bannerID EQ 0>
  <cfquery datasource="#dsnP21#" name="addbanner"  >
   INSERT INTO newsletter_banners(insertdate)
    VALUES(<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">)
  SELECT @@Identity AS bannerid
  </cfquery>
  <cfset bannerID = addbanner.bannerid>
</cfif>

<!--- UPDATE UPLOAD DATA file --->
<cfquery datasource="#dsnP21#"  >
    UPDATE newsletter_banners
    SET
    <cfif form.img NEQ "">
    img 			= <cfqueryparam cfsqltype="cf_sql_char" value="#File.ServerFile#">,</cfif>
    bannerType		= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.bannerType#">,
    insertdate 		= <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">,
    link 			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.link#">,
    eventdate 		= <cfqueryparam cfsqltype="cf_sql_date" value="#form.eventdate#">,
    title 			= <cfqueryparam cfsqltype="cf_sql_char" value="#form.title#">,
    company			= <cfqueryparam cfsqltype="cf_sql_integer" value="#cleancompany#">
    WHERE 
               id 	= <cfqueryparam cfsqltype="cf_sql_integer" value="#bannerID#">
</cfquery>