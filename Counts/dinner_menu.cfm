<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>www.petro21.com</title>
<script type="text/javascript" src="../javascript/jquery.js" ></script>
 <script type="text/javascript" src="../javascript/jqprint.js" ></script>

</head>

<body>
<script type="text/javascript">
function showDel(id, dish) {
		$("#delList").fadeIn("fast").load("dinner_attend_list.cfm", {id: id, dish: dish });
}
$(document).ready(function() { 
	$("div#print_button").click(function(){
	    	$("div#delList").jqprint({importCSS: true});  
	});
});	
</script>
    <link href="../styles/styles.css" rel="stylesheet" type="text/css">
<cfinclude template="../Application.cfm" >
<!---
        SELECT DISTINCT name
        FROM Counts_dinners
        WHERE webid = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#" > --->
        <cfquery datasource="#dsnP21#" name="get">
        SELECT name, webid, 
 COUNT(name) AS plateCount
FROM Counts_dinners
WHERE webid = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#" >
GROUP BY name, webid
HAVING ( COUNT(name) > 1 )
</cfquery>
          <div style="clear:both; float:left; width:300px; margin:0 15px 0 0 "> 
<table border="0" cellpadding="5" cellspacing="1" style="font-family:Arial, Helvetica, sans-serif; font-size:14px; color:#333333">

	<cfoutput query="get">
    <tr>
    	<td>#get.name#</td>
    	<td>#get.plateCount#</td>
        <td><a href="javascript:showDel(#get.webid#, '#trim(get.name)#')">show&nbsp;list</a></td>
    </tr>
    </cfoutput>
</table>
<div id="print_button">print list</div>
</div>
<div style="clear:right; float:left; width:450px" id="delList">

</div>
</body>
</html>