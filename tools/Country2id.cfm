<cfquery datasource="#gppServer#" name="get_countries">
 	select  
    		countryNameEN
            ,countryID
	from 	
    		Countries
	ORDER
    		BY countryNameEN
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<body>
	<ul>
<cfoutput query="get_countries">
		<li>#get_countries.countryNameEN# --( #get_countries.countryID# )</li>
<!---                <cfquery datasource="#gppServer#" name="iupdate">
                UPDATE tblIndividual
                SET 
                		countryID =   <cfqueryparam cfsqltype="cf_sql_integer" value="#get_countries.countryID#">               
                WHERE
                CountryName = <cfqueryparam cfsqltype="cf_sql_char" value="#get_countries.countryNameEN#">
                </cfquery>
        ---> 
</cfoutput>
</ul>
</body>
</html>