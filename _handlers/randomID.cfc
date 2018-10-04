<cfcomponent>
	<cffunction name="randomID" access="public" returntype="numeric">

		<cfscript>
            dstamp  	= DateFormat(Now(),'mmddyyyy'); 
			tstamp		= TimeFormat(Now(),'hhmmss');
            randomnum	= randrange(00001, 99999) ;
            randomID	= dstamp + randomnum + tstamp;
        </cfscript>

	<cfreturn randomID>
	</cffunction>
</cfcomponent>