<cfinclude template="../Application.cfm">
<cfif form.submit EQ "delete">
<CFLOOP INDEX="LoopCount" FROM="1" TO="#form.numrecords#">
  <cfif IsDefined("form.checkbox#LoopCount#") is "True">
    <cfif #Evaluate("form.checkbox#LoopCount#")# IS "ok"> 
      <cfquery datasource="#dsnP21#" >
	  SET ANSI_WARNINGS OFF
	   DELETE
	    FROM registrations
		WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#Evaluate("form.id#LoopCount#")#">
		SET ANSI_WARNINGS On
     </cfquery> 
    </cfif> 
  </cfif> 	
</CFLOOP>
</cfif>

<cfif parameterexists(url.id)>
<cfquery name="getTrans" datasource="#dsnP21#">

</cfquery>
<cftry>
	<cfmail	  
		to="#sendlist.name# #sendlist.surname# <#sendlist.emailAddr#>" 
		from="#gettext.emailfrom#"
  		subject="#gettext.subject#"
   		type="html">
		<cfmailparam file="G:\websites\petro21\htdocs\docs\##">
  	<!--- <cfmailParam name="Reply-To" value="gettext.emailfrom#?subject=Re: #sendlist.emailAddr# ~ #sendlist.name# #sendlist.surname#"> --->
  		
  	</cfmail>
<cfcatch>
<cfmail to="#contactAdmin#"  from="#contactFrom#" SUBJECT="error sending from mail system(#dateFormat(datenow, "yy/mm/dd")#) ">#lcase(sendlist.emailAddr)#</cfmail>
</cfcatch>
</cftry>

<cfmail to="#contactAdmin#"  CC="duncan@glopac.com" from="#contactFrom#" SUBJECT="Sent: #dateFormat(datenow, "yy/mm/dd")#  #counter#">sent  email OK!</cfmail>
<cfabort>

</cfif>

<cflocation url="list_transaction_error.cfm" >

