<cfcomponent>
	<cffunction name="fileServerPath" access="public" returntype="string">
		<cfargument name="fileType" required="yes" type="numeric" default="0" />
		<cfargument name="filePurposeID" required="yes" type="numeric" default="0" />
        
		<!---- SET ROOT PATH LOCATION --->
        <cfswitch expression="#fileType#">
            <cfcase value="152">
                <cfset ServerRootPath = "G:\Websites\my-office\">
            </cfcase>
            
            <cfcase value="151">
                <cfset ServerRootPath = "G:\Websites\petro21\">
            </cfcase>
            
            <cfcase value="150">
                <cfset ServerRootPath = "G:\Websites\petro21\">
            </cfcase>
        </cfswitch>

        <!---- SET DIRECTORY LOCATION --->
        <cfswitch expression="#filePurposeID#">
            <cfcase value="171">
                    <cfset Directory = "_files\downloads" >
            </cfcase>

            <cfcase value="175,176" delimiters=",">
                    <cfset Directory = "_files\client" >
            </cfcase>

            <cfcase value="178, 187" delimiters=",">
                    <cfset Directory = "_files\business" >
            </cfcase>

            <cfcase value="183">
                    <cfset Directory = "_files\contracts" >
            </cfcase>

            <cfcase value="170,172,173,174,179, 184, 185, 186, 188, 189,191,192" delimiters=",">
                    <cfset Directory = "_files\conference" >
            </cfcase>
            
            <cfcase value="190,193">
                    <cfset Directory = "_files\notices" >
            </cfcase>
        </cfswitch>

        <cfscript>
			filepath = ServerRootPath & Directory;
		</cfscript>
        <cfreturn filepath>
	</cffunction>
</cfcomponent>