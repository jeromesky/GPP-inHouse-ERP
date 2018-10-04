<cfinclude template="../Application.cfm" >

<cfif parameterexists(form.id)>
<cfquery datasource="#dsnP21#" name="getData">
  SELECT * 
  FROM 
    MailOut_template 
  WHERE 
    id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>
            
<cfset id = getData.id  >
 <!--- get the field values ---->
			<cfif parameterexists(form.filename) >
            
                            <cfif getData.filename NEQ "" AND FileExists("G:\Websites\petro21\post\templates\#filename#")>
                            <CFFILE ACTION="DELETE" FILE="G:\Websites\petro21\post\templates\#trim(getData.filename)#">
                            </CFIF>
            
                            <CFFILE ACTION="Upload" FILEFIELD="form.filename" DESTINATION="G:\Websites\petro21\post\templates" nameconflict="MAKEUNIQUE">
                            <cfset newname = "template#getData.id#.#file.clientFileExt#">
                            <cffile action="rename"  source="G:\Websites\petro21\post\templates\#File.ServerFile#"  destination="G:\Websites\petro21\post\templates\#newname#">
                
                            <cfquery datasource="#dsnP21#">
                                UPDATE MailOut_template SET 
                                name = '#form.name#',
                                filename = '#newname#'
                                WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#getData.id#">
                            </cfquery>
            </cfif>
<cfelse>
                            <cfquery datasource="#dsnP21#" name="InsertData">
                             INSERT INTO MailOut_template (templatetype)
                             VALUES (1) 
                             SELECT @@Identity AS id</cfquery>
                            
                            <cfquery datasource="#dsnP21#" name="getData">
                            SELECT * 
                            FROM MailOut_template 
                            WHERE  id = <cfqueryparam cfsqltype="cf_sql_integer" value="#InsertData.id#">
                            </cfquery>
</cfif>

<cfoutput>
<script type="text/javascript">
$(document).ready(function() { //form for the file upload
		$('##FormTemplate').submit(function() { 
				$(this).ajaxSubmit({ success: fileloaded, clearForm: true });
				return false; 
		});
});
function fileloaded(){
	$("##areaTemplate").html("");
	loadTemplateList();
}
</script>
   <table width="100%" border="0" cellspacing="4" cellpadding="4" style="color:##333333">
                <tr>
                  <td colspan="3"><h1>Load new template <span class="headermini">...</span></h1> </td>
                </tr>
                <tr>
                  <td>Description name</td>
                  <td width="300"><input type="text" name="name" id="name" value="#getData.name#"></td>
                  <td >&nbsp;</td>
                </tr>
                <tr>
                  <td width="133">Select template file</td>
                  <td><input type="file" name="filename"  id="filename" />
                  <input type="hidden" name="id" value="#getData.id#" /><br>#getData.filename#</td>
                  <td><input type="submit" name="Submit" value="Upload" /></td>
                </tr>
    </table>
</cfoutput>