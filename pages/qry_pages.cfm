<cfparam name='url.history' default='off'>

<cfif url.history EQ 'on'>

  <cfquery name="qryPages" datasource="#gpp#">
    SELECT 
        [contentID]
        ,[contentName]
        ,[contentLabel]
        ,[contentDateAdded]
        ,[contentDateUpdated]
      FROM 
        [contents]
  </cfquery>

<cfelse>

  <cfquery name="qryPages" datasource="#gpp#">
    SELECT 
        [contentID]
        ,[contentName]
        ,[contentLabel]
        ,[contentDateAdded]
        ,[contentDateUpdated]
      FROM 
        [contents]
      WHERE
        [contentDeleted] is null
  </cfquery>

</cfif>