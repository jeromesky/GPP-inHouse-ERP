<cfquery datasource="#gpp#" name="qry_events">    
  SELECT distinct
      eventName, 
      eventID
        FROM 
        	[VIEW_Conference_Attendence_list]
        	order by eventName;
</cfquery>