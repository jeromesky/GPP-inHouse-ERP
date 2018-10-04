<cfoutput><!---<cfinclude template="../branches/qry_branches.cfm">--->
<script type="text/javascript">
	delete branches;
	var branches = {};
	branches.companyID 	= #form.companyID#;
	branches.userID 	= #form.userID#;
	branches.branchID	= #form.branchID#;
	branches.thisWindow = $("##branchWindow").parent().attr("id");
</script>
<ul class="listMenu"><cfif formActionNew NEQ "new-branch-booking"><!----link for new branch---->
<li class="ui-state-active"><input type="radio" name="branchID" class="manageBranch" alt="#formActionNew#" id="0" value="0" />
<span>Create New Branch for #qry_branches.companyName#</span></li></cfif>
<cfloop query="qry_branches"><li><cfif formActionEdit EQ "form-viewable-booking">
<input type="radio" name="branchID" class="manageBranch" id="#qry_branches.branchID#" value="#qry_branches.branchID#" alt="#formActionEdit#" />
<span><cfif len(qry_branches.branchName) NEQ 0>#Left(qry_branches.branchName, 73)#<cfelse>no name given</cfif></span><cfelse>
<cfif form.userID NEQ 0 OR NOT listContains("500, 501, 502", qry_branches.branchType, ",")>
<input type="radio" name="branchID" <cfif formActionEdit EQ "form-editable-modal"> class="branche2user"</cfif> value="#qry_branches.branchID#" <cfif form.branchID EQ qry_branches.branchID>checked="checked"</cfif> /></cfif>
<span class="manageBranch cursorPointer" id="#qry_branches.branchID#" alt="#formActionEdit#"><cfif len(qry_branches.branchName) NEQ 0>#Left(qry_branches.branchName, 73)#<cfelse>no name given</cfif></span></cfif>    
</li></cfloop>
</ul></cfoutput>