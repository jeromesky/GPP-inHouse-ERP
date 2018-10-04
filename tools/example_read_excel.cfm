<!--- default values --->
<cfparam name="form.InputExcelFile" default="">
<cfparam name="form.StartCol" default="A">
<cfparam name="form.EndCol" default="0">
<cfparam name="form.StartRow" default="1">
<cfparam name="form.EndRow" default="0">
<cfparam name="form.Sheet" default="Sheet1">
<cfparam name="form.HeaderRow" default="">
<cfparam name="form.Formula" default="process">
<cfparam name="form.DecimalDigit" default="2">
<cfparam name="form.ProcessMerged" default="true">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>CFX_Excel Example</title>
	<style type="text/css">
		.textfield {  font-family: "MS Sans Serif"; font-size: 9pt; border: 1px solid #cccccc; }
		.button {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; font-weight: bold; color: #FFFFFF; background-color: #000000; cursor: hand}
		.tablestandard { font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; }
	</style>
</head>

<body>
	<cfoutput>
	<h3>CFX_Excel Example</h3>
	<h4>Read Operation - Convert MS Excel File To ColdFusion Query</h4>
	<hr size=1>
	<table width="100%" cellpadding="2" cellspacing="2" border="0" class="tablestandard">
		<cfform action="example_read_excel.cfm" method="POST" enctype="multipart/form-data">
			<tr>
				<td nowrap valign="top">Upload Excel file to read:</td>
				<td width="100%" valign="top">
					<input type="File" name="InputExcelFile" size="40" class="textfield">
				</td>
			</tr>
			<tr>
				<td nowrap valign="top">Sheet name or index##:</td>
				<td width="100%" valign="top">
					<cfinput type="Text" class="textfield" name="Sheet" value="#form.Sheet#" size="8">
				</td>
			</tr>
			<tr>
				<td nowrap valign="top">Column to process:</td>
				<td width="100%" valign="top">
					Start: <cfinput type="Text" class="textfield" name="StartCol" value="#form.StartCol#" size="8">
					End: <cfinput type="Text" class="textfield" name="EndCol" value="#form.EndCol#" size="8">
					(type '0' in the end attribute to process all non-empty/edited columns)
				</td>
			</tr>
			<tr>
				<td nowrap valign="top">Row to process:</td>
				<td width="100%" valign="top">
					Start: <cfinput type="Text" class="textfield" name="StartRow" value="#form.StartRow#" range="1," size="8">
					End: <cfinput type="Text" class="textfield" name="EndRow" value="#form.EndRow#" size="8">
					(type '0' in the end attribute to process all non-empty/edited rows)
				</td>
			</tr>
			<tr>
				<td nowrap valign="top">Header row:</td>
				<td width="100%" valign="top">
					<cfinput type="Text" class="textfield" name="HeaderRow" value="#form.HeaderRow#" validate="integer" range="0," size="4"><br>
					(Row containing column names, if any)
				</td>
			</tr>
			<tr>
				<td nowrap valign="top">Number of decimal digits:</td>
				<td width="100%" valign="top">
					<cfinput type="Text" class="textfield" name="DecimalDigit" value="#form.DecimalDigit#" validate="integer" range="0," size="4">
				</td>
			</tr>
			<tr>
				<td valign="top">Formula:</td>
				<td valign="top">
					<input type="Radio" name="Formula" value="process" #iif(form.Formula is "process",de("checked"),de(""))#>Process<br>
					<input type="Radio" name="Formula" value="show" #iif(form.Formula is "show",de("checked"),de(""))#>Show<br>
				</td>
			</tr>
			<tr>
				<td valign="top">Process merged cells:</td>
				<td valign="top">
					<input type="Radio" name="ProcessMerged" value="true" #iif(form.ProcessMerged is "true",de("checked"),de(""))#>True<br>
					<input type="Radio" name="ProcessMerged" value="false" #iif(form.ProcessMerged is "false",de("checked"),de(""))#>False<br>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="Submit" value="Convert Excel To CF Query Now" class="button"><br>
					<br>
					<font size="1">
						<a href="example_write.cfm">Click here to see the CFX_Excel write example</a>
					</font>					
				</td>
			</tr>
		</cfform>
	</table>
	
	<cfif form.InputExcelFile neq "">
		<!--- read operation --->
		<hr size="1">
		
		<!--- define temp excel --->
		<cfset strDir=GetDirectoryFromPath(ExpandPath("*.*")) & "/temp">
		<cfset strInExcel=strDir>
		
		<!--- upload image --->
		<cffile action="Upload"
  					filefield="InputExcelFile"
  					destination="#strInExcel#"
						mode="757">
		<cfset prodThumbDir=file.ServerDirectory>
		<cfset prodThumbFile=file.ServerFile>
		<cfset prodThumbExt=file.serverfileext>
		<cfif (prodThumbExt neq "xls")>
			CFX_Excel accepts .xls file only
		<cfelse>
			<!--- read excel --->
			<cftry>
				<cfset tickBegin = GetTickCount()>
				<cfx_excel action="read" 
										File="#prodThumbDir#/#prodThumbFile#"
										Sheet="#form.Sheet#"
										Result="qryResult"
										Formula="#form.Formula#"
										StartRow="#form.StartRow#"
										EndRow="#form.EndRow#"
										StartCol="#form.StartCol#"
										EndCol="#form.EndCol#"
										HeaderRow="#form.HeaderRow#"
										ProcessMerged="#form.ProcessMerged#"
										DecimalDigit="#form.DecimalDigit#">
				<cfset tickEnd = GetTickCount()>
				<cfset loopTime = tickEnd - tickBegin>			
	
				<!--- show result query --->
				<h3>Conversion Result:</h3>
				<cfdump var="#qryResult#">
				
				<hr size="2">
				<h3>Performance</h3>
				Convert time was: #loopTime# milliseconds<br>
				Query info: #qryResult.recordcount#<br>
				<cfif looptime gt 0>
					Approx. speed: #numberformat(qryResult.recordcount/(looptime/1000))# rows/second
				</cfif>
				<br><br>
				<font size="-1">
					(Please note that our live example is running in a very busy shared hosting environment)
				</font>
				
			<cfcatch type="Any">
				<h3>There was a problem while reading '#prodThumbFile#'</h3>
				Check the file, columns to process, rows to process and other properties,<br>
				to make sure all source cells can be converted to recordset.
			</cfcatch>
			</cftry>
		</cfif>		
		
		<!--- remove temp excel --->
		<cftry>
			<cffile action="DELETE" file="#prodThumbDir#/#prodThumbFile#">
			<cfcatch type="Any"></cfcatch>
		</cftry>
	</cfif>
	</cfoutput>
</body>
</html>
