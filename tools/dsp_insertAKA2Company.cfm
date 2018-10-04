<cfquery name="qryCompanyAKAlist" datasource="#var.dsn#">
select top 50 *
from companyAKA
where AKA_companyID in (#form.akaID#)
</cfquery>

<script language="Javascript">
<!--

function OnButton4()
{
    document.Form1.action = "act_insertAKA2Company.cfm"
    document.Form1.submit();             // Submit the page
    return true;
}

-->
</script>
<noscript>You need Javascript enabled for this to work</noscript>

The following ...<br /><cfoutput query="qryCompanyAKAlist">
#AKA_companyID# - #AKA_companyName# <a href="#AKA_companyURL#" target="_new">#AKA_companyURL#</a><br />
</cfoutput>

<br />will be link to<br />
<form method="post" name="Form1"><cfoutput>
<input value="#form.r1#" name="r1" type="hidden" />
<input value="#form.r2#" name="r2" type="hidden" />
AKA_comapnyID<br />
<input value="#form.akaID#" name="akaID" size="50" /><br />
Company Name<br />
<input name="companyName" size="50"  /><br />
Company URL<br />
<input name="companyURL" value="#qryCompanyAKAlist.AKA_companyURL#" size="50"  /><br /></cfoutput>
<input type="submit" name="operation2" onclick="return OnButton4();" value="Submit" />

</form>