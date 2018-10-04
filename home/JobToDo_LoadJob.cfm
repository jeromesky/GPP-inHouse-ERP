<cfinclude template="../Application.cfm">
<cfquery datasource="#dsnP21#" name="get">
SELECT * FROM  jobstodoItem WHERE jobid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>
<cfoutput>
<cfloop query="get">
		<p>
        	<div style="margin:0 0 15px 0; color:##0066CC; font-size:11px" ><strong>posted by</strong>: #get.postby#  :#dateFormat(get.insertdate, "dd mm yyyy")#</div>
                #get.comment#</p>
</cfloop>
        <p><div style="margin:0 0 15px 0; color:##0066CC; font-size:11px"><strong>Add comment</strong></div>
        <form id="formid#form.id#" action="home/JobToDo_save.cfm" >
        <textarea name="comment" style="width:420px"></textarea>
        <button>save</button><input type="hidden" name="jobid" value="#form.id#">
        </form></p>
</cfoutput>