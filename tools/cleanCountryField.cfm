
<cfif parameterexists(form.userID) AND parameterexists(form.countryName) >

	<cfif form.userID NEQ "" AND form.countryName NEQ "" >
    
    	<cfquery datasource="#gpp#" name="qryUpdate">
            UPDATE tblIndividual
            SET
                 [countryName] = <cfqueryparam cfsqltype="cf_sql_char" value="#trim(form.countryName)#">,
                 [__chkCore_Client] = <cfqueryparam cfsqltype="cf_sql_integer" value="1">,
                 [strPersonal_Info] = 	strPersonal_Info + ' Original Country field Updated'
            WHERE
                IngIndividual_ID IN ( <cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#form.userID#">)
    	</cfquery>
    </cfif>
</cfif>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<body style=" font-size:12px; font-family:Arial, Helvetica, sans-serif">

<cfif parameterexists(form.userID)>
        <div style="border:1px solid #093; padding:10px; color:#096">
            Fields updated
        </div>
        <br /><br />
</cfif>
<form action="cleanCountryField.cfm" method="post">
<table  border="0" cellspacing="1" cellpadding="5">
  <tr>
    <td>Country Name</td>
    <td><input type="text" name="countryName" /></td>
  </tr>
    <tr>
    <td>Field ID's</td>
    <td><textarea name="userID" style="height:300px; width:200px"></textarea></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><button>Update</button></td>
  </tr>
</table>
</form>
</body>
</html>