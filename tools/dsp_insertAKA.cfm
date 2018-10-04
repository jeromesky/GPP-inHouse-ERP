<cfquery name="qryCompanyAKAlist" datasource="#var.dsn#">
select top 50 *
from companyAKA
where AKA_companyID in (#form.akaID#)
</cfquery>
<script type="text/javascript" src="../javascript/jquery1.4.js" ></script>
<script language="Javascript">
<!--
 $(document).ready(function() {

 });
function OnButton4()
{
    document.Form1.action = "act_insertAKA.cfm"
    document.Form1.submit();             // Submit the page
    return true;
}

-->
</script>
<noscript>You need Javascript enabled for this to work</noscript>
<form method="post" name="Form1" style="padding:15px; background-color:#f5f4f4; border:1px solid #bdbab9">
<table border="0" style="font-family:Arial, Helvetica, sans-serif; font-size:12px" cellspacing="4">
	<tr>
	  <td>&nbsp;</td>
	  <td  style="padding:0 25px 0 0; border-right:1px solid #999">The following ...</td>
	  <td>will be link to</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
    </tr>
	<tr>
	  <td><strong>company</strong></td>
    <td style="padding:0 25px 0 0; border-right:1px solid #999">
      <cfoutput query="qryCompanyAKAlist"> #AKA_companyName# </cfoutput>&nbsp;</td>
    <td style="padding:0 0 0 25px;"><strong>Company Name</strong>
</td>
    <td><cfoutput></cfoutput><input name="companyName" /></td>
    <td><strong>Comapny URL</strong></td>
    <td><input name="companyURL" value="http://" /></td>
	</tr>
    
    <tr>
      <td><strong>url</strong></td>
    	<td  style="padding:0 25px 0 0; border-right:1px solid #999"><cfoutput query="qryCompanyAKAlist"> #AKA_companyURL#</cfoutput>&nbsp;</td>
        <td style="padding:0 0 0 25px;">AKA_comapnyID</td>
    <td><cfoutput>
      <input value="#form.akaID#" name="akaID" />
    </cfoutput></td>
    <td></td>
    <td><cfoutput><input value="#form.r1#" name="r1" type="hidden" />
<input value="#form.r2#" name="r2" type="hidden" />
<input value="#form.c#" name="c" type="hidden" /></cfoutput><input type="submit" name="operation2" onclick="return OnButton4();" value="Submit" /></td>
   </tr>
</table>
        </form>
<iframe src="http://www.google.com" width="100%" height="95%" >
  <p>Your browser does not support iframes.</p>
</iframe>





