<cfinclude template="../application.cfm">
<!---- DO UPDATE HERE -------------->
<cfif parameterexists(form.strConference_Name) >

            <cfquery datasource="#gpp#" >
                UPDATE  tblAnnual_Conf
                SET 
                event_abbr							=  <cfqueryparam value="#form.strConference_Code#" >,
                strConference_Code			=  <cfqueryparam value="#form.strConference_Code#" >,
                event_expire						= <cfqueryparam cfsqltype="cf_sql_date" value="#form.event_expire#" >,
                strConference_Name			= <cfqueryparam  value="#form.strConference_Name#"> ,
                event_name						= <cfqueryparam  value="#form.strConference_Name#">,
                cancelled								= <cfif parameterexists(form.cancelled) >1<cfelse>0</cfif> ,
<!---          webID									= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.webID#">,--->
                AnType								= <cfqueryparam  value="#form.AnType#">,
                event_type						= <cfqueryparam  value="#form.AnType#">,
                lngCon_ID							= <cfqueryparam cfsqltype="cf_sql_integer"  value="#form.lngCon_ID#">,
                groupby								= <cfqueryparam  cfsqltype="cf_sql_integer" value="#form.groupby#">
                WHERE IngConference_ID = <cfqueryparam value="#form.id#" >
            </cfquery>
            
            <!--- SEE iF UPDATE WAS PERFORMED DU TO NEW WID ---->
            <cfquery datasource="#gpp#" name="doUpdate">
            		SELECT IngConference_ID
                    FROM tblAnnual_Conf
                    WHERE IngConference_ID = <cfqueryparam value="#form.id#" >
            </cfquery>
            			<cfif doUpdate.recordcount eq 0 >
                        				<cfquery datasource="#gpp#" name="getNewRecord">
                                        INSERT INTO   tblAnnual_Conf
                                        (lngCon_ID, chkCocktail, chkDinner, insertdate) 
                                        VALUES
                                        (<cfqueryparam cfsqltype="cf_sql_integer"  value="#form.lngCon_ID#">, 1, 1, <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">)
                                        SELECT @@IDENTITY AS id
                                        </cfquery>
                        
                        
                                        <cfquery datasource="#gpp#" name="getGroup">
                                        UPDATE  tblAnnual_Conf
                                        SET 
                                        event_abbr							=  <cfqueryparam value="#form.strConference_Code#" >,
                                        strConference_Code			=  <cfqueryparam value="#form.strConference_Code#" >,
                                        event_expire						= <cfqueryparam cfsqltype="cf_sql_date" value="#form.event_expire#" >,
                                        strConference_Name			= <cfqueryparam  value="#form.strConference_Name#"> ,
                                        event_name						= <cfqueryparam  value="#form.strConference_Name#">,
                                        cancelled							= <cfif parameterexists(form.cancelled) >1<cfelse>0</cfif> ,
                          <!---              webID									= <cfqueryparam cfsqltype="cf_sql_integer" value="#form.webID#">,--->
                                        AnType								= <cfqueryparam  value="#form.AnType#">,
                                        event_type							= <cfqueryparam  value="#form.AnType#">,
                                        lngCon_ID							= <cfqueryparam cfsqltype="cf_sql_integer"  value="#form.lngCon_ID#">,
                                        groupby								= <cfqueryparam  cfsqltype="cf_sql_integer" value="#form.groupby#">,
                                        <cfif form.AnType NEQ "week">
                                        parentID							= <cfqueryparam cfsqltype="cf_sql_integer" value="#getNewRecord.id#">,
                                        </cfif>
                                        webID								= <cfqueryparam cfsqltype="cf_sql_integer" value="#getNewRecord.id#">
                                        
                                        WHERE IngConference_ID = <cfqueryparam value="#getNewRecord.id#" >
                                    </cfquery>
                                    
                                    	<!--- SET events old table ---->
                                    	<cfquery datasource="#dsnP21#" >
                                        	INSERT INTO events (id, id_gpp, event_type, event_name)
                                            VALUES (
                                            	<cfqueryparam cfsqltype="cf_sql_integer" value="#getNewRecord.id#">
                                                ,<cfqueryparam cfsqltype="cf_sql_integer" value="#getNewRecord.id#">
                                                ,<cfqueryparam  value="#form.AnType#">
                                                ,<cfqueryparam  value="#form.strConference_Name#">
                                            )
                                           </cfquery>
                                        
                          </cfif>
                                    
                                    
                       <!--- </cfif>--->
            
            
            <tr <cfif parameterexists(form.cancelled) >bgcolor="##FFCDD6" </cfif> >
                    <td >#form.strConference_Name#&nbsp;</td>
                    <td  >#datepart("yyyy", form.event_expire)#&nbsp;</td>
                    <td   >#form.webID#&nbsp;</td>
                    <td  ><a href="javascript:LoadConferencePane(#form.id#, #form.lngCon_ID#);" ><img src="../img/refresh16.gif" border="0" /></a></td>
            </tr>


<cfelse>



			<cfquery datasource="#dsnP21#" name="getWeekWEBID">
                select  id, event_name, event_year
                from events
                WHERE event_type = 'event' OR event_type = 'week' OR  event_type = 'eb' OR event_type = 'din' OR event_type = 'Bu_Pr'
                ORDER BY event_expire desc
                </cfquery>
                
                <cfquery datasource="#dsnP21#" name="get_group">
                                select  *
                                from groupby
               </cfquery>
                
                
                
               <cfif form.id NEQ 0>
                                <cfquery datasource="#gpp#" name="getdata">
                                select  cancelled, webID, groupby, event_expire,
                                		CASE                   
                                            WHEN event_name <> ' ' 
                                            THEN event_name   
                                            ELSE strConference_Name
                                            END AS strConference_Name,

                                            
                                            CASE                   
                                            WHEN event_type <> ' ' 
                                            THEN event_type   
                                            ELSE AnType
                                            END AS AnType,
                                            
                                            CASE
                                            WHEN event_abbr <> ' '
                                            THEN event_abbr 
                                            ELSE strConference_Code
                                            END AS strConference_Code
                                            
                                            
                                from tblAnnual_Conf
                                WHERE IngConference_ID = <cfqueryparam value="#form.id#" >
                                </cfquery>
			 
			  <cfelseif form.id EQ 0>
                                <cfquery datasource="#gpp#" name="getNewdata">
                                SELECT TOP 1 IngConference_ID
                                FROM  tblAnnual_Conf
                                ORDER BY IngConference_ID DESC
                                </cfquery>
                                <cfquery datasource="#gpp#" name="getdata">
                                select   cancelled, webID,  groupby, event_expire, 
                                          CASE                   
                                            WHEN event_name <> ' ' 
                                            THEN event_name   
                                            ELSE strConference_Name
                                            END AS strConference_Name,
                                            
                                            
                                            CASE                   
                                            WHEN event_type <> ' ' 
                                            THEN event_type   
                                            ELSE AnType
                                            END AS AnType,
                                            
                                            CASE
                                            WHEN event_abbr <> ' '
                                            THEN event_abbr 
                                            ELSE strConference_Code
                                            END AS strConference_Code
                                            
                                from tblAnnual_Conf
                                WHERE IngConference_ID = <cfqueryparam value="#(getNewdata.IngConference_ID+1)#" >
                                </cfquery>
                    
					<!---<cfquery datasource="#gpp#" name="getdata">
                    INSERT INTO   tblAnnual_Conf
                    (lngCon_ID, chkCocktail, chkDinner, insertdate) 
					VALUES
                    (#form.week#, 1, 1, <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">)
                    SELECT @@IDENTITY AS id
               		</cfquery>--->
                    
<!---                 <cfquery datasource="#dsnP21#" name="getWeekWEBID">
                select  id, event_name, event_year
                from events
                WHERE event_type = 'event' OR event_type = 'week' OR  event_type = 'eb' OR event_type = 'din' OR event_type = 'Bu_Pr'
                ORDER BY event_expire desc
                </cfquery>--->
                    	
			 </cfif>
             
<script type="text/javascript">
$(document).ready(function() {
$("#event_expire").datepicker({dateFormat: "d MM yy"});


<!---    $('#formConference').submit(function() { 
		$(this).ajaxSubmit( {clearForm: false, success: function (){ $('#areaConferenceEdit').html("");  $('#table_weekevent tr:first').before(returnData); }   }) ; 
		return false; 
    }); --->
	
  });
</script>             
	<cfoutput>
                <table border="0" cellpadding="1" cellspacing="0" >
                    <tr>
                      <td valign="baseline">Event Name</td>
                        <td valign="baseline">Event CODE</td>
                   </tr>
                   <tr>
                     <td><input type="text" name="strConference_Name" <cfif form.id NEQ 0>value="#getdata.strConference_Name#"</cfif>></td>
                        <td><input type="text" name="strConference_Code" <cfif form.id NEQ 0>value="#getdata.strConference_Code#"</cfif> style="width:60px"></td>
                   </tr>
                   <tr>
                     <td valign="baseline">Event  start date</td>
                        <td valign="baseline">cancelled</td>
                   </tr>
                   <tr>
                     <td><input type="text" name="event_expire" id="event_expire" <cfif form.id NEQ 0>value="#dateformat(getdata.event_expire, "dd mmm yyyy")#"</cfif>></td>
                        <td><input type="checkbox" name="cancelled" <cfif form.id NEQ 0><cfif getdata.cancelled EQ 1>checked</cfif></cfif>></td>
                   </tr>
                   <tr>
                     <td  valign="baseline">Select web ID match</td>
                        <td>&nbsp;</td>
                   </tr>
<!---                   <tr>
                     <td><select name="webID" style="width:300px" >
                       <option value="0" >event not selected</option>
                       <cfloop query="getWeekWEBID">
                         <option value="#getWeekWEBID.id#" <cfif form.id NEQ 0><cfif getdata.webID EQ getWeekWEBID.id >selected</cfif></cfif>>#getWeekWEBID.event_name# #getWeekWEBID.event_year#</option>
                       </cfloop>
                     </select></td>
                        <td>&nbsp;</td>
                   </tr>--->
                   <tr>
                   		<td>Event Type</td>
                        <td></td>
                  </tr>
                  <tr>
                  		<td><select name="AnType" style="width:300px" >
                       <option value="0" <cfif form.id NEQ 0><cfif getdata.AnType EQ 0 >selected</cfif></cfif>>event Type not selected</option>
                         <option value="week" <cfif form.id NEQ 0><cfif getdata.AnType EQ "week" >selected</cfif></cfif>>week</option>
                         <option value="event" <cfif form.id NEQ 0><cfif getdata.AnType EQ "event" >selected</cfif></cfif>>conference</option>
                         <option value="eb" <cfif form.id NEQ 0 ><cfif getdata.AnType EQ "eb" >selected</cfif></cfif>>Breifing</option>
                         <option value="din" <cfif form.id NEQ 0 ><cfif getdata.AnType EQ "din" >selected</cfif></cfif>>Dinner</option>
                          <option value="Bu_Pr" <cfif form.id NEQ 0><cfif getdata.AnType EQ "Bu_Pr" >selected</cfif></cfif>>Business Presentation</option>
                          <option value="memb" <cfif form.id NEQ 0><cfif getdata.AnType EQ "memb" >selected</cfif></cfif>>Membership</option>
                         <option value="book"<cfif form.id NEQ 0 ><cfif getdata.AnType EQ "book" >selected</cfif></cfif> >Book</option>
                         <option value="club" <cfif form.id NEQ 0 ><cfif getdata.AnType EQ "club" >selected</cfif></cfif>>Club</option>
                         <option value="spon" <cfif form.id NEQ 0><cfif getdata.AnType EQ "spon" >selected</cfif></cfif>>Sponsorship</option>
                         <option value="exh" <cfif form.id NEQ 0><cfif getdata.AnType EQ "exh" >selected</cfif></cfif>>Exhibition</option>
                     </select></td>
                        <td></td>
                 </tr>
                                    <tr>
                   		<td>Event Group web</td>
                        <td></td>
                  </tr>
                  <tr>
                  		<td><select name="groupby" style="width:300px" >
                       <option value="0" <cfif form.id NEQ 0><cfif getdata.groupby EQ 0 >selected</cfif></cfif>>no group selected</option>
                       <cfloop query="get_group">
                       <option value="#get_group.id#" <cfif form.id NEQ 0><cfif getdata.groupby EQ get_group.id >selected</cfif></cfif>>#get_group.groupby#</option>
                       </cfloop>
                     </select></td>
                        <td><input type="hidden" name="id" value="#form.id#">
                          <input type="hidden" name="lngCon_ID" value="#form.week#">
                          <input  type="submit" value="save"></td>
                 </tr>
               </table>
</cfoutput>

</cfif>