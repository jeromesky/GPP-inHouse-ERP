<cfinclude template="../Application.cfm" >
        <cfquery datasource="#dsnP21#" name="get">
SELECT userid

FROM counts_Functions
WHERE functionid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
 </cfquery>
 
 <cfset getIDS = ValueList(get.userid, ",")>

<cfquery datasource="#gpp#" name="user">
SELECT tblIndividual.Title, tblIndividual.strFirst_Name, tblIndividual.strSurname, tblCompany.strCompany_Name AS company

FROM tblIndividual
LEFT JOIN tblCompany ON tblIndividual.lngCompany_ID  = tblCompany.IngCompany_ID
WHERE IngIndividual_ID IN (#getIDS#) 
 </cfquery>
 
 <table width="420" border="0" cellspacing="1" cellpadding="4" style="font-family:Arial, Helvetica, sans-serif ; font-size:12px; color:#333333">
  <tr >
    <td style="border-bottom:1px solid ##CCCCCC; background-color:#E8FFF9"  width="40">&nbsp;</td>
    <td style="border-bottom:1px solid ##CCCCCC; background-color:#E8FFF9"><cfoutput>count #user.recordcount#</cfoutput></td>
    <td style="border-bottom:1px solid ##CCCCCC; background-color:#E8FFF9">&nbsp;</td>
  </tr>
 <cfoutput query="user">
  <tr >
    <td colspan="3">#user.company#</td>
  </tr>
  <tr >
    <td style="border-bottom:1px solid ##CCCCCC"  width="40">#user.Title#</td>
    <td style="border-bottom:1px solid ##CCCCCC">#user.strFirst_Name#</td>
    <td style="border-bottom:1px solid ##CCCCCC">#user.strSurname#</td>
  </tr>
</cfoutput>
</table>