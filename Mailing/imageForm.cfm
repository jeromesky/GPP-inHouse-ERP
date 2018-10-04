<cfinclude template="../Application.cfm">

<cfif parameterexists(form.filename) >
  <cfif FileExists("G:\Websites\petro21\htdocs\post\templates\#form.filename#")>
    <CFFILE ACTION="DELETE" FILE="G:\Websites\petro21\htdocs\post\templates\#trim(form.filename)#">
  </cfif>
            
<CFFILE ACTION="Upload" FILEFIELD="form.filename" DESTINATION="G:\Websites\petro21\htdocs\post\templates" nameconflict="MAKEUNIQUE">
<cfelse>            

<cfoutput><table width="100%" border="0" cellspacing="4" cellpadding="4" style="color:##333333">
  <tr>
    <td colspan="3"><h1>Load image <span class="headermini">...</span></h1></td>
  </tr>
  <tr>
    <td width="133">Select template file</td>
    <td width="300"><input type="file" name="filename" id="filename" /><br></td>
    <td><input type="submit" name="Submit" value="Upload" /></td>
  </tr>
</table></cfoutput>
</cfif>