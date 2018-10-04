<cfinclude template="../application.cfm">
<!---<cfdump var="#session#">--->

<cfset applicationName = "adminp21" >
<!---<cfapplication name="adminp21">
<cfset request.overallTotal = 0 />--->
<!---<cfloop collection="#application#" item="applicationName"></cfloop>--->
			<cfscript>
            sessiontrackerObj= createObject("java","coldfusion.runtime.SessionTracker");
            activesessions = sessiontrackerObj.getSessionCollection("#applicationName#");
            nosessions=ListLen(structkeyList(activeSessions));
      </cfscript>
			<cfdump var="#activesessions#">
		<!---	<cfloop list="#activesessions#" index="i">
            	#i#<br>
            </cfloop>--->
			<cfif nosessions>
            <cfoutput>
            <h3>Total Sessions for  #nosessions#</h3>
            </cfoutput>
            <cfif structKeyExists(url,"showSessions")>
            <cfdump var="#activesessions#"></cfif>
            </cfif>
<!---<cfset request.overallTotal = request.overallTotal + nosessions />--->

<h3 style="position:absolute; top:0; right:0; width:200px;">OVERALL SESSIONS: <!---<cfoutput>#request.overallTotal#</cfoutput>---></h3>

<!---<ul>
    <li>#getUnpaidInvoices.ContactName#</li>
    <li>#getUnpaidInvoices.Company#</li>
    <li>invoice : #getUnpaidInvoices.InvoiceNo_LNK#</li>
</ul>

<cfloop collection="#form#" item="fname">
<cfif #fname# EQ "EMAILADDR" OR #fname# EQ "SUBMIT.Y" OR #fname# EQ "SUBMIT.X" OR #fname# EQ "SUBMIT2.Y" Or #fname# EQ "CFID" Or #fname# EQ "SUBMIT2.X" Or #fname# EQ "SUBMIT2.X" Or #fname# EQ "CFTOKEN" Or #fname# EQ "FIELDNAMES" Or #fname# EQ "PAGE" OR #fname# EQ "PASSWORD"> <cfelse><cfset thelinks = #fname#& "=" & #form[fname]# & "&" & thelinks ></cfif>
</cfloop>	--->