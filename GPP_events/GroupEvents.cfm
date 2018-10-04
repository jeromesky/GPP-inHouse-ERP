<cfinclude template="../application.cfm">
<cfif parameterexists(form.group) >
	
    <cfquery datasource="#gpp#" name="getevents">
 		UPDATE tblConference
    	SET week = <cfqueryparam value="#form.group#" >
        WHERE IngCon_ID IN (#form.week#)
</cfquery>

<cfelse>
<script type="text/javascript">
 $(document).ready(function() {
		$('.strConference_Name').editable('UpdateConferenceName.cfm', { 
        	id   : 'id',
			name : 'strConference_Name',
			submit    : 'OK',
			width		: 300,
			height: 35,
         	indicator : '<img src="../img/indicator.gif">',
         	tooltip   : 'Click to edit...'

     		});	 
});			
</script>
<cfquery datasource="#gpp#" name="get">
 	select  *
	from tblConference
</cfquery>

Select week
<form action="#" method="post" >
<select name="group" >
	<cfoutput query="get">
    	<option value="#get.IngCon_ID#">#get.strConference_Description#</option>
    </cfoutput>
</select>
<div style="clear:both; height:15px; margin-bottom:10px; border-bottom:1px solid #999999"></div>
<cfquery datasource="#gpp#" name="getevents">
 	select  tblAnnual_Conf.IngConference_ID, tblAnnual_Conf.strConference_Name, tblAnnual_Conf.strConference_Code,
    tblConference.strConference_Description
	from tblAnnual_Conf
    LEFT JOIN tblConference
    ON tblAnnual_Conf.lngCon_ID = tblConference.IngCon_ID
    ORDER BY tblAnnual_Conf.IngConference_ID DESC
</cfquery>

<table cellpadding="4" cellspacing="1" style="font-family:Arial, Helvetica, sans-serif; font-size:12px">
<tr>
    	<td>Conference Code</td>
    	<td>Conference Name</td>
        <td></td>
        <td >Linked to week</td>
	</tr>
	<cfoutput query="getevents">
	<tr>
    	<td>#getevents.strConference_Code#</td>
    	<td><span class="strConference_Name" id="#getevents.IngConference_ID#">#getevents.strConference_Name#</span></td>
        <td><input type="checkbox" name="week" value="#getevents.IngConference_ID#" /></td>
        <td style="color:##666666">#getevents.strConference_Description#</td>
	</tr>
    </cfoutput>
</table>
<input type="submit" value="save" />
</form>


</cfif>