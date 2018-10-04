<cfinclude template="../Application.cfm">
<script type="text/javascript" >

$("#Title").charCounter(80, {	format: "%1 of 80"});
$("#Blurb").charCounter(300, {	format: "%1 of 300"});
$(document).ready(function() {
	loadSpeakerDropMenu();
});
</script>
<cfif parameterexists(form.Title) >

				<cfif form.Filename NEQ "" >
						<CFFILE ACTION="Upload" FILEFIELD="form.Filename" DESTINATION="G:\Websites\petro21\htdocs\Columnist\files" nameconflict="MAKEUNIQUE">
                        <cfset newname = replace(File.ServerFile, " ", "_", "ALL") > 
                    	<cffile action="rename"  source="G:\Websites\petro21\htdocs\Columnist\files\#File.ServerFile#"  destination="G:\Websites\petro21\htdocs\Columnist\files\#newname#">
				</cfif>
                
						<cfquery datasource="#dsnP21#" name="getTheme">
                        INSERT INTO  Columnist_list ( Person, <cfif form.Filename NEQ "" >Filename,</cfif> insertDate, Title, submitDate, Blurb )
                        VALUES(#form.Person#, <cfif form.Filename NEQ "" >'#newname#',</cfif> <cfqueryparam cfsqltype="cf_sql_date" value="#now()#" >, '#trim(form.Title)#',  <cfqueryparam cfsqltype="cf_sql_date" value="#form.submitDate#">, '#trim(form.Blurb)#' )
                        SELECT @@IDENTITY AS NEWID
                        </cfquery>
                         <cfquery name="getspeaker" datasource="#dsnP21#">
                              SELECT name  , delegation, photo
                              FROM speakers
                              WHERE id = #form.Person#
						</cfquery>  
  <cfoutput>
<div id="row_#getTheme.newid#" style="border:1px solid ##F3DFD1;  border-bottom:1px solid ##FFFFFF" >
        <table width="100%" border="0" cellspacing="0" cellpadding="10">
  <tr>
    <td width="100" align="center" valign="middle"><img src="http://www.petro21.com/speakers/photos/#getspeaker.photo#" /></td>
    <td valign="top"><strong>#form.Title#</strong><br />
    #getspeaker.name#, #getspeaker.delegation#<br  /><br />
   <blockquote> #form.Blurb#</blockquote><br  /><br />
    #dateFormat(form.submitDate, "dd mmm yyyy")#
    
    </td>
    <td width="20" valign="top" align="right"><a href="javascript:Delete_File(#getTheme.newid#);"><img src="../img/newS_delete.gif" width="14" height="14" /></a>    </td>
  </tr>
</table>
		</div>
</cfoutput>
<cfelse> 
                <!---<cfquery datasource="#dsnP21#" name="getconference">
                SELECT id, name
                FROM speakers 
                ORDER BY name
                </cfquery>--->
                <cfoutput>
<fieldset >
	<legend >Add  new </legend>               
                 <table width="100%" border="0" cellspacing="2" cellpadding="2">
                  
                  <tr>
                    <td width="250" >Select Speaker </td>
                    </tr>
                  <tr>
                    <td>
                    	<div id="areaSpeakerList">

                            </div>
                    </td>
                    </tr>
                  <tr>
                    <td>Speaker not on list <a href="javascript:Load_NewSpeakers();">Add speaker</a><div id="quickSpeaker"></div></td>
                  </tr>
                  
                  <tr>
                    <td>Title</td>
                    </tr>
                  <tr>
                    <td><input type="text" name="Title" id="Title" /></td>
                    </tr>
                  <tr>
                    <td>Blurb</td>
                    </tr>
                  <tr>
                    <td><textarea type="text" name="Blurb" id="Blurb" style="width:420px; height:50px"/></textarea></td>
                    </tr>
                  <tr>
                    <td>File Creation Date, not uploaded date</td>
                    </tr>
                  <tr>
                    <td><input type="text" name="submitDate" id="submitDate" />  <img src="../img/calendar_24.gif" border="0" onClick="scwShow(scwID('submitDate'),event,3);" /></td>
                  </tr>
                  <tr>
                    <td>Upload File</td>
                  </tr>
                  <tr>
                    <td><input type="file" name="Filename" id="Filename" /></td>
                    </tr>
                  <tr>
                    <td><button>Save </button> <span id="loadBar"></span></td>
                    </tr>
                </table>
 </fieldset>              
</cfoutput>
</cfif>