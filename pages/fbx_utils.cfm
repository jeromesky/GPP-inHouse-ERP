<!--- Example Utility Function (optional) --->
<cffunction name="fbxUrl" output="No">
<!--- Create a typical fuse-action call. Wrapped in a function to make conversion to other FB frameworks easier. 
  Append URL parameters to result as needed. Example: fbxUrl('foo') & '&bar=7' Note that this may not work in POST mode.--->
    <cfargument name="p_fuseaction" default="">
    <cfset var result=''>
    <cfset result = '?fa=' & trim(p_fuseaction)>
    <cfreturn result>
</cffunction>