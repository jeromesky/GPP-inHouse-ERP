<cfcomponent>

	<cffunction name="fileServerPath" access="public" returntype="string">

		<cfargument name="fileType" required="yes" type="numeric" default="0" />
		<cfargument name="filePurposeID" required="yes" type="numeric" default="0" />
        
		<!--- SET ROOT PATH LOCATION --->
        <cfswitch expression="#fileType#">
            <cfcase value="152">
                <cfset ServerRootPath = "http://www.petro21.com/my-office/">
            </cfcase>
            
            <cfcase value="151">
                <cfset ServerRootPath = "http://www.petro21.com/">
            </cfcase>
            
            <cfcase value="150">
                <cfset ServerRootPath = "http://www.petro21.com/">
            </cfcase>
        </cfswitch>

        <!--- SET DIRECTORY LOCATION --->
        <cfswitch expression="#filePurposeID#">
            <cfcase value="171">
                    <cfset Directory = "_files/downloads/" >
            </cfcase>
            
            <cfcase value="175,176" delimiters=",">
                    <cfset Directory = "_files/client/" >
            </cfcase>
            
            <cfcase value="178">
                    <cfset Directory = "_files/business/" >
            </cfcase>
            
            <cfcase value="183">
                    <cfset Directory = "_files/contracts/" >
            </cfcase>
            
            <cfcase value="170,172,173,174,179, 184, 185" delimiters=",">
                    <cfset Directory = "_files/conference/" >
            </cfcase>
        </cfswitch>
        
        <cfscript>
			filepath = ServerRootPath & Directory;
		</cfscript>

        <cfreturn filepath>
	</cffunction>

</cfcomponent>