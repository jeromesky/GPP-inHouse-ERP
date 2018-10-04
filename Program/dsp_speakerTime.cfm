<cfparam name="form.searchStatus" default="0">
<cfparam name="form.printStatus" default="speakerTime">
<cfparam name="form.eventID" default="#qryEvent.eventId#"  type="integer"> 

<cfparam name="form.userID" default="#user_id#" type="integer"> 

<cfinclude template="qry_program.cfm">
<cfoutput query="qry_program">
<!---,[speakerDateAdded]
      ,[speakerID]
      ,[]
      ,[speakerOrder]
      ,[speakerKeyNote]
      ,[speakerUnit]
      ,[userID]
      ,[cvFileName]
      ,[speakerTopic] 
      ,[speakerType]
      ,[extraDetails]
      ,[speakerTime]
      ,[comment]
      ,[arragements]
      ,[]
        in session  <br>
      filename: #qry_program.fileName#--->
      <tr>
    <td valign="top" align="right"><strong>Presentation Date</strong></td>
    <td valign="top">#DateFormat(qry_program.speakerDate, "dd mmmm yyyy")#</td>
  </tr>
    <tr>
    <td valign="top" align="right"><strong>Presentation Time</strong></td>
    <td valign="top">#TimeFormat(qry_program.speakerTime, "HH:MM")#</td>
  </tr>
  <tr>
    <td valign="top" align="right"><strong>In Session</strong></td>
    <td valign="top">#qry_program.speakerSession#</td>
  </tr>
 </cfoutput>