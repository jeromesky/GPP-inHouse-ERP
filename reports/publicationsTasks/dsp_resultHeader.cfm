<cfoutput>
 <style type="text/css">
	table{font-size:12px; font-family:Arial, Helvetica, sans-serif}
	td{padding:4px 4px; border-bottom:1px dotted ##aaaaaa; }
	##header{background-color:##dfdfdf; padding:10px 10px 8px 15px}
	
</style>
<div id="header">
Total: #qryResult.recordCount# Publications for #eventName# Printed on the #dateFormat(now(), "dd mm yyyy")#
</div></cfoutput>