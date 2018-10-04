<cfinclude template="qry_BPA_Designation.cfm" >

<ul class="checklist cl2">
<cfloop query="get_BPADesignation"><cfoutput>
<li><label for="#get_BPADesignation.id#"><input id="#get_BPADesignation.id#" value="#get_BPADesignation.id#" type="checkbox" name="BPADesignation">#get_BPADesignation.data#</label></li></cfoutput></cfloop>
</ul>