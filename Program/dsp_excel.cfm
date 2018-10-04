<cfoutput>
<cfset objActress = {
Name = "Maria Bello",
Attractive = "Extremely"
} />
#SerializeJSON( objActress )#</cfoutput>
<!---<cfoutput>



<cfsavecontent variable="excelHTMLcode"> 
<table >
<tr>
        <td>    
          Speaker
        </td>
        <td>
            position
        </td>
        <td>
            company
        </td>
        <td>
            Topic
        </td>
        <td>
           time
        </td>
        <td>
            duration
        </td>
        <td>
            status
        </td>
        <!---<td>
            <div class="collapse speakerLoadExtraInfo" id="#qry_program.speakerID#" title="speakerInfo" alt="#qry_program.userID#">user info</div>
         </td>--->
         <td>
            comment
        </td>
        <td>
            arragements
        </td>
        <td>
            CV
        </td>
        <td>
            photo
        </td> 
 </tr>
<cfloop query="qry_program">
<tr>
<cfswitch expression="#qry_program.speakerType#">

	<cfcase value="1">
<td>    
          <strong>#qry_program.speakerName#</strong>
        </td>
        <td>
            #qry_program.userPosition#
        </td>
        <td>
            #qry_program.companyName#
        </td>
        <td>
            #qry_program.speakerTopic#
        </td>
        <td>
            #qry_program.speakerTime#
        </td>
        <td>
            #(qry_program.speakerUnit*5)#  min
        </td>
        <td>
            <cfswitch expression="#qry_program.speakerStatus#">
                <cfcase value="1">
                    contacted
                </cfcase>
                <cfcase value="2">
                     in progress
                </cfcase>
                <cfcase value="3">
                     confirmed
                </cfcase>
                <cfcase value="6">
                     finalized
                </cfcase>
                <cfcase value="11">
                     declined
                </cfcase>
            </cfswitch>
        </td>
        <!---<td>
            <div class="collapse speakerLoadExtraInfo" id="#qry_program.speakerID#" title="speakerInfo" alt="#qry_program.userID#">user info</div>
         </td>--->
         <td>
            #qry_program.comment#
        </td>
        <td>
            #qry_program.arragements#
        </td>
        <td>
            <cfif qry_program.cvFileName NEQ "">
            yes
            <cfelse>
            no
            </cfif>
        </td>
        <td>
            <cfif qry_program.fileName NEQ "">
            yes
            <cfelse>
            no
            </cfif>
        </td>     
     </cfcase>
     	<cfcase value="5">
        <td>    
          <strong>#qry_program.speakerName#</strong>
        </td>
        <td>
            #qry_program.userPosition#
        </td>
        <td>
            #qry_program.companyName#
        </td>
        <td>
            
        </td>
        <td>
            #qry_program.speakerTime#
        </td>
        <td>
            #(qry_program.speakerUnit*5)#  min
        </td>
        <td>
            <cfswitch expression="#qry_program.speakerStatus#">
                <cfcase value="1">
                    contacted
                </cfcase>
                <cfcase value="2">
                     in progress
                </cfcase>
                <cfcase value="3">
                     confirmed
                </cfcase>
                <cfcase value="6">
                     finalized
                </cfcase>
                <cfcase value="11">
                     declined
                </cfcase>
            </cfswitch>
        </td>
        <!---<td>
            <div class="collapse speakerLoadExtraInfo" id="#qry_program.speakerID#" title="speakerInfo" alt="#qry_program.userID#">user info</div>
         </td>--->
         <td>
            #qry_program.comment#
        </td>
        <td>
            #qry_program.arragements#
        </td>
        <td>
            <cfif qry_program.cvFileName NEQ "">
            yes
            <cfelse>
            no
            </cfif>
        </td>
        <td>
            <cfif qry_program.fileName NEQ "">
            yes
            <cfelse>
            no
            </cfif>
        </td> 
     </cfcase>
     
     
</cfswitch></tr></cfloop></table></cfsavecontent></cfoutput>---><!---

<!--- Create new spreadsheet --->
<cfset SFDir = spreadsheetNew()>
   
 <!--- Create header row --->
<cfset SpreadsheetAddRow(SFDir, "Speaker,position,company,Topic,time,duration,status,comment,arragements,CV,photo")>
   
<!--- Set column widths 
<cfset SpreadSheetSetColumnWidth(SFDir,1,10)> 
<cfset SpreadSheetSetColumnWidth(SFDir,2,25)> --->
  
<!--- Format column 1 --->
<cfset formatSFDir = structnew()>
<cfset formatSFDir.bold = "true">
<cfset formatSFDir.alignment = "left">
<cfset SpreadsheetFormatRow(SFDir, formatSFDir, 1)>
   
<!--- Add orders from query --->
<cfset SpreadsheetAddRows(SFDir, myQuery)>
   
 <!--- Save spreadsheet --->
<cflock name="programExcel" timeout="20" type="exclusive">
<cfspreadsheet action="write" name="SFDir" filename="C:\temp\SF_School_Directory.xls" overwrite="true">
<!--- 
   <!--- Open / Download Spreadsheet File --->
   <cfheader name="Content-Disposition"    value="inline; filename=SF_School_Directory.xls">
   <cfcontent type="application/csv"    file="C:\temp\SF_School_Directory.xls"    deletefile="yes"> --->
</cflock>--->
