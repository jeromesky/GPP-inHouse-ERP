<cfinclude template="qry_DelegateCountPerEvents.cfm">
<cfset total = 0>

<cfoutput>
<table border="0" cellspacing="4">
	<tr>
    	<td>Delegates</td>
        <td>#qryDelegates.recordcount#</td>
    </tr>
    <tr>
    	<td>Speakers</td>
        <td>#qryspeakers.recordcount#</td>
    </tr>
    <tr>
    	<td>Guest</td>
        <td>#qryGuest.recordcount#</td>
    </tr>
    <tr>
    	<td>Moderators</td>
        <td>#qryModerator.recordcount#</td>
    </tr>
    <tr>
    	<td>Press</td>
        <td>#qryPress.recordcount#</td>
    </tr>
    <tr>
    	<td>Exhibitors</td>
        <td>#qryExhibitor.recordcount#</td>
    </tr>
</table>
</cfoutput>
<!---<cfdump var="#QueryResultCount#">--->
<!---<cfoutput>
	<table cellpadding="2" cellspacing="2" border="0">
    	<cfloop query="QueryResultCount">
    	<tr>
        	<td>#QueryResultCount.label#</td>
            <td>#VAL(QueryResultCount.value)#</td>
        </tr>
<!---       <cfif QueryResultCount.currentRow EQ QueryResultCount.recordCount >
        <tr style="border-top:1px solid ##999999">
        	<td>Total</td>
            <td>#Total#</td>
        </tr>
        </cfif>--->
<!--- <cfset total = total + #QueryResultCount.value#>--->
        </cfloop>
     </table>
</cfoutput>--->