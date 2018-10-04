<cfparam name="form.printStatus" default="screan">
<cfinclude template="qry_program.cfm">
<cfscript>
	dateNow     	= dateFormat(now(), "dd-mm-yy");
	dir		      	= '_files\temporary\';
	webOfficePath 	= 'http://www.petro21.com/my-office/_files/temporary/';
	extension       = '';
	eventCfc		= createObject("component", "Officecfc.eventName");
	fileName		= #replace(eventCfc.eventName(form.eventID), " ", "_", "ALL")#;
	eventName		= #eventCfc.eventName(form.eventID)#;
</cfscript>

<cfif form.printStatus EQ "excel">
		<cfset extension = ".xls">
        <cfspreadsheet action="write" filename="#officePath##dir##fileName#_#dateNow##extension#" overwrite="true" query="qry_program">
        <cfoutput><a href="#webOfficePath##fileName#_#dateNow##extension#" target="_blank">click here  to download file</a><br /></cfoutput>
     
<cfelseif form.printStatus EQ "basic">
		<cfset extension = ".pdf">
        <cfinclude template="dsp_printFull.cfm">
        <cfoutput><a href="#webOfficePath##fileName#_#dateNow#.pdf" target="_blank">click here to download file</a><br /></cfoutput>

<cfelseif form.printStatus EQ "full">
		<cfset extension = ".pdf">
        <cfdocument format="pdf" pagetype="A4" marginbottom="0.4" margintop="0.4" marginleft="0.04" marginright="0.04" 
        filename="#officePath##dir##fileName#_#dateNow#.pdf" overwrite="yes" orientation="landscape">
            <cfdocumentsection>
                <cfinclude template="dsp_printFull.cfm">
            </cfdocumentsection>
        </cfdocument>
	  <cfoutput> <a href="#webOfficePath##fileName#_#dateNow#.pdf" target="_blank">click here to download file</a> <br /></cfoutput>
 
<cfelseif form.printStatus EQ "screan">
		<cfoutput>
            <cfinclude template="dsp_screen.cfm">
        </cfoutput>
</cfif>

<!--- <CFHEADER NAME="Content-Disposition" VALUE="inline; filename=Program_#dateformat(now(), "yyyy-mm-dd")#.xls" ><CFCONTENT TYPE="application/vnd.msexcel">	<cfinclude template="dsp_excel.cfm"></CFCONTENT>--->
	<!---<cfinclude template="dsp_excel.cfm">--->
	<!---<cfdocument format="pdf" pagetype="A4" marginbottom="0.4" margintop="0.85" marginleft="0.01" marginright="0.01" filename="#officePath##dir##fileName#_#dateNow#.pdf" overwrite="yes" orientation="landscape" ></cfdocument>--->
	<!---<cf_event_name eventID="#form.eventID#">--->