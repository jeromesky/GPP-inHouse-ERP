<cfinclude template="qry_viewFile.cfm">

<cfif find(".doc", qryFile.fileName) NEQ 0>
	<cfheader name="Content-Disposition" value="attachment; filename=#qryFile.fileName#"/>
    <cfcontent type="application/msword" file="#qry_filePath##qryFile.fileName#" deletefile="true" />


<cfelseif find(".docx", qryFile.fileName) NEQ 0>
	<cfheader name="Content-Disposition" value="attachment; filename=#qryFile.fileName#"/>
    <cfcontent type="application/msword" file="#qry_filePath##qryFile.fileName#" deletefile="true" />

<cfelseif find(".xlsx", qryFile.fileName) NEQ 0>
	<cfheader name="Content-Disposition" value="attachment; filename=#qryFile.fileName#"/>
    <cfcontent type="application/msexcel" file="#qry_filePath##qryFile.fileName#" deletefile="true" />

<cfelseif find(".xls", qryFile.fileName) NEQ 0>
	<cfheader name="Content-Disposition" value="attachment; filename=#qryFile.fileName#"/>
    <cfcontent type="application/msexcel" file="#qry_filePath##qryFile.fileName#" deletefile="true" />

<cfelseif find(".pdf", qryFile.fileName) NEQ 0>
	<cfheader name="Content-Disposition" value="attachment; filename=#qryFile.fileName#"/>
    <cfcontent type="application/msexcel" file="#qry_filePath##qryFile.fileName#" deletefile="true" />

<cfelse>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<titleP21</title>
</head>

<body>
<img src="<cfoutput>#qry_filePath##qryFile.fileName#</cfoutput>" />
</body>
</html>
</cfif>


<!---binary variable
<cfcontent type="application/msexcel" variable="#ToBinary( ToBase64( strExcelData.Trim() ) )#" />

Stream the file to the browser.
<cfcontent type="application/msexcel" file="#qry_filePath##qryFile.fileName#" deletefile="true" />

We are going to stream the excel data to the browser
through the standard text output stream. The browser
will then collect this data and execute it as if it
were an attachment.
 
Be careful to reset the content when streaming the
text as you don't want white-space to be part of the
streamed data.

<cfcontent
type="application/msexcel"
reset="true"
 
<!-- Write the output. -->
/><cfset WriteOutput( strExcelData.Trim() )
 
<!--
Exit out of template to prevent unexpected data
streaming to the browser (on request end??).
-->
/><cfexit />--->
