
<cfquery name="getDelegateCount" datasource="#gpp#" >	
        SELECT 
                 IngClient_Conf_ID, chkDelegate, chkSpeaker, chkGuest, chkModerator, chkPress, chkExhibitor, ChkCancelled
        FROM
            	   tblConference_Registration
         WHERE     
				( lngConference_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#"> ) AND 
                (   
                	(chkDelegate = <cfqueryparam cfsqltype="cf_sql_integer" value="1"> AND (ChkCancelled = 0 OR ChkCancelled IS NULL)) OR
                	(chkSpeaker = <cfqueryparam cfsqltype="cf_sql_integer" value="1"> AND (ChkCancelled = 0 OR ChkCancelled IS NULL)) OR
                    (chkGuest = <cfqueryparam cfsqltype="cf_sql_integer" value="1"> AND (ChkCancelled = 0 OR ChkCancelled IS NULL)) OR
                    (chkModerator = <cfqueryparam cfsqltype="cf_sql_integer" value="1"> AND (ChkCancelled = 0 OR ChkCancelled IS NULL)) OR
                    (chkPress = <cfqueryparam cfsqltype="cf_sql_integer" value="1"> AND (ChkCancelled = 0 OR ChkCancelled IS NULL)) OR
                    (chkExhibitor = <cfqueryparam cfsqltype="cf_sql_integer" value="1"> AND (ChkCancelled = 0 OR ChkCancelled IS NULL))
                )
</cfquery>              
        
<cfquery name="qryDelegates" dbtype="query">	
        SELECT 
                 chkDelegate  AS total
        FROM
            	   [getDelegateCount]
         WHERE     
                	(chkDelegate = <cfqueryparam cfsqltype="cf_sql_integer" value="1">)
</cfquery>  
      
<cfquery name="qryspeakers" dbtype="query">	
        SELECT 
                  chkSpeaker  AS total
        FROM
            	   [getDelegateCount]
         WHERE     
                	(chkSpeaker = <cfqueryparam cfsqltype="cf_sql_integer" value="1">)
</cfquery> 

<cfquery name="qryGuest" dbtype="query">	
        SELECT 
                 chkGuest  AS total  
        FROM
            	   [getDelegateCount]
         WHERE     
                	(chkGuest = <cfqueryparam cfsqltype="cf_sql_integer" value="1">)
</cfquery> 
      
 <cfquery name="qryModerator" dbtype="query">	
        SELECT 
                 chkModerator  AS total 
        FROM
            	   [getDelegateCount]
         WHERE     
                	(chkModerator = <cfqueryparam cfsqltype="cf_sql_integer" value="1">)
</cfquery>    

 <cfquery name="qryPress" dbtype="query">	
        SELECT 
                 chkPress  AS total 
        FROM
            	   [getDelegateCount]
         WHERE     
                	(chkPress = <cfqueryparam cfsqltype="cf_sql_integer" value="1">)
</cfquery>    
 
 
  <cfquery name="qryExhibitor" dbtype="query">	
        SELECT 
                 chkExhibitor  AS total  
        FROM
            	   [getDelegateCount]
         WHERE     
                	(chkExhibitor = <cfqueryparam cfsqltype="cf_sql_integer" value="1">)
</cfquery>       
        
<!---<cfscript>
	fieldsLabel = 'Delegate, Speaker, Guest, Moderator, Press, Exhibitor';
	fieldsToCheck = 'chkDelegate, chkSpeaker, chkGuest, chkModerator, chkPress, chkExhibitor';
	line = 1;
	total = 0;
	QueryResultCount = QueryNew("label, value");
</cfscript>

<cfloop list="#fieldsToCheck#" delimiters="," index="i">
        <cfquery name="getDelegateCount" datasource="#gpp#" >
        SELECT 
                COUNT(#i#) AS exp#line#
        FROM
            	   tblConference_Registration
         WHERE     
				( lngConference_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.eventID#"> ) AND 
                ( #i# = <cfqueryparam cfsqltype="cf_sql_integer" value="1">) AND 
                (ChkCancelled <> 1)
        </cfquery>
<!---    <cfset total = total +	 val(getDelegateCount["exp#line#"])>--->
<cfscript>
            newRow 	= QueryAddRow(QueryResultCount, 1);
            temp 		= QuerySetCell(QueryResultCount, "label", #replace(i, "chk", "", "ALL")#, #line#);
            temp 		= QuerySetCell(QueryResultCount, "value", getDelegateCount["exp#line#"], #line#);
            line 		= line +1; 
</cfscript>
        
</cfloop>

	<!---	<cfscript>
            newRow 	= QueryAddRow(QueryResultCount, 1);
            temp 		= QuerySetCell(QueryResultCount, "label", "Total", #line#);
            temp 		= QuerySetCell(QueryResultCount, "value", total, #line#); 
        </cfscript>--->--->