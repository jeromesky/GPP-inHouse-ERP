<cfinclude template="qry_packages.cfm">

<cfoutput>
	<cfloop query="qryPackages">
    	<cfif qryPackages.tasks NEQ ""><li class="listNotification"><span class="listNotificationIcon"></span><cfelse><li></cfif>
        <a href="javascript:loadpackage(#qryPackages.packagesID#);">#qryPackages.event_name# <span class="fontGrey80">(#qryPackages.typeLabel#)</span></a></li></cfloop>
</cfoutput>