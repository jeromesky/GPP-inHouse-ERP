<!--- Kill extra output. --->
<cfsilent>

<!---
	Define function that will recursively search a struct and it's nested elements for keys that should
	be considered secure and blacked out.
--->
<cffunction name="MakeStructSecure"
            access="public"
            returntype="any"
            output="false"
            hint="Does a very cursory job of cleaning up a struct by blacking out secure information.">
    
    <!--- Define argumets. --->
    <cfargument name="Struct"
                type="struct"
                required="true"
                hint="The struct we are going to clean."/>
    
    <cfargument name="Depth"
                type="numeric"
                required="false"
                default="1"
                hint="The depth of the current search - this will stop the function from looping infinitely." />
    
    <!--- Define the local scope. --->
    <cfset var LOCAL = StructNew() />
    
    <!--- Check to see if we have reached our max depth for this search. --->
    <cfif (ARGUMENTS.Depth GTE 5)>
    
    <!--- You're going too deep, it hurts! We might be looping in a circular struct reference. --->
    <cfreturn />
    
    </cfif>
    
    <!--- ASSERT: If we have made it this far, then we have to check all the struct keys at this level. --->
    
    <!--- Define the list of keys that would be considered to hold secure data. --->
    <cfsavecontent variable="LOCAL.SecureKeys">
        CreditCard
        CCNumber
        CCNum
        ExpirationDate
        Expry
        ExpDate
        CCExp
    </cfsavecontent>
    
    <!--- Loop over the struct looking for keys that would flag secure data to be removed. --->
    <cfloop item="LOCAL.Key" collection="#ARGUMENTS.Struct#">
    
    <!--- Check to see if the key is to be considered secure AND that the value in it is simple. --->
    <cfif (FindNoCase( LOCAL.Key, LOCAL.SecureKeys ) AND IsSimpleValue( ARGUMENTS.Struct[ LOCAL.Key ] ))>
    
    <!--- Black out value. --->
    <cfset ARGUMENTS.Struct[ LOCAL.Key ] = RepeatString("*", Len( ARGUMENTS.Struct[ LOCAL.Key ] ) ) />
    
    <!--- Check to see if this key is a struct that we might have to search through. --->
    <cfelseif IsStruct( ARGUMENTS.Struct[ LOCAL.Key ] )>
    
    <!--- Recurse through this one. Be sure to send through a new depth value so we don't loop forever. --->
    <cfset MakeStructSecure( Struct = ARGUMENTS.Struct[ LOCAL.Key ], Depth = (ARGUMENTS.Depth + 1) ) />
    
    </cfif>

    </cfloop>
    
    <!--- Return out. --->
    <cfif (ARGUMENTS.Depth EQ 1)>
    
    <!--- Return the cleaned struct. --->
    <cfreturn ARGUMENTS.Struct />

    <cfelse>
    <cfreturn />
    </cfif>
</cffunction>

<!---
	Check to see if the error object exists. Even though we have landed on this page, it is possible that
	someone called it directly without throwing an erorr. The error object only exists if an error was caught.
--->
<cfif StructKeyExists( VARIABLES, "Error" )>

<!---
	Mail out the error data (and whatever other scopes you would like to see at the time of th error). When
	you CFDump out the objects, make them Secure AND also be sure to use a TOP attribute when appropriate
	so that the CFDump doesn't recurse forever.
--->

<cfmail to="jason@glopac.com" cc="jerome@glopac.com" from="error@petro21.com" subject="Web Site Error: #VARIABLES.Error.Template#" type="html">
    <p>An error occurred at #DateFormat( Now(), "yyyy-mm-dd" )# at #TimeFormat( Now(), "hh:mm TT" )#<br/>
    on page #CGI.CF_TEMPLATE_PATH#
    
    <h3>Error</h3>
    <cfdump var="#MakeStructSecure(VARIABLES.Error)#" label="Error object." />
    
    <h3>CGI</h3>
    <cfdump var="#MakeStructSecure(CGI)#" label="CGI object" />
    
    <h3>REQUEST</h3>
    <cfdump var="#MakeStructSecure(REQUEST)#" label="REQUEST object" top="25" />
    
    <h3>FORM</h3>
    <cfdump var="#MakeStructSecure(FORM)#" label="FORM object" top="25" />
    
    <h3>URL</h3>
    <cfdump var="#MakeStructSecure(URL)#" label="URL object" top="25" />
    
    <h3>SESSION</h3>
    <cfdump var="#MakeStructSecure(SESSION)#" label="SESSION object" top="25" />
    ---END---
</cfmail>

</cfif>

<!---
	When setting the header information, be sure to put it in a CFTry / CFCatch. We can only send header
	information if the site has NOT already been flushed to the browser. Also set a flag so that we know if
	information has been committed.
--->
<cfset REQUEST.RequestCommitted = false />

<cftry>
<!--- Set the status code to internal server error. --->
<cfheader statuscode="500" statustext="Internal Server Error" />

<!--- Set the content type. --->
<cfcontent type="text/html" reset="true" />

<!--- Catch any errors. --->
<cfcatch>

<!--- There was an error so flag the request as already being committed. --->
<cfset REQUEST.RequestCommitted = true />

</cfcatch>
</cftry>

</cfsilent>

<!---
	Check to see if the request has been committed. If it has, then it means that content has already been committed
	to the browser. In that case, we are gonna want to refresh the screen, unless we came from a refresh, in which case
	just let the page run.
--->
<cfif (StructKeyExists( VARIABLES, "Error" ) AND REQUEST.RequestCommitted AND (NOT StructKeyExists( URL, "norefresh" )))>

<script type="text/javascript">
	window.location.href = "cferror.cfm?norefresh=true";
</script>

<!--- Exit out of the template. --->
<cfexit />

</cfif><!DOCTYPE HTML>
<html>
<head>
<title>An Error Occurred</title>
</head>
<body>
<h1>Internal Server Error</h1>

<p>An internal server error has occurred, but our squad of Web Ninjas are looking into it!<br />
Naturally, you won't be able to tell that they're doing anything because they are Ninjas!<br />
But, rest assured, stuff is getting done.</p>

</body>
</html>