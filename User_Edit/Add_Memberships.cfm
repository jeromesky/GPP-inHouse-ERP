<cfinclude template="../application.cfm">
<cfsilent>
        <cfquery datasource="#gpp#" name="get" >
                INSERT  Memberships
                        ( eventid, MembershipExpire, userID, CompanyID)
                VALUES 
                        (  
                            <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventid#">, 
                            <cfqueryparam cfsqltype="cf_sql_date" value="#form.MembershipExpire#" >,
                            
                            <cfif form.companyID NEQ 0 >
                            		0,
        		                    <cfqueryparam cfsqltype="cf_sql_integer" value="#form.companyID#">
							<cfelse>
		                            <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userID#">,
        		                    0
                           </cfif>        
                         )
                SELECT @@IDENTITY AS id
        </cfquery>
        <!--- GET EVENT NAME ------->
        <cfquery datasource="#gpp#" name="getEvent" >
                SELECT eventName
                FROM CRM_Events
                WHERE eventID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventid#">
        </cfquery>
</cfsilent>
<cfoutput>
<div class="record" id="membershipRecord_#get.id#">  
<b>Event</b><i class="NoFormat">#getEvent.eventName#</i>
<b>End Date</b> <i class="NoFormat">#dateformat(form.MembershipExpire, "ddd, dd mmm yyyy")#</i>
<div class="clear"></div> 
</div>
</cfoutput>