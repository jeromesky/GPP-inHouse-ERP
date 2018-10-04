<cfinclude template="../Application.cfm">

<cfoutput>
<cfquery datasource="#dsnP21#" name="getFiles">
	SELECT id, docsfilename, currency, cost, GKB FROM docs WHERE speaker = <cfqueryparam cfsqltype="cf_sql_integer" value="#get.id#">
</cfquery>

<cfloop query="getFiles">
<div id="file_#getFiles.id#">
<table  border="0" cellspacing="0" cellpadding="0" width="100%" onMouseOver="style.backgroundColor='##f2faff';" onMouseOut="style.backgroundColor='##ffffff';" >
  <tr>
    <td width="20"><a href="javascript:DeleteFile(#getFiles.id#)"><img src="../img/erro_crossr.gif" width="16" height="16" border="0" /></a></td>
    <td>#getFiles.docsfilename#</td>
    <td width="450">
    <cfif getevent.event_type EQ "event" >
              		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="height:30px">
                      <tr>
                      	 <td ><strong>Global Knowledge Base File</strong></td>
                        <td width="60"><div id="rateFile_#getFiles.id#" class="rating">&nbsp;</div></td>
                        <td width="160">#getFiles.currency# <span class="edit_price" id="#getFiles.id#">#numberformat(trim(getFiles.cost), "9999.99")#</span></td>
                      </tr>
                    </table>
   </cfif>
    </td>
  </tr>
</table>
 </cfloop>
 <script type="text/javascript">
$(document).ready(function() {
	<cfloop query="getFiles"> 
	$('##rateFile_#getFiles.id#').rating('rating.cfm?id=#getFiles.id#', {maxvalue:1 <cfif getFiles.GKB eq 1 >,  curvalue:1 </cfif>});
	</cfloop>
});
</script> 
</div>
</cfoutput>

<!---
#url.id#

<cfif parameterexists(url.delete)>
		<cfquery datasource="#dsnP21#" name="getfile">SELECT docsfilename FROM docs WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.delete#"> </cfquery>
			<cfif  FileExists("G:\Websites\petro21\htdocs\econf\#getfile.docsfilename#")>
				<CFFILE ACTION="DELETE" FILE="G:\Websites\petro21\htdocs\econf\#getfile.docsfilename#">
			</CFIF>
        <cfquery datasource="#dsnP21#" >DELETE FROM docs WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.delete#"> </cfquery>
    		
<cfelse>
</cfif>
--->