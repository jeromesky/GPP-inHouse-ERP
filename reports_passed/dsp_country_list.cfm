<cfinclude template="qry_country_list.cfm">

<ul class="checklist cl2"><cfloop query="output"><cfoutput>
<li><label for="#output.country#"><input value="#output.country#" id="#output.country#" type="checkbox" name="country">#output.country#</label></li></cfoutput></cfloop>
</ul>