<cftry>
<cfset counter = 1 >
<cfset fieldcount = 0 >

<cfparam name="url.debugger" default="0">

<!--- COUNT THE FIELDS FOR THE COLUMNS COUNT TABLE --->
<cfloop collection="#form#" item="fname">

  <cfif #fname# EQ "AttendType" OR 
				#fname# EQ "id" OR
				#fname# EQ "format" OR
				#fname# EQ "layout" OR 
				#fname# EQ "count" OR 
				#fname# EQ "Status" OR
				#fname# EQ "ChkCancelled" OR 
				#fname# EQ "SUBMIT.Y" OR 
				#fname# EQ "SUBMIT.X" > 
  <cfelse>
    <cfset fieldcount = fieldcount + 1>
  </cfif>
  
</cfloop>

<cfif form.paid EQ "yes" OR form.paid EQ "no" OR form.paid EQ "all">
		<cfset fieldcount = fieldcount + 1>
</cfif>

<cfif form.ChkCancelled EQ "= 1" OR form.ChkCancelled EQ "*">
		<cfset fieldcount = fieldcount + 1>
</cfif>

<!--- edit: removed reg table id: ,[RegTable_id] --->

<cfquery datasource="#gpp#" name="get">
        SELECT distinct
        	 [Title]
              ,[name]
              ,[surname]
              ,[company]
              ,[possition]
              ,[chkSpeaker]
              ,[ChkCancelled]
              ,[eventID]
              ,[chkGuest]
              ,[chkModerator]
              ,[chkExhibitor]
              ,[chkPress]
              ,[chkDelegate]
              ,[comment]
              ,[user_id]
              ,[discount]
              ,[paid]
              ,[chkCompGuest]
              ,[email]
              ,active as [STATUS]
              ,[invoiceNo]
              ,[phone]
              ,[phone_ALT]
              ,[fax]
              ,[mobile]
              ,[email_sec]
              ,[formSent]
              ,[country]
              ,[address]
              ,[city]
              ,[zip]
              ,[POBOX]
              ,[Comment_Public]
              ,[eventName]
              ,[userID]
              ,[chkSponsor]
              ,[invoiceID]
        FROM 
        	[VIEW_Conference_Attendence_list]
        WHERE 
        	[lngConference_ID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
        AND (
         <cfloop list="#form.AttendType#" delimiters="," index="i">
          <cfif counter NEQ 1 > OR </cfif> #i# = 1<cfset counter = counter + 1>
         </cfloop>
         )
        <cfif form.paid EQ "yes" OR form.paid EQ "no" OR form.paid EQ "NULL">
            AND (
                 paid = <cfif form.paid EQ "no">'NO' OR paid IS NULL <cfelse>'YES'</cfif>
              )
        </cfif>
        
        <cfif form.active NEQ 'off'>
        	AND
            	active #form.active#
        </cfif>

        <cfif form.ChkCancelled NEQ "*">
        	<cfif form.ChkCancelled EQ "0">
                AND
                 (ChkCancelled != 1 OR ChkCancelled IS NULL  )
             <cfelseif  form.ChkCancelled EQ "1">
             	AND 
                ChkCancelled = 1
             </cfif>
         </cfif>
        ORDER BY 
         company, surname
</cfquery>

<cfscript>
	filename = "#replace(get.eventName, ' ', '-', 'ALL')#_#dateformat(now(), "yyyy-mm-dd")#";
	filename = "#replace(filename, ':', '', 'ALL')#";
	dateCreated = dateFormat(now(), 'dd_mm_yy');
</cfscript>

<cfif url.debugger eq 'y3s'>
    <cfdump var="#filename#">
    <cfdump var="#get#">
    <cfabort>
</cfif>

<cfif form.format EQ "excel">
<!---
  <CFHEADER NAME="Content-Disposition" VALUE="inline; filename=#filename#.xls">
  <CFCONTENT TYPE="application/vnd.msexcel">
      <cfinclude template="dsp_columns.cfm">
  </CFCONTENT>--->
  
  <cfspreadsheet 
	query="get"
	action="write" 
    overwrite="yes"
    filename="G:\websites\my-officeX\_files\temporary\#filename#_#dateCreated#.xls">
<cfoutput>
	<a href="http://www.petro21.com/my-officeX/_files/temporary/#filename#_#dateCreated#.xls" target="_blank">Download the excel document </a>
</cfoutput>

<cfelseif form.format EQ "pdf">

  <cfdocument format="pdf" pagetype="A4" marginbottom="0.4" margintop="0.4" marginleft="0.01" marginright="0.01" filename="#filename#.pdf" overwrite="yes"><!---src="http://www.petro21.com/my-office/_files/temporary"--->
	  <cfif form.layout EQ "List">
              <cfinclude template="dsp_columns_list.cfm">
      <cfelse>
              <cfinclude template="dsp_columns.cfm">
      </cfif>
  </cfdocument>
  
  <cfheader name="content-disposition" value="attachment;filename=#filename#.pdf">
  <cfcontent type="application/pdf" file="http://www.petro21.com/my-office/List-Registered/#filename#.pdf" deletefile="no">
  
<cfelseif form.format EQ "screan">
  <cfinclude template="dsp_columns.cfm">
</cfif>



<cfcatch type="any">
	<cfdump var="#cfcatch#">
</cfcatch>
</cftry>