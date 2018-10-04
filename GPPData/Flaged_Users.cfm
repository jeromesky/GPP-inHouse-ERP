<CFINCLUDE template="../Application.cfm">
<!---<cfinclude template="../tools/checkVPN.cfm" >--->

<cfparam name="form.displaypage" default="" >
<cfparam name="form.displayNumber" default="100" >
<cfset PreviouseRecord = "" >
<cfset NextRecord = "" > 

                    <cfquery datasource="#gpp#" name="get" >

                    SELECT    TOP #form.displayNumber# 		 
                    						tblIndividual.Title AS title,  tblIndividual.strFirst_Name AS name,  tblIndividual.strSurname AS surname, 
                                           tblIndividual.strStreet_Adress AS street,  tblIndividual.strPostal_Adress AS postal,  tblIndividual.strCity AS city, 
                                           tblIndividual.CountryName AS country,  tblIndividual.intCode AS zip,  tblIndividual.STATUS,  tblIndividual.chkMail, 
                                           tblIndividual.strEmail AS email,  tblIndividual.strDesignation AS designation,  tblCompany.strCompany_Name AS company, 
                                           tblIndividual.IngIndividual_ID AS id, tblIndividual.strSecretary_Email, tblIndividual.strEmail_Alt, tblIndividual.email_web, tblIndOptions.email_bounce  , tblIndOptions.email_bounce_error, tblIndOptions.mailOutFlag
                    
                    FROM          		tblIndividual 
                    LEFT JOIN
                                            tblCompany ON  tblIndividual.IngIndividual_ID =  tblCompany.IngCompany_ID
                    LEFT JOIN
                                            tblIndOptions ON  tblIndividual.IngIndividual_ID =  tblIndOptions.lngIndividual_ID
                    
                    WHERE    ( mailOutFlag > 0 OR  tblIndOptions.email_bounce > 0 OR tblIndOptions.email_bounce_error > 0 ) 
					<cfif parameterexists(url.PreviouseRecord)> AND ( tblIndividual.IngIndividual_ID < #url.PreviouseRecord#  )</cfif>
					<cfif parameterexists(url.NextRecord)> AND ( tblIndividual.IngIndividual_ID > #url.NextRecord#  )</cfif>
                    
                   ORDER BY tblIndividual.IngIndividual_ID
                    </cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
<title>P21</title>
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" src="../Javascript/jeditable.js" ></script>

<style type="text/css">
<!--
.delBorder {
border-left:1px dotted #666666
}
-->
</style></head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="header">GPP datamase management:  -- <span class="header_title"></span></div>
<div id="outer">
	<div id="iner">
    	  <table border="0" cellpadding="15" cellspacing="4" width="100%">
        <tr>
          <td width="640" bgcolor="#C90900">
                        <form action="Users_list.cfm" method="post">
                        <table  border="0" cellspacing="4" cellpadding="2" style="color:#FFFFFF; font-size:12px; font-family:Arial, Helvetica, sans-serif">
                          <tr>
                            <td>Search&nbsp;list&nbsp;on </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><button >Search </button></td>
                            <td width="25">&nbsp;</td>
                            <td>Make&nbsp;me&nbsp;Excel&nbsp;form</td>
                            <td><input name="excel" type="checkbox" value="" /></td>
                          </tr>
                        </table>
                        </form>
          </td>
    </tr>
	
                        <tr>
                            <td bgcolor="#ffffff">

                    <form action="Users_list_edit.cfm" method="post">
                    <table width="100%" border="0" cellspacing="1" cellpadding="4" style="color:##333333; font-size:12px; font-family:Arial, Helvetica, sans-serif">
                      
                      <tr>
                        <td><cfoutput>#get.recordcount#</cfoutput></td>
                        <td></td>
                        <td>bounce</td>
                        <td>error</td>
                        <td>Alternat email</td>
                        <td>web email</td>
                        <td>Secretary email</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="delBorder">&nbsp;</td>
                      </tr>
                     <cfoutput query="get"> 
                     	<cfif get.currentrow EQ 1 ><cfset PreviouseRecord = #get.id# ></cfif>
                        <cfif get.currentrow EQ get.recordcount ><cfset NextRecord = #get.id# ></cfif>
                      <tr  onMouseOver="style.backgroundColor='##D8E2F9';" onMouseOut="style.backgroundColor='##ffffff';">
                        <td>#get.title# <span class="strFirst_Name"  id="#get.id#">#get.name#</span> <span class="strEmail"  id="#get.id#">#get.surname#</span></td>
                        <td <cfif get.mailOutFlag GT 0 > style="background-color:##FFFCCB"</cfif>><span class="strEmail"  id="#get.id#">#get.email#</span></td>
                        <td>#get.email_bounce#</td>
                        <td>#get.email_bounce_error#</td>
                        <td>#get.strEmail_Alt#</td>
                        <td>#get.email_web#</td>
                        <td>#get.strSecretary_Email#</td>
                        <td>#get.designation#</td>
                        
                        
                        <td>#get.city#</td>
                        <td>#get.zip#</td>
                        <td>#get.country#</td>
                        <td class="delBorder"></td>
                      </tr>
                    </cfoutput>
                    <tr>
                      <td colspan="11"><input type="hidden" name="recordcount" value="<cfoutput>#get.recordcount#</cfoutput>" />
                        <cfoutput><a href="Flaged_Users.cfm?PreviouseRecord=#PreviouseRecord#">Previous Set of  records </a></td>
                        <td colspan="1" class="delBorder"><a href="Flaged_Users.cfm?NextRecord=#NextRecord#">Next Set of  record </a></cfoutput></td>
                    </tr>
                    </table>
                 </form>
   </td>
</tr>                 


</table>
</div>
</div>

<script type="text/javascript">
 $(document).ready(function() {
       $('.strEmail').editable('Flaged_Users_Update.cfm', { 
        	id   : 'id',
			name : 'strEmail',
			submit    : 'OK',
			width		: 200,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
	   $('.strFirst_Name').editable('Flaged_Users_Update.cfm', { 
        	id   : 'id',
			name : 'strFirst_Name',
			submit    : 'OK',
			width		: 200,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
	   $('.strSurname').editable('Flaged_Users_Update.cfm', { 
        	id   : 'id',
			name : 'strSurname',
			submit    : 'OK',
			width		: 200,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});
  });
</script>
</body>
</html>