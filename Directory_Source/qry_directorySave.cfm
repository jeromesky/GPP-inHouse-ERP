<cfquery datasource="#gpp#" name="get_List" >
INSERT INTO tblSource_Code
		(
         strSource_Code_Description
        ,DirectoryDate
        ,DirectorySource
        ,areaList
        ) 
 VALUES
 		(
          <cfqueryparam cfsqltype="cf_sql_char" value="#form.strSource_Code_Description#">
        ,<cfqueryparam cfsqltype="cf_sql_date" value="#form.DirectoryDate#">
        ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.DirectorySource#">
        ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.areaList#">
        )
</cfquery>
<cfoutput>
  <tr style="background-color:##D1FDDC">
    <td>#form.strSource_Code_Description#</td>
    <td>#form.DirectorySource#</td>
    <td>#form.DirectoryDate#</td>
  </tr>
 </cfoutput>