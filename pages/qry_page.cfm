<cfquery name="qryPage" datasource="#gpp#" maxrows="1">
	SELECT 
      [contentName]
      ,[contentLabel]
      ,[contentText]
      ,[contentHTML]
      ,[contentDateAdded]
      ,[contentDateUpdated]
      ,*
  	FROM 
    	[contents]
    WHERE
      (
        [contentID] = #url.ID#
      );
</cfquery>

<cfif qryPage.contentLayout NEQ ''>

  <cfscript>
    qryContent = qryPage;
    editNum = 1;
    //col.maxColumn = 2; 
    //2 to 4
    col.maxColumn = ListLen(trim(qryContent.contentLayout), '|');
    
    //find c value;
    if (col.maxcolumn EQ 3)
    { 
    qrycol.3 = listGetAt(trim(qryContent.contentLayout), 3, '|');
    }
    
    if (col.maxcolumn EQ 4)
    { 
    qrycol.4 = listGetAt(trim(qryContent.contentLayout), 4, '|');
    }

     qrycol.1 = listGetAt(trim(qryContent.contentLayout), 1, '|');
     qrycol.2 = listGetAt(trim(qryContent.contentLayout), 2, '|');
  </cfscript>
  
<cfelse>

    <cfscript>
     col.maxColumn = 2; 
         editNum = 1;
    </cfscript>

</cfif>