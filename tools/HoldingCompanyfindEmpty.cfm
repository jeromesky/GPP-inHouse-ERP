<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<body>
</body>
</html>

<!---marker = 1 --->
<cfset marked = 0 >

        <cfquery name="get_empty" datasource="#gppData#">
        SELECT 
        		IngHoldingCompany_ID 
        FROM
        	    tblHoldingCompany
       ORDER BY strHoldingCompany_Name
        </cfquery>

       <cfloop query="get_empty"> 

       			        <cfquery name="get_exhibitors" datasource="#finding#">
                        SELECT  
                            IngCompany_ID
                        FROM
                            tblCompany
                        WHERE 
                            [lngHoldingCompany_ID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#get_empty.IngHoldingCompany_ID#">
                        </cfquery>
                        
                        <cfif finding.recordcount EQ 0 >
                        		<cfset marked =  marked + 1 >
                        
                        </cfif>
        
        </cfloop>
        
#marked#