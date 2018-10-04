<CFINCLUDE template="../Application.cfm">
<!---<cfinclude template="../tools/checkVPN.cfm" >--->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
<script src="../Javascript/jquery.js" type="text/javascript"></script>

<title>Petro21</title>
<style type="text/css">
<!--
.delBorder {
border-left:1px dotted #666666
}
-->
</style>
<script type="text/javascript">
function checkAll(checkWhat) {
  // Find all the checkboxes...
  var inputs = document.getElementsByTagName("input");

  // Loop through all form elements (input tags)
  for(index = 0; index < inputs.length; index++)
  {
    // ...if it's the type of checkbox we're looking for, toggle its checked status
    if(inputs[index].id == checkWhat)
      if(inputs[index].checked == 0)
      {
        inputs[index].checked = 1;
      }
      else if(inputs[index].checked == 1)
      {
        inputs[index].checked = 0;
      }
  }
}
</script>
</head>

<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="header">GPP datamase management:  -- <span class="header_title"></span></div>
<div id="outer">
	<div id="iner">
    <cfif Security.AdministratorManagement CONTAINS Session.username >
    	  <table border="0" cellpadding="15" cellspacing="4" width="100%">
        <tr>
          <td width="640" bgcolor="#C90900">
                        <form action="Users_list.cfm" method="post">
                        <table  border="0" cellspacing="4" cellpadding="2" style="color:#FFFFFF; font-size:12px; font-family:Arial, Helvetica, sans-serif">
    <tr>
      <td>Search&nbsp;list&nbsp;on </td>
<td width="140"><label><input name="region" type="radio" value="chkW"  />&nbsp;World</label></td>
      <td><label><input name="region" type="radio" value="chkNA"  />&nbsp;North&nbsp;America</label></td>
      <td><label><input name="region" type="radio" value="chkL"  />&nbsp;Latin</label></td>
      <td><label><input name="region" type="radio" value="chkME"  />&nbsp;MidEast</label></td>
      <td><label><input name="region" type="radio" value="chkE"  />&nbsp;Europe</label></td>
      <td><label><input name="region" type="radio" value="chkAF"  />&nbsp;Africa</label></td>
      <td><label><input name="region" type="radio" value="chkA"  />&nbsp;Asia</label></td>
      <td><label><input name="region" type="radio" value="chkEAF"  />&nbsp;East&nbsp;Africa</label></td>
      <td><label><input name="region" type="radio" value="chkWA"  />&nbsp;West&nbsp;Africa</label></td>
      <td><label><input name="region" type="radio" value="chSAE"  />&nbsp;Southern&nbsp;Africa</label></td>
      <td><label><input name="region" type="radio" value="chkMag"  />&nbsp;North&nbsp;Africa</label></td>
   </tr>
   <tr>
   	<td >select Post Option</td>
      <td><label><input name="post" type="radio" value="chkPrioPost"  />&nbsp;Priority Post</label></td>
      <td><label><input name="post" type="radio" value="chkSecPost"  />&nbsp;Secondary Post</label></td>
      <td  colspan="9">&nbsp;</td>
                        </tr>
                        <tr>
      <td >select Industry Sector</td>
      <td><label><input name="Sector" type="checkbox" value="chkExploration"  />&nbsp;Explor&nbsp;/&nbsp; Produc</label></td>
      <td><label><input name="Sector" type="checkbox" value="chkRefining"  />&nbsp;Down&nbsp;/&nbsp;Refinn&nbsp;/&nbsp;PetroChem</label></td>
      <td><label><input name="Sector" type="checkbox" value="chkPower"  />&nbsp;Power</label></td>
      <td><label><input name="Sector" type="checkbox" value="chkGas"  />&nbsp;Gas</label></td>
      <td><label><input name="Sector" type="checkbox" value="chkRenBio"  />&nbsp;Renew&nbsp;/&nbsp;Bio</label></td>
      <td  colspan="9">&nbsp;</td>
                       </tr>
                       <tr>
      <td>Make&nbsp;me&nbsp;Excel&nbsp;form</td>
      <td width="25"><input name="excel" type="checkbox" value="" /></td>
      <td>Display Only</td>
      <td colspan="3">
      
      <select name="">
      	<option value="*">ALL</option>
          <option value="A">A</option>
          <option value="B">B</option>
          <option value="C">C</option>
          <option value="D">D</option>
          <option value="E">E</option>
          <option value="F">F</option>
          <option value="G">G</option>
          <option value="H">H</option>
          <option value="I">I</option>
          <option value="J">J</option>
          <option value="K">K</option>
          <option value="L">L</option>
          <option value="M">M</option>
          <option value="N">N</option>
          <option value="O">O</option>
          <option value="P">P</option>
          <option value="Q">Q</option>
          <option value="R">R</option>
          <option value="S">S</option>
          <option value="T">T</option>
          <option value="U">U</option>
          <option value="V">V</option>
          <option value="W">W</option>
          <option value="X">X</option>
          <option value="Y">Y</option>
          <option value="Z">Z</option>
      </select>
      </td>
      <td  colspan="6"><button >Search </button></td>
                      </tr>
                        </table>
            </form>
          </td>
    </tr>
					<cfif parameterexists(form.region)>
                        <tr>
      <td bgcolor="#ffffff">
                    <cfset Sector = 0 >
                    <cfquery datasource="#gpp#" name="get" >
                    
                    
                    SELECT     		tblIndividual.Title AS title,  tblIndividual.strFirst_Name AS name,  tblIndividual.strSurname AS surname, 
                     tblIndividual.strStreet_Adress AS street,  tblIndividual.strPostal_Adress AS postal,  tblIndividual.strCity AS city, 
                     tblIndividual.CountryName AS country,  tblIndividual.intCode AS zip,  tblIndividual.STATUS,  tblIndividual.chkMail, 
                     tblIndividual.chkW,  tblIndividual.chkNA,  tblIndividual.chkL,  tblIndividual.chkME,  tblIndividual.chkE,  tblIndividual.chkAF, 
                     tblIndividual.chkA,  tblIndividual.chkMag,  tblIndividual.strDesignation AS designation,  tblCompany.strCompany_Name AS company, 
                     tblIndividual.IngIndividual_ID AS id, tblIndividual.chkPrioPost, tblIndividual.chkSecPost, tblIndividual.chkExploration, tblIndividual.chkRefining, tblIndividual.chkPower,  tblIndividual.chkGas,  tblIndividual.chkRenBio, tblIndividual.chkEAF, tblIndividual.chkWA, tblIndividual.chSAE, tblGlopacHistory.RecordWorked, tblGlopacHistory.RecIDX, tblGlopacHistory.UserName, tblGlopacHistory.UserDateNum
                    
                    FROM          		tblIndividual 
                    INNER JOIN
                      tblCompany ON  tblIndividual.lngCompany_ID =  tblCompany.IngCompany_ID
                      
                    Join					tblGlopacHistory ON  tblIndividual.IngIndividual_ID =  tblGlopacHistory.RecordWorked
                    
                    WHERE     ( tblIndividual.STATUS = N'C') AND ( tblIndividual.chkMail <> 1) AND  tblIndividual.#form.region# = 1   <cfif parameterexists(form.post)>AND (#form.post# = 1)</cfif>
                    						<cfif parameterexists(form.Sector)>AND  ( <cfloop list="#form.Sector#" delimiters="," index="i"><cfif Sector NEQ 0> OR</cfif> #i# = 1 <cfset Sector = Sector + 1 ></cfloop>   )  </cfif>
                    ORDER BY tblCompany.strCompany_Name, tblGlopacHistory.RecIDX DESC
                    </cfquery>
  <cfif parameterexists(form.excel)>
	<CFHEADER NAME="Content-Disposition" VALUE="inline; FILENAME=ClientList.xls">
	<CFCONTENT TYPE="application/vnd.msexcel">                   
                    <table width="100%" border="0" cellspacing="0" cellpadding="4" style="color:#333333; font-size:12px; font-family:Arial, Helvetica, sans-serif">
                      <tr>
                        <td colspan="8"><cfoutput>#get.recordcount#</cfoutput></td>
                     <cfoutput query="get"> 
                      <tr  onMouseOver="style.backgroundColor='##D8E2F9';" onMouseOut="style.backgroundColor='##ffffff';">
                        <td>#get.title# #get.name# #get.surname#</td>
                        <td>#get.company#</td>
                        <td>#get.designation#</td>
                        <td>#get.street#</td>
                        <td>#get.postal#</td>
                        <td>#get.city#</td>
                        <td>#get.zip#</td>
                        <td>#get.country#</td>
                      </tr>
                    </cfoutput>

                    </table>                   
                    
                    
                    
<cfelse>                    
                    <form action="Users_list_edit.cfm" method="post">
                    <table width="100%" border="0" cellspacing="0" cellpadding="4" style="color:#333333; font-size:12px; font-family:Arial, Helvetica, sans-serif">
                      <tr>
                        <td><cfoutput>#get.recordcount#</cfoutput></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><a href="javascript: void(null);" onClick="checkAll('chkW')" title="Click to select and unselect all tick boxes">World</a></td>
                        <td><a href="javascript: void(null);" onClick="checkAll('chkNA')" title="Click to select and unselect all tick boxes">North America</a></td>
                        <td><a href="javascript: void(null);" onClick="checkAll('chkL')" title="Click to select and unselect all tick boxes">Latin</a></td>
                        <td><a href="javascript: void(null);" onClick="checkAll('chkME')" title="Click to select and unselect all tick boxes">MidEast</a></td>
                        <td><a href="javascript: void(null);" onClick="checkAll('chkE')" title="Click to select and unselect all tick boxes">Europe</a></td>
                        <td><a href="javascript: void(null);" onClick="checkAll('chkAF')" title="Click to select and unselect all tick boxes">Africa</a></td>
                        <td><a href="javascript: void(null);" onClick="checkAll('chkA')" title="Click to select and unselect all tick boxes">Asia</a></td>
                        <td><a href="javascript: void(null);" onClick="checkAll('chkMag')" title="Click to select and unselect all tick boxes">North Africa</a></td>
                        
                        <td><a href="javascript: void(null);" onClick="checkAll('chkEAF')" title="Click to select and unselect all tick boxes">East Africa</a></td>
                        <td><a href="javascript: void(null);" onClick="checkAll('chkWA')" title="Click to select and unselect all tick boxes">West Africa</a></td>
                        <td><a href="javascript: void(null);" onClick="checkAll('chSAE')" title="Click to select and unselect all tick boxes">Southern Africa</a></td>
                        <td class="delBorder"><a href="javascript: void(null);" onClick="checkAll('chkExploration')" title="Click to select and unselect all tick boxes">Expor/Prod</a></td>
                        <td><a href="javascript: void(null);" onClick="checkAll('chkPower')" title="Click to select and unselect all tick boxes">Power</a></td>
                        <td><a href="javascript: void(null);" onClick="checkAll('chkRefining')" title="Click to select and unselect all tick boxes">Down/Ref/Petro</a></td>
                        <td><a href="javascript: void(null);" onClick="checkAll('chkGas')" title="Click to select and unselect all tick boxes">Gas</a></td>
                        <td><a href="javascript: void(null);" onClick="checkAll('chkRenBio')" title="Click to select and unselect all tick boxes">Renew/Bio</a></td>
                        <td class="delBorder"><a href="javascript: void(null);" onClick="checkAll('chkPrioPost')" title="Click to select and unselect all tick boxes">Priority Post</a></td>
                        <td ><a href="javascript: void(null);" onClick="checkAll('chkSecPost')" title="Click to select and unselect all tick boxes">Secondary Post</a></td>
                        <td ><a href="javascript: void(null);" onClick="checkAll('chkMail')" title="Click to select and unselect all tick boxes">No Post</a></td>
                        <td class="delBorder" style="background-color:#FFD3BF">Mark  For Archive</td>
                      </tr>
                     <cfoutput query="get"> 
                      <tr  onMouseOver="style.backgroundColor='##D8E2F9';" onMouseOut="style.backgroundColor='##ffffff';">
                        <td>#get.title# #get.name# #get.surname#</td>
                        <td>#get.company#</td>
                        <td>#get.designation#</td>
                        <td>#get.street#</td>
                        <td>#get.postal#</td>
                        <td>#get.city#</td>
                        <td>#get.zip#</td>
                        <td>#get.country#</td>
                        <td><input name="chkW#get.currentRow#" type="checkbox" value="chkW" <cfif get.chkW eq 1> checked</cfif>  id="chkW"  /><input type="hidden" name="id#get.currentRow#" value="#get.id#" /></td>
                        <td><input name="chkNA#get.currentRow#" type="checkbox" value="chkNA" <cfif get.chkNA eq 1> checked</cfif>  id="chkNA"  /></td>
                        <td><input name="chkL#get.currentRow#" type="checkbox" value="chkL" <cfif get.chkL eq 1> checked</cfif>  id="chkL"  /></td>
                        <td><input name="chkME#get.currentRow#" type="checkbox" value="chkME" <cfif get.chkME eq 1> checked</cfif>  id="chkME"  /></td>
                        <td><input name="chkE#get.currentRow#" type="checkbox" value="chkE" <cfif get.chkE eq 1> checked</cfif>  id="chkE"  /></td>
                        <td><input name="chkAF#get.currentRow#" type="checkbox" value="chkAF" <cfif get.chkAF eq 1> checked</cfif>  id="chkAF"  /></td>
                        <td><input name="chkA#get.currentRow#" type="checkbox" value="chkA" <cfif get.chkA eq 1> checked</cfif>  id="chkA"  /></td>
                        <td><input name="chkMag#get.currentRow#" type="checkbox" value="chkMag" <cfif get.chkMag eq 1> checked</cfif>  id="chkMag"  /></td>
                        
                        <td><input name="chkEAF#get.currentRow#" type="checkbox" value="chkEAF" <cfif get.chkEAF eq 1> checked</cfif>  id="chkEAF"  /></td>
						<td><input name="chkWA#get.currentRow#" type="checkbox" value="chkWA" <cfif get.chkWA eq 1> checked</cfif>  id="chkWA"  /></td>
                        <td><input name="chSAE#get.currentRow#" type="checkbox" value="chSAE" <cfif get.chSAE eq 1> checked</cfif>  id="chSAE"  /></td>                        
                        
                        <td class="delBorder"><input name="chkExploration#get.currentRow#" type="checkbox"   value="chkExploration" <cfif get.chkExploration eq 1> checked</cfif> id="chkExploration" /></td>
                        <td ><input name="chkPower#get.currentRow#" type="checkbox"  value="chkPower" <cfif get.chkPower eq 1> checked</cfif>  id="chkPower"  /></td>
                        <td ><input name="chkRefining#get.currentRow#" type="checkbox"  value="chkRefining" <cfif get.chkRefining eq 1> checked</cfif>  id="chkRefining"  /></td>
                        <td ><input name="chkGas#get.currentRow#" type="checkbox"  value="chkGas" <cfif get.chkGas eq 1> checked</cfif>  id="chkGas"  /></td>
                        <td ><input name="chkRenBio#get.currentRow#" type="checkbox"  value="chkRenBio" <cfif get.chkRenBio eq 1> checked</cfif>  id="chkRenBio"  /></td>
                        <td class="delBorder"><input name="chkPrioPost#get.currentRow#" type="checkbox"   value="chkMag" <cfif get.chkPrioPost eq 1> checked</cfif> id="chkPrioPost" /></td>
                        <td ><input name="chkSecPost#get.currentRow#" type="checkbox"  value="chkMag" <cfif get.chkSecPost eq 1> checked</cfif>  id="chkSecPost"  /></td>
                        <td ><input name="chkMail#get.currentRow#" type="checkbox"  value="chkMail" <cfif get.chkMail eq 1> checked</cfif>  id="chkMail"  /></td>
                        <td class="delBorder"  style="background-color:##FFD3BF"><input name="archive" type="checkbox" value="#get.id#" /></td>
                      </tr>
                    </cfoutput>
                    <tr>
                        <td colspan="8"><input type="hidden" name="recordcount" value="<cfoutput>#get.recordcount#</cfoutput>" /></td>
                        <td colspan="16"><input type="submit" value="save" name="desid"  /> </td>
                        <td colspan="3" class="delBorder"></td>
                        <td  class="delBorder"  style="background-color:#FFD3BF"><input type="submit" value="Make archive"  name="desid"  /></td>
                    </tr>
                    </table>
</cfif>                    </form>
   </td>
</tr>                 
                    </cfif>

</table>

<cfelse >

Only Members of the Management Admin group can access this page
</cfif>
</div>
</div>
</body>
</html>