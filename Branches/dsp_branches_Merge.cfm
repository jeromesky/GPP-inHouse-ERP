<cfoutput>
<cfinclude template="../branches/qry_branches_Merge.cfm">
<script type="text/javascript">

</script>
	<ul class="listMenu">
    	<li class="ui-state-active"><input type="radio"  class="newUser2Branch" name="newUser2Branch" value="0" title="#form.companyID#" />Create New Branch</li>
    <cfloop query="qry_branches">
    	<li>
			<cfif form.userID NEQ 0><input type="radio" class="newUser2Branch" name="newUser2Branch" value="#qry_branches.branchID#" title="#form.companyID#"></cfif>
             #Left(qry_branches.branchName, 60)#</li></cfloop>
	</ul></cfoutput>