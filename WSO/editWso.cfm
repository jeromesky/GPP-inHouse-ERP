        <cfinclude template="../Application.cfm">
<cfif parameterexists(form.wso_name)>
<cfquery datasource="#dsnP21#"  >
UPDATE events
SET	wso_name	= '#form.wso_name#',
	wso_currency= '#form.wso_currency#',
    wso_cost	= <cfqueryparam value="#trim(form.wso_cost)#" cfsqltype="CF_SQL_MONEY4">,
    wso_descr	= '#form.wso_descr#',
    wsoID		= '#form.wsoID#'
WHERE id = #url.id#
</cfquery>
</cfif>        
  
        <cfset yearnow 	= (year(now()) - 1) >
        <cfset monthnow = month(now()) >
        <cfset daynow 	= day(now()) >
       <cfset dateback = CreateDate(yearnow, monthnow, daynow )  >
        
        <cfquery datasource="#dsnP21#" name="get">
		SELECT id, wso_name, wso_currency, wso_cost, wso_descr, wsoID FROM events WHERE id = #id#
		</cfquery>
        <cfquery datasource="#dsnP21#" name="getevents">
		SELECT id, event_name, event_year FROM events WHERE  event_expire > #dateback# AND  event_type = 'EB'<!--- WHERE id IN (#get.wsoID#) AND --->
		</cfquery>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
</head>

<body <cfif parameterexists(form.wso_name)>onload="javascript:parent.window.hs.closeId('wso<cfoutput>#url.id#</cfoutput>')"</cfif>>

    	<div class="sectionHeader">World Strategy Online</div>
    	<div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>
        <form  method="post" action="editWso.cfm?id=<cfoutput>#url.id#</cfoutput>">
       <cfoutput query="get">
        <table width="400" border="0" cellspacing="3">
          <tr>
            <td>Wso Name</td>
            <td><input type="text" name="wso_name" style="width:300px" value="#wso_name#" /></td>
          </tr>
          <tr>
            <td>Wso Descr</td>
            <td><textarea name="wso_descr" style="width:300px">#wso_descr#</textarea>
            </td>
          </tr>
          <tr>
            <td>Currency</td>
            <td><select name="wso_currency">
              <option value="&pound;" >UK - &pound;</option>
            </select>
            </td>
          </tr>
          <tr>
            <td>Cost</td>
            <td><input type="text" name="wso_cost" value="#trim(numberformat(wso_cost, "999999.99"))#" /></td>
          </tr>
          <tr>
            <td>Event to link to this Strategy Briefing<input type="hidden" name="id" value="#id#" /></td>
            <td><select name="wsoID" multiple="multiple" style="width:300px">
            	<cfloop query="getevents">
                <option value="#getevents.id#" <cfif ListCONTAINS(get.wsoID, getevents.id , ",")>selected</cfif>  >#getevents.event_name# #getevents.event_year#</option>
                </cfloop>
            </select>
            </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td align="right"><input type="submit" name="button" value="Submit" /></td>
          </tr>
        </table></cfoutput>
        </form>
</body>
</html>