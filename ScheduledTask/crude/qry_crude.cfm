<cftry>

<CFHTTP URL="http://www.oil-price.net/TABLE3/gen.php?lang=en" METHOD="GET" timeout="600" />

<cfif cfhttp.fileContent is "Connection Failure">
    <cfmail to="#contactAdmin#" from="web@petro21.com" subject="error on #cgi.SCRIPT_NAME#">
    #cgi.HTTP_REFERER# // #cgi.SCRIPT_NAME# // error collect brent crude data
    <cfdump var="#cfhttp#"></cfmail>
</cfif>

<cfscript>
	 price	= listGetAt(CFHTTP.FileContent, 8, "(");
	 price	= listGetAt(price, 1, ")");
	 price	= replace(price, "'", "", "ALL");
</cfscript>

<cfif isNumeric(price)>
       <cfquery datasource="#dsnP21#">
        INSERT INTO Brent (brent, thedate)
        VALUES (<cfqueryparam cfsqltype="cf_sql_char" value="#trim(price)#">, <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">)
        </cfquery>
<cfelse>
    <cfmail to="#contactAdmin#" from="web@petro21.com" subject="error on #cgi.SCRIPT_NAME#">
    #cgi.HTTP_REFERER# // #cgi.SCRIPT_NAME# // error processing brent crude data<br />
    </cfmail>
</cfif>

    <cfcatch type="any">
      <cfmail to="#contactAdmin#" from="web@petro21.com" subject="error on #cgi.SCRIPT_NAME#">
      #cgi.HTTP_REFERER# // #cgi.SCRIPT_NAME# // error processing brent crude data page<br />
      </cfmail>
    </cfcatch>

</cftry>

<!---
<cfoutput>#price#<br />
#CFHTTP.FileContent#</cfoutput>
<CFIF Find('pricedata', #CFHTTP.FileContent#) NEQ 0>
	<CFSET start=#Find('pricedata', CFHTTP.FileContent)#+11>
    <CFSET dsp_oil_price ="#HTMLEditFormat(Mid(CFHTTP.FileContent,start,9))#">
<cfoutput>#dsp_oil_price#</cfoutput>
<CFHTTP URL="http://sabc.hosted.inet.co.za/other/quicklist/BRFUT/" METHOD="GET">
oil_price = Mid(CFHTTP.FileContent,start,9);
--->