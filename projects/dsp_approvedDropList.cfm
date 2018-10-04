<cfparam name="form.projectApprovedDate" default="1">
<cfinclude template="qry_projects.cfm">

<select name="projectID" id="projectID" class="ui-corner-all">
	<option value="0">not project</option>
	<cfoutput query="qryProjects">
    <option value="#qryProjects.projectID#">#qryProjects.projectName#</option></cfoutput>
</select>