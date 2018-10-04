
 <script type="text/javascript" src="../javascript/jqprint.js" ></script>

<script type="text/javascript" >

function showDel(id) {
		$("#delList").fadeIn("fast").load("functions_attend_list.cfm", {id: id });
}

$(document).ready(function() { 
	$("div#print_button").click(function(){
	    	$("div#delList").jqprint({importCSS: true});  
	});
});
</script>
<cfinclude template="../Application.cfm" >
<!---
        SELECT DISTINCT name
        FROM Counts_dinners
        WHERE webid = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#" > --->
        <cfquery datasource="#dsnP21#" name="get">
SELECT name,  functionid, 
 COUNT(name) AS functionCount
FROM counts_Functions
WHERE eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
GROUP BY name, functionid
HAVING ( COUNT(name) > 1 )
</cfquery>
        
  <div style="clear:both; float:left; width:400px; margin:0 15px 0 0 ">      
<table border="0" cellpadding="5" cellspacing="1" style="font-family:Arial, Helvetica, sans-serif; font-size:14px; color:#333333">

	<cfoutput query="get">
    <tr>
    	<td>#get.name#</td>
    	<td>#get.functionCount#</td>
        <td><a href="javascript:showDel(#get.functionid#)">show&nbsp;list</a></td>
    </tr>
    </cfoutput>
</table>
<div id="print_button">print list</div>
</div>
<div style="clear:right; float:left; width:450px" id="delList">

</div>