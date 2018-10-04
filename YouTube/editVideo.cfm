<cfinclude template="../Application.cfm">
<cfif parameterexists(form.description)>
	<cfquery datasource="#dsnP21#">
	UPDATE youtubeVideo
	SET description 	= '#form.description#',
    insertdate		 	= <cfqueryparam value="#trim(form.insertdate)#" cfsqltype="cf_sql_date">, 
  <!---  link 				= '#form.link#',--->
    category			= #form.category#
	WHERE id = #url.id#

	</cfquery>
<cfelse>
	<cfquery datasource="#dsnP21#" name="get">SELECT * FROM youtubeVideo WHERE id = #url.id#</cfquery>
</cfif>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type='text/JavaScript' src='../javascript/scw.js'></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<cfif parameterexists(form.description)>
<body onload="javascript:parent.window.hs.closeId('videoEdit<cfoutput>#url.id#</cfoutput>')" >
<cfelse>
<body >
    <div class="sectionHeader">Edit Video</div>
    <div style="margin:2px 0 15px 0 ; border-bottom:1px dotted #336699"></div>
    <form id="form1" name="form1" method="post" action="editVideo.cfm?id=<cfoutput>#url.id#</cfoutput>">
<cfoutput query="get">
      <table width="400" border="0" cellspacing="4">
        <tr>
          <td width="112">Video Title</td>
          <td colspan="2"><label>
            <input type="text" name="description" value="#description#" maxlength="150" />
          </label></td>
        </tr>
        <tr>
          <td>Video Date</td>
          <td><input type="text" name="insertdate" value="#dateformat(insertdate, "dd mmm yyyy")#"  />
              <img src="../img/calendar_24.gif"  border="0" onclick="scwShow(scwID('insertdate'),event,3);" /></td>
          <td>&nbsp;</td>
        </tr>
<!---        <tr>
          <td>Video Link</td>
          <td width="224">
            <input type="text" name="link" value="#trim(link)#" />
          </td>
          <td width="42">&nbsp;</td>
        </tr>--->
        <tr>
          <td>Category</td>
          <td><cfquery datasource="#dsnP21#" name="getCat">
      SELECT id, name FROM youTubCategory ORDER BY id desc
      </cfquery>
              <select name="category" id="select">
                <cfloop query="getCat">
                  <cfoutput><option value="#getCat.id#" <cfif getCat.id EQ get.category> selected</cfif> >#getCat.name#</option></cfoutput>
                </cfloop>
              </select>
          </td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><input type="submit" name="button2" id="button2" value="Submit" />
          </td>
          <td>&nbsp;</td>
        </tr>
      </table>
 </cfoutput>
    </form> 
     
</cfif></body>
</html>