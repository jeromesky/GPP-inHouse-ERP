<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>www.petro21.com</title>
</head>

<body>
     	<CFQUERY datasource="#dsnP21#" name="get">
		SELECT id,interest
		FROM logos
		WHERE interest <> ''
        order by company
		</CFQUERY> 
        
        <cfloop query="get">
        	<cfquery datasource="#dsnP21#">
            UPDATE logos
            SET intme = <cfif get.interest contains 7  >0,<cfelse>1,</cfif>
            	intaf = <cfif get.interest contains 2 OR get.interest contains 1 OR get.interest contains 10 >0,<cfelse>1,</cfif>
                intas = <cfif get.interest contains 4>0,<cfelse>1,</cfif>
                intnam = <cfif get.interest contains 20>0,<cfelse>1,</cfif>
                intla = <cfif get.interest contains 9>0,<cfelse>1,</cfif>
                inteu = <cfif get.interest contains 13>0,<cfelse>1,</cfif>
                intnaf = <cfif get.interest contains 8>0<cfelse>1</cfif>
            WHERE id = #get.id#
            </cfquery>
        

        </cfloop>
 
</body>
</html>