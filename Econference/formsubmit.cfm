<cfinclude template="../Application.cfm">

<cfif parameterexists(form.speakerid) >
	
	
	<cfif form.docsfilename NEQ "">
    	<CFFILE ACTION="Upload" FILEFIELD="form.docsfilename" DESTINATION="G:\Websites\petro21\htdocs\econf\" NAMECONFLICT="MakeUnique">
        <cfset newname = replace(File.ServerFile, " ", "_", "ALL") >
        <cffile action="rename"  source="G:\Websites\petro21\htdocs\econf\#File.ServerFile#"  destination="G:\Websites\petro21\htdocs\econf\#newname#">
    </cfif>	
    
        <cfquery datasource="#dsnP21#"  name="newFile">
            INSERT INTO docs ( speaker <cfif form.docsfilename NEQ "">, docsfilename</cfif>)
            VALUES(#form.speakerid# <cfif form.docsfilename NEQ ""> , '#newname#' </cfif>)
            SELECT @@IDENTITY AS id
        </cfquery>
		
        <cfquery datasource="#dsnP21#"  name="file">
            SELECT id, docsfilename,  currency, cost
            FROM docs 
            WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#newFile.id#" >
        </cfquery>
    
   <cfoutput>
<div id="file_#file.id#">
<table  border="0" cellspacing="0" cellpadding="0" width="100%"  onMouseOver="style.backgroundColor='##f2faff';" onMouseOut="style.backgroundColor='##ffffff';">
  <tr>
    <td width="20"><a href="javascript:DeleteFile(#file.id#);"><img src="../img/erro_crossr.gif" width="16" height="16" border="0" /></a></td>
    <td>#file.docsfilename#</td>
    <td width="450">
              		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="height:30px">
                      <tr>
                      	 <td ><strong>Global Knowledge Base File</strong></td>
                        <td width="60"><div id="rateFile_#file.id#" class="rating">&nbsp;</div></td>
                        <td width="160">#file.currency# <span class="edit_price" id="#file.id#">#numberformat(trim(file.cost), "9999.99")#</span></td>
                      </tr>
                    </table>
    </td>
  </tr>
</table>
						 <script type="text/javascript">
                        $(document).ready(function() {
                            $('##rateFile_#file.id#').rating('rating.cfm?id=#file.id#', {maxvalue:1 });
                        });
                        </script> 
</div>
</cfoutput>
    
    
    
</cfif>

