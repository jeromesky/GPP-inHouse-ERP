
<cfparam name="form.projectApprovedDate" default="0">

<cfquery datasource="#gpp#" name="qryProjects">
	SELECT  
    	[projectID]
      ,[projectName]
      ,[projectDateAdded]
      ,[projectApprovedDate]
      ,[projectCompetedDate]
  FROM
  		[Projects]
  <cfif form.projectApprovedDate NEQ 0>
  WHERE 
  		[projectApprovedDate] <> 0
  </cfif>
  ORDER BY
  		[projectName]

</cfquery>