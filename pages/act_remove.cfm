<cfparam name=url.recordID default=0>

<cfquery name="qryRemove" datasource="#gpp#">
  UPDATE
    contents
  SET
    contentDeleted = '1',
    CONTENTDATEUPDATED =  GETDATE() 
  WHERE
    contentID = #url.recordID#
</cfquery>