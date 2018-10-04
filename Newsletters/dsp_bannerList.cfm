<cfinclude template="../Application.cfm">
<cfif form.bannerType eq 1 >
	<cfset bannerplace = "buttongpp">
<cfelseif form.bannerType eq 2 >    
    <cfset bannerplace = "button">
<cfelseif form.bannerType eq 3 >    
    <cfset bannerplace = "skyscraper">
<cfelseif form.bannerType eq 4 >    
    <cfset bannerplace = "vertical">
<cfelseif form.bannerType eq 10 >    
    <cfset bannerplace = "corporate">
<cfelseif form.bannerType eq 11 >    
    <cfset bannerplace = "bannertop">
</cfif>

<cfif form.bannerType eq 1 or form.bannerType eq 11>
        <cfquery name="get" datasource="#dsnP21#">
        SELECT     newsletter_banners.*, events.event_name AS name
		FROM      newsletter_banners LEFT OUTER JOIN
                  events ON newsletter_banners.company = events.id
        WHERE 
        	newsletter_banners.bannerType = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.bannerType#"> 
            AND eventdate > #now()#
        </cfquery>
        
<cfelseif form.bannerType eq 2 or form.bannerType eq 3 or form.bannerType eq 4 or form.bannerType eq 10>
        <cfquery name="get" datasource="#dsnP21#">
         	SELECT     newsletter_banners.*, logos.company AS name
			FROM         newsletter_banners LEFT OUTER JOIN
                  logos ON newsletter_banners.company = logos.id
        WHERE 
        	newsletter_banners.bannerType = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.bannerType#"> 
            AND eventdate > #now()#
        </cfquery>
</cfif>

<script type="text/javascript">
		function loadbannerToPlace(bannerid, bannerplace, bannerType, newsletter){
			$.post("newsletter_addbanner.cfm", { bannerid: bannerid, bannerplace: bannerplace, bannerType: bannerType, newsletter: newsletter }, function(data){ 
			$('<div></div>').appendTo("#"+bannerplace+"").load("newsletter_getBanner.cfm", { bannerid: bannerid, bannerplace: bannerplace, bannerType: bannerType , newsletter: newsletter});
			 });
		}
</script>	
<table border="0" cellspacing="1" cellpadding="4" width="100%">
  <tr bgcolor="#B8D9FF">
    <td width="100">Banner end date</td>
    <td width="200">Description</td>
    <td width="300">Event / Company&nbsp;</td>
    <td>View banner</td>
    <td width="25">Edit</td>
    <td width="20">Del</td>
  </tr>
  <cfoutput query="get"><tr onMouseOver="style.backgroundColor='##D8E2F9';" onMouseOut="style.backgroundColor='##ffffff';" id="rec_#get.id#">
    <td>#dateFormat(get.eventdate, "dd mmm yyyy")#</td>
    <td>#get.title#</td>
    <td>#get.name#</td>
    <td>#get.img#</td>
    <td><a href="javascript:loadform(#get.id#);"><img src="../img/newS_edit.gif" border="0"  /></a></td>
    <td><a href="javascript:deleteRecord(#get.id#, 'newsletter_banners');"><img src="../img/new_delete.gif" border="0" /></a></td>
  </tr></cfoutput>
</table>
<cfif get.recordcount EQ 0>No banners to select</cfif>