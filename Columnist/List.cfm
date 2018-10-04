<cfinclude template="../Application.cfm">
<cfoutput>
 <cfquery name="getList" datasource="#dsnP21#">
  SELECT <cfif form.numberValue NEQ "" >TOP #form.numberValue#</cfif>  Columnist_list .id, Columnist_list.Filename, Columnist_list.insertDate, Columnist_list.Title, Columnist_list.submitDate, Columnist_list.Blurb , speakers.name  , speakers.delegation, speakers.photo
  FROM Columnist_list
  LEFT JOIN speakers
  ON Columnist_list.Person = speakers.id
  <cfif parameterexists(form.submitDate) AND form.submitDate NEQ "" >
  WHERE Columnist_list.submitDate #form.datecompare# <cfqueryparam cfsqltype="cf_sql_date" value="#form.submitDate#" >
  </cfif>
 ORDER BY Columnist_list.submitDate
 </cfquery>  

 <cfloop query="getList">   
    	<div id="row_#getList.id#" style="border:1px solid ##F3DFD1; <cfif  getList.currentRow NEQ getList.recordcount  > border-bottom:1px solid ##FFFFFF</cfif>" >
        <table width="100%" border="0" cellspacing="0" cellpadding="10">
  <tr>
    <td width="100" align="center" valign="middle"><img src="http://www.petro21.com/speakers/photos/#getList.photo#" /></td>
    <td valign="top"><strong>#getList.Title#</strong><br />
    #getList.name#, #getList.delegation#<br  /><br />
   <blockquote> #getList.Blurb#</blockquote><br  /><br />
    #dateFormat(getList.submitDate, "dd mmm yyyy")#
    
    </td>
    <td width="20" valign="top" align="right"><a href="javascript:Delete_File(#getlist.id#);"><img src="../img/newS_delete.gif" width="14" height="14" /></a>    </td>
  </tr>
</table>
		</div>
 </cfloop>
 </cfoutput>