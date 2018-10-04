<cfinclude template="../Application.cfm">

<cfif parameterexists(form.id)>
	<cfquery datasource="#gpp#" name="doit" >
    	UPDATE tblConference_Registration
        SET
        	<cfif parameterexists(form.chkDiscount)>
            	chkDiscount = <cfif listfind( "yes,1,on", form.chkDiscount, ",") >1<cfelseif listfind( "no,0,off", form.chkDiscount, ",") >0</cfif>
            <cfelseif parameterexists(form.chkCompGuest)>
            	chkCompGuest = <cfif listfind( "yes,1,on", form.chkCompGuest, ",") >1<cfelseif listfind( "no,0,off", form.chkCompGuest, ",") >0</cfif>
            <cfelseif parameterexists(form.formSent)>
            	formSent = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#" >
            </cfif>
        WHERE IngClient_Conf_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
	</cfquery>
        	<cfif parameterexists(form.chkDiscount)>
            	<cfif listfind( "yes,1,on", form.chkDiscount, ",") >Yes<cfelseif listfind( "no,0,off", form.chkDiscount, ",") >No</cfif>
            <cfelseif parameterexists(form.chkCompGuest)>
            	<cfif listfind( "yes,1,on", form.chkCompGuest, ",") >Yes<cfelseif listfind( "no,0,off", form.chkCompGuest, ",") >No</cfif>
            <cfelseif parameterexists(form.formSent)>
            	yes
            </cfif>
</cfif>