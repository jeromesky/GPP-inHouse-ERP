<cfscript>
function ccEscape(ccnum){
    if(len(ccnum) lte 3) return "****";
    return "#RepeatString("*",val(Len(ccnum)-3))##Right(ccnum,3)#";
}
</cfscript>

<cfif parameterexists(url.delete)>
	<cfquery datasource="#dsnP21#">
    	DELETE 
        FROM gppusers 
    	WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.delete#" >
    </cfquery>
</cfif>

<cfquery datasource="#gpp#" name="getname">
    SELECT * 
    FROM gppusers
</cfquery>

<cfset counter = 1>
<table border="0" cellspacing="4" cellpadding="3">
   <tr bgcolor="#F4F4F4">
   <td>User name</td>  
   <td>Email</td>
   <td>Username</td>
   <td>Password</td>
   <td>User Type</td>
   <td width="16">&nbsp;</td>
   <td width="16">edit</td>
   <td width="60">delete</td>
</tr>
 <cfoutput query="getname"><tr>
    <td>#getname.name#</td>
    <td>#getname.email#</td>
    <td>#getname.username#</td>
    <td><div class="password#counter#" id="#getname.id#">#ccEscape(getname.password)#</div></td>
    <td>#getname.usertype#</td>
    <td align="center">#getname.contactReason#</td>
    <td align="center"><a href="javascript:edituser(#getname.id#);"><img src="../img/newS_edit.gif" border="0" /></a></td>
    <td align="right"><a href="javascript:deleteusser(#getname.id#);"><img src="../img/new_delete.gif" border="0" /></a></td>
</tr><cfset counter = counter + 1></cfoutput>       
</table>
<cfset counter = 1>
<cfoutput query="getname">
<script type="text/javascript">
 $(document).ready(function() {
	 $(".event_blurb").editable("usersUpdate.cfm", { 
    onblur    	: 'ignore',
	submit   	: "Save",
	cancel    	: 'Cancel',
	tooltip   	: 'Click to edit',
	indicator 	: "<img src='../img/indicator.gif'>",
	name 		: 'tel#counter#'
	});
 });
</script>
<script type="text/javascript">
 $(document).ready(function() {
	 $(".event_blurb").editable("usersUpdate.cfm", { 
    onblur    	: 'ignore',
	submit   	: "Save",
	cancel    	: 'Cancel',
	tooltip   	: 'Click to edit',
	indicator 	: "<img src='../img/indicator.gif'>",
	name 		: 'password#counter#'
	});
 });
</script>
<cfset counter = counter + 1></cfoutput>