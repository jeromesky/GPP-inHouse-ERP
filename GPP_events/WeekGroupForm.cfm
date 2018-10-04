<cfinclude template="../application.cfm">

<cfif parameterexists(form.strConference_Description) >

            <cfquery datasource="#gpp#" name="getGroup">
                UPDATE  tblConference
                SET  
                strConference_Description 	= <cfqueryparam value="#form.strConference_Description#" >,
                web_id								= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.web_id#"> ,
                weekDate							= <cfqueryparam cfsqltype="cf_sql_date" value="#form.weekDate#"> ,
                week									= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.week#">
                WHERE IngCon_ID = 			<cfqueryparam value="#form.id#" >
            </cfquery>

				<cfoutput>
                <tr >
                        <td>#form.strConference_Description#</td>
                        <td >#datepart("yyyy", form.weekDate)#&nbsp;</td>
                        <td  >#form.web_id#&nbsp;</td>
                        
                        <td ><a href="javascript:ViewWeek(#form.id#);" ><img src="../img/refresh16.gif" border="0" /></a></td>
                        <td ><!---<a href="javascript:LoadWeekPane(#getGroup.IngCon_ID#, #form.id#);" ><img src="../img/refresh16.gif" border="0" /></a>---></td>
                </tr>
				</cfoutput>
<cfelse>
<script type="text/javascript">
$(document).ready(function() {
$("#weekDate").datepicker({dateFormat: "d MM, yy"});


    $('#formWeek').submit(function() { 
		$(this).ajaxSubmit( {clearForm: false, success: function (returnData){ $('#areaWeekGroupEdit').html("");   $('#table_weekgroups tr:first').before(returnData);    }   }) ; 
		return false; 
    }); 
	
  });
</script>
	
            
            	<!--- GET THE WEB IDS ------------------------------------------>
				<cfquery datasource="#dsnP21#" name="getWeekWEBID">
                select  id, event_name, event_year
                from events
                WHERE event_type = 'week' 
                ORDER BY event_expire desc
                </cfquery>
               			<cfparam name="getdata.strConference_Description" default="New name" >
                        <cfparam name="getdata.weekDate" default="10 01 1999" >
						<cfparam name="getdata.web_id" default="0" >
                
                <cfif form.id NEQ 0>
                	<cfquery datasource="#gpp#" name="getdata">
                    select  IngCon_ID AS id, strConference_Description, web_id, weekDate
                    from tblConference
                    WHERE IngCon_ID = <cfqueryparam value="#form.id#" >
               		</cfquery>
                
                <cfelseif form.id EQ 0>
                	<cfquery datasource="#gpp#" name="getdata">
                    INSERT INTO   tblConference
                    (week, chkAvailable, insertdate) 
					VALUES
                    (#form.week#, 1, <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">)
                    SELECT @@IDENTITY AS id
               		</cfquery>
                    	
                
                </cfif>
		<cfoutput>
                <table border="0" cellpadding="2" cellspacing="2" >
                    <tr>
                        <td valign="baseline">Week Name</td>
                   </tr>
                   <tr>
                        <td><input type="text" name="strConference_Description" value="<cfif form.id NEQ 0>#getdata.strConference_Description#</cfif>"></td>
                   </tr>
                   <tr>
                        <td valign="baseline">Event week start date</td>
                   </tr>
                   <tr>
                        <td><input type="text" name="weekDate" id="weekDate" value="<cfif form.id NEQ 0>#dateformat(getdata.weekDate, "dd mm yyy")#</cfif>"></td>
                   </tr>
                   <tr>
                        <td>Select web ID match</td>
                   </tr>
                   <tr>
                        <td>
                            <select name="web_id" >
                            		<option value="0" >event not available</option>
                                <cfloop query="getWeekWEBID">
                                    <option value="#getWeekWEBID.id#" <cfif form.id NEQ 0><cfif getdata.web_id EQ #getWeekWEBID.id# >selected</cfif></cfif>>#getWeekWEBID.event_name# #getWeekWEBID.event_year#</option>
                                </cfloop>
                            </select>
                        </td>
                   </tr>
                   <tr>
                        <td align="right"><input type="hidden" name="id" value="#getdata.id#"><input type="hidden" name="week" value="#form.week#"><input  type="submit" value="save"></td>
                   </tr>
               </table>
        </cfoutput>
</cfif>