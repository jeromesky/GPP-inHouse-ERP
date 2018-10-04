<cfscript>
bookingTypeIDsDelegates = '#form.eventID#';
isdDnner = 0;
</cfscript>

<!--- remove ID from EVENTS which are not Delegate registrations --->
<cfloop list="#form.eventID#" index="i">
    <cfif form['#i#_bookingType'] NEQ 1>
        <cfset bookingTypeIDsDelegates = ListDeleteAt(bookingTypeIDsDelegates, listFind(bookingTypeIDsDelegates, i, ","), ",")>
    </cfif>
</cfloop>

<!--- find dinner to set text on the display --->
<cfloop query="qryEvents">
	<cfif qryEvents.event_type EQ "din">
    	<cfset isdDnner = 1>
    </cfif>

</cfloop>

<cfscript>
	discount 	= 0;
	dinnerCost = 0;

	//fetch total cost for this user
	eventIDsIN 	= "#bookingTypeIDsDelegates#";
	promoCodeIN= "";
	discountIN= #form.discount#;
	priceOb = createObject("component", "Webcfc.registrationEventPrice");
  	qry_bookingTotal = priceOb.bookingLITotal(eventIDsIN,promoCodeIN, discountIN);
</cfscript>


<!----/////////////NEED  TO DO CHECK TO SEE IF RECORDS HAVE ALREADY BEEN ADDED FOR DUPS
CHECK ON THE USERID AND BOOKING REFERENCE ------------->

<cfloop list="#form.eventID#" index="i">

<!----search prices as subquery --------------->
<cfquery dbtype="query" name="qryEventPrice">
	SELECT  
    	[eventPrice]
       ,[eventCurrency]
    FROM
    	[qryEvents]
     WHERE
     	[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#i#">
</cfquery>

<cfquery datasource="#gpp#">
	INSERT INTO [bookings]
    	(
       [bookingReference]
      ,[insertDate]
      ,[sourceID]
      ,[delegateUserID]
      ,[bookingType]
      ,[eventID]
      ,[invitee]
      ,[status]
      ,[priceCurrency]
      ,[priceCost]
      ,[priceFull]
      ,[discount]
      ,[bookingComment]
        )
    VALUES
    	(
       <cfqueryparam cfsqltype="cf_sql_char" value="#form.bookingReference#">
      ,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
      ,<cfqueryparam cfsqltype="cf_sql_integer" value="#session.gpp_ID#">
      ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#">
      ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form['#i#_bookingType']#">
      ,<cfqueryparam cfsqltype="cf_sql_integer" value="#i#">
      ,<cfqueryparam cfsqltype="cf_sql_integer" value="0">
      ,<cfqueryparam cfsqltype="cf_sql_integer" value="0">
      ,<cfqueryparam cfsqltype="cf_sql_char" value="#qryEventPrice.eventCurrency#">
      ,<cfqueryparam cfsqltype="cf_sql_decimal" value="#qryEventPrice.eventPrice#">
      ,<cfqueryparam cfsqltype="cf_sql_decimal" value="#qry_bookingTotal.PRICETOTAL#">
      ,<cfqueryparam cfsqltype="cf_sql_decimal" value="#form.discount#">
      ,<cfqueryparam cfsqltype="cf_sql_char" value="#form['#i#_bookingComment']#">      
        ) 		
  </cfquery>
  
  
  <!--- ADD RECORD TO THE SPEAKERS TABLE IF THIS IS A SPEAKER OR MODERATOR ------------->
  <cfif form['#i#_bookingType'] EQ 2 OR form['#i#_bookingType'] EQ 4>
		  <cfscript>
          programSpeakerType = #form['#i#_bookingType']#;
          
          if (programSpeakerType EQ 2){
              programSpeakerType = 1;
          } else if (programSpeakerType EQ 4){
                programSpeakerType = 5;  
          }
          </cfscript>
         <cfset form.eventid = #i#>
         <cfset form.speakerType = #programSpeakerType#>
         	
            <cfif parameterexists(form.newRegistration) and form.newRegistration EQ 1>
				<cfinclude template="../Program/qry_new_Speake_Save.cfm">
        	</cfif>
   </cfif>
  
  <!--- ADD RECORD TO THE OLD TABLE TO CHECK WILL NEED TP REMOVE THIS OUT ------------->
		<cfif parameterexists(form.newRegistration) and form.newRegistration EQ 1>
        		<cfinclude template="temp_addBokking2Old.cfm">  
        </cfif>
</cfloop>