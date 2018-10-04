<cfinclude template="../Application.cfm" >
<cfobjectcache action="clear">
 <cfcache action="flush">
 
<!--- <cfinvoke component="cfide.adminapi.administrator" method="login">
			<cfinvokeargument name="adminPassword" value="60860202">
		</cfinvoke>
		<!--- clear template cache --->
<cfinvoke component="cfide.adminapi.runtime" method="clearTrustedCache">--->
<!---  <cfinvoke component="cfide.adminapi.runtime" method="clearTrustedCache">
<cfscript>
 variables.factory = createobject("java","coldfusion.server.ServiceFactory");
 variables.runtime = factory.getRuntimeService();
 variables.runtime.setTrustedCache(FALSE);
</cfscript>--->