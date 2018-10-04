<cfinclude template="qry_networkWith.cfm">
<div style="border-bottom:#000 solid 1px; margin:15px 0px 20px 0px; font-family:Arial, Helvetica, sans-serif;"> <span style="border-bottom: solid #000 4px;">NETWORK WITH</span> </div>
<ul style="font-family:Arial, Helvetica, sans-serif; font-size:12px; list-style:none; margin:0px; padding:0px">
<cfoutput query="get_NetworkWith"><li>
<cfif len(get_NetworkWith.CompanyName) GT 44>#left(rereplace(Lcase(get_NetworkWith.CompanyName), '^\w', '\u\0'), 44)#...<cfelse>#trim(rereplace(Lcase(get_NetworkWith.CompanyName), '^\w', '\u\0'))#</cfif>
<cfif get_NetworkWith.CompanyName contains get_NetworkWith.country ><cfelse><cfif len(get_NetworkWith.companyname) LT 44>, <span style="color:##999">#left(trim(get_NetworkWith.country), 50 - len(get_NetworkWith.companyname) )#</span></cfif></cfif>
</li></cfoutput>
<!---<cfif NetWithCount LT get_NetworkWith.recordCount ><li><a href="http://www.petro21.com/events/index.cfm?id=#MainEventLink#" style="color:###DarkColor#">more here..</a></li></cfif>---></ul>