<script type="text/javascript">
	var country2user = {};
	country2user.thisWindow 		= $("#country2User").parent().attr("id");
</script>
<cfinclude template="qry_branch.cfm">
<div id="country2User">
<cfoutput>
<p>Please choose which coutry to apply to this user..</p>

<label><input type="radio" value="#qry_branch.streetCountryID#" name="country2user"> Street Country (#qry_branch.streetCountryName#)</label>
<label><input type="radio" value="#qry_branch.postalCountryID#"  name="country2user"> Postal Country (#qry_branch.postalCountryName#)</label>

</cfoutput></div>