<!--- Get the EVENETS FROM LIST DROPDOWN --->
<cfquery name="getevent" datasource="#gpp#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
  SELECT 
    webID AS id, 
    event_name, 
    event_type, 
    event_abbr, 
    Year(event_expire) AS event_year, 
    event_expire
  FROM 
  	tblAnnual_Conf
  WHERE 
  	event_expire > #now()# 
  AND (event_type = 'Event') OR (event_type = 'EB') OR (event_type = 'DIN') OR (event_type = 'week')
  ORDER BY 
  	event_expire DESC
</cfquery>

<cfquery name="getP21" datasource="#dsnP21#" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
  SELECT 
      id, 
      event_name, 
      event_type, 
      event_abbr, 
      Year(event_expire) AS event_year, 
      event_expire
  FROM 
  	events
  WHERE 
  	event_expire > #now()# 
    AND (event_type = 'RE') OR (event_type = 'book') OR (event_type = 'club') OR (event_type = 'Advis') OR (event_type = 'cm')  
  ORDER BY 
  	event_expire DESC
</cfquery>

<!---<cfquery name="geteconf" datasource="#gpp#">
  SELECT id, event_name, event_type, event_abbr, event_year
  FROM events
  WHERE event_expire < #datenow#  AND (event_type = 'Event') AND YEAR(event_expire) > #dateAdd("yyyy", -1, Now())#
  ORDER BY event_expire
</cfquery>--->

<!--- GET COMPANIES FROR LIST DROP DOWN --->
<cfquery datasource="#dsnP21#" name="getcomp" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
	SELECT company, id 
    FROM logos 
    ORDER BY company
</cfquery>

<cfset bannerid = form.bannerID>

<cfif form.bannerID EQ 0>

   <cfquery datasource="#dsnP21#" name="selectbanner" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
   INSERT INTO newsletter_banners (eventdate)
   VALUES('#dateformat(now(), "mm/dd/yyyy")#')
   SELECT @@Identity AS id 
	</cfquery>
    <cfset bannerid = #selectbanner.id#>
</cfif>

<cfquery datasource="#dsnP21#" name="selectbanner"   >
   SELECT * 
   FROM newsletter_banners
   WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#bannerid#">
</cfquery>

<script type="text/javascript">
$(document).ready(function() { 
	$('#saveBanner').submit(function() { 
		$(this).ajaxSubmit( { clearForm: true, success: function(){  $('#saveBanner').html("");  }	}); 
			return false; 
	});
});
</script>

<form id="saveBanner" action="../newsletters/qry_SaveBanner.cfm" enctype="multipart/form-data" method="post"><cfoutput>
<table border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td bgcolor="##B8D9FF">Banner reference title</td>
    <td><input type="text" name="title" id="title" maxlength="45" value="#selectbanner.title#" /></td>
  </tr>
  <tr>
    <td width="202" bgcolor="##B8D9FF">Select Banner to Load</td>
    <td width="368"><input type="file" name="img">#selectbanner.img#</td>
  </tr>
  <tr>
    <td bgcolor="##B8D9FF">Date</td>
    <td><input type="text" name="eventdate" value="#DateFormat(selectbanner.eventdate, "dd mmm yyyy")#"> <img src="../img/calendar_24.gif" border="0" onclick="scwShow(scwID('eventdate'),event,3);" ></td>
  </tr>
  <tr>
    <td bgcolor="##B8D9FF">Banner Format</td>
    <td><select name="bannerType">
    	<option value="1" <cfif selectbanner.bannerType EQ 1 >selected</cfif>>Event Banner</option>
        <option value="2" <cfif selectbanner.bannerType EQ 2 >selected</cfif>>External bannner</option>
        <option value="10" <cfif selectbanner.bannerType EQ 10 >selected</cfif>>Corporate bannner</option>
        <option value="11" <cfif selectbanner.bannerType EQ 11 >selected</cfif>>Featured bannner</option>
        <option value="3" <cfif selectbanner.bannerType EQ 3 >selected</cfif>>Skyscraper  bannner</option>
        <option value="4" <cfif selectbanner.bannerType EQ 4 >selected</cfif>>Vertical bannner</option>
    </select></td>
  </tr>
  <tr>
    <td bgcolor="##B8D9FF">Select link to</td>
    <td><select name="link" style="width:250px">
            <option value="">-----Email link -----</option>
            <option value="mailto:duncan@glopac-partners.com" <cfif selectbanner.link EQ "mailto:duncan@glopac-partners.com">selected</cfif> >Duncan</option>
            <option value="mailto:babette@glopac-partners.com" <cfif selectbanner.link EQ "mailto:babette@glopac-partners.com">selected</cfif> >Babette</option>
            <option value="">-----Advertise -----</option>
            <option value="http://www.petro21.com/research/advertising.cfm" <cfif selectbanner.link EQ "http://www.petro21.com/research/advertising.cfm">selected</cfif> >Advertising pages</option>
            <option value="">-----Week -----</option>
            <cfloop query=getevent><cfif getevent.event_type EQ "week">
            <option value="http://www.petro21.com/events/?id=#getevent.id#" <cfif selectbanner.link EQ "http://www.petro21.com/events/?id=#getevent.id#">selected</cfif> >#getevent.event_name# #getevent.event_year#</option>
            </cfif></cfloop>
            <option value=""></option>
            <option value="">-----Events -----</option>
            <cfloop query=getevent><cfif getevent.event_type EQ "event">
            <option value="http://www.petro21.com/events/?id=#getevent.id#&tc=#getevent.event_abbr#" <cfif selectbanner.link EQ "http://www.petro21.com/events/?id=#getevent.id#&tc=#getevent.event_abbr#">selected</cfif> >#getevent.event_name# #getevent.event_year#</option>
            </cfif></cfloop>
            <option value=""></option>
<!--- <option value="">----- E-conference ----</option>
<cfloop query=geteconf>
<option value="http://petro21.com/conference/index.cfm?id=#geteconf.id#" <cfif selectbanner.link EQ "http://petro21.com/conference/index.cfm?id=#geteconf.id#">selected</cfif> >#geteconf.event_name# #geteconf.event_year#</option></cfloop>
<option value=""></option>--->
          <option value="">-----Strategy Breifings-----</option>
          <cfloop query=getevent><cfif getevent.event_type EQ "EB">
          <option value="http://www.petro21.com/events/?id=#getevent.id#&tc=#getevent.event_abbr#" <cfif selectbanner.link EQ "http://www.petro21.com/events/index.cfm?id=#getevent.id#&tc=#getevent.event_abbr#">selected</cfif> >#getevent.event_name# #getevent.event_year#</option>
          </cfif></cfloop>
          <option value=""></option>
          <option value="">-----Dinners-----</option>
          <cfloop query=getevent><cfif getevent.event_type EQ "DIN">
          <option value="http://www.petro21.com/events/?id=#getevent.id#&tc=#getevent.event_abbr#" <cfif selectbanner.link EQ "http://www.petro21.com/dinners/?id=#getevent.id#&tc=#getevent.event_abbr#">selected</cfif> >#getevent.event_name# #getevent.event_year#</option>
          </cfif></cfloop>
          <option value=""></option>
          <option value="">-----Research-----</option>
          <cfloop query=getP21><cfif getP21.event_type EQ "RE">
          <option value="http://www.petro21.com/research/?id=#getP21.id#" <cfif selectbanner.link EQ "http://www.petro21.com/research/?id=#getP21.id#">selected</cfif> >#getP21.event_name#</option></cfif></cfloop>
          <option value=""></option>
          <option value="">-----Books-----</option>
          <cfloop query=getP21><cfif getP21.event_type EQ "book">
          <option value="http://www.petro21.com/research/?id=#getP21.id#" <cfif selectbanner.link EQ "http://www.petro21.com/research/?id=#getP21.id#">selected</cfif> >#getP21.event_name#</option></cfif></cfloop>
          <option value=""></option>
          <option value="">-----Clubs-----</option>
          <cfloop query=getP21><cfif getP21.event_type EQ "club">
          <option value="http://www.petro21.com/research/?id=#getP21.id#" <cfif selectbanner.link EQ "http://www.petro21.com/research/?id=#getP21.id#">selected</cfif> >#getP21.event_name#</option></cfif></cfloop>
          <option value=""></option>
          <option value="">-----Advisory -----</option>
          <cfloop query=getP21><cfif getP21.event_type EQ "Advis">
          <option value="http://www.petro21.com/research/?id=#getP21.id#" <cfif selectbanner.link EQ "http://www.petro21.com/research/?id=#getP21.id#">selected</cfif> >#getP21.event_name#</option></cfif></cfloop>
          <option value=""></option>
          <option value="">-----Content Management -----</option>
          <cfloop query=getP21><cfif getP21.event_type EQ "cm">
          <option value="http://www.petro21.com/research/?id=#getP21.id#" <cfif selectbanner.link EQ "http://www.petro21.com/research/?id=#getP21.id#">selected</cfif> >#getP21.event_name#</option></cfif></cfloop>
          <option value=""></option>
          <option value="">-----External Company banner -----</option>
          <cfloop query=getcomp><option value="http://www.petro21.com/post/newsletter/statsBanner.cfm?id=#getcomp.id#&bid=#selectbanner.id#" <cfif selectbanner.link EQ "http://www.petro21.com/post/newsletter/statsBanner.cfm?id=#getcomp.id#&bid=#selectbanner.id#">selected</cfif> >#getcomp.company#</option></cfloop>
          </select></td>
  </tr>
  <tr>
    <td bgcolor="##B8D9FF"><input type="hidden" name="bannerID" value="#form.bannerID#" /></td>
    <td><button>Upload</button></td>
  </tr>
</table></cfoutput></form>

<!--- <!--- GET data for the file --->
<cfif parameterexists(url.id)>
	<!---<cfset isid = 1 >--->
    <cfset bannerid = #url.id# >
	<cfquery datasource="#dsnP21#" name="selectbanner" cachedwithin="#CreateTimeSpan(0,0,10,0)#">
   SELECT * 
   FROM newsletter_banners
   WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
	</cfquery>
<!--- OR create new data for the file --->
<cfelse>
	<cfparam name="form.bannerID" default="0" >
	<cfparam name="selectbanner.title" default="" >
	<cfparam name="selectbanner.img" default="" >
	<cfparam name="selectbanner.eventdate" default="" >
	<cfparam name="selectbanner.bannerType" default="" >
	<cfparam name="selectbanner.link" default="" >
	<!---<cfset isid = 0 >--->
</cfif>--->