<cfinclude template="qry_data.cfm">
<cfif qryUser.recordcount GT 0>
<script type="text/javascript">
	searchResult()
	$("#duplicate").val(1);
</script>
<fieldset>
<legend class="ui-corner-all">found duplicate on system</legend>
<ul class="listMenu"><cfoutput query="qryUser">
<li>#qryUser.name# #qryUser.surname#<br /> #Ucase(qryUser.AKA_companyName)# #qryUser.strEmail#</li></cfoutput>
</ul>
</fieldset></cfif>