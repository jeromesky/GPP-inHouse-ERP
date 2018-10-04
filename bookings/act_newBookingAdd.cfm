<cfparam name="bookingComment" default="#Lcase(form.INVComments)#">

<cfquery datasource="#gpp#" >
	INSERT INTO [bookings]
    	(
        
        
        )
    VALUES
    	(
        
        
        
        )


      ,[invoiceID]
      ,[bookingReference]
      ,[insertDate]
      ,[sourceID]
      ,[profileUserID]
      ,[delegateUserID]
      ,[bookingType]
      ,[eventID]
      ,[invitee]
      ,[status]
      ,[priceCurrency]
      ,[priceCost]
      ,[priceVAT]
      ,[priceFull]
      ,[payment]
      ,[bookingComment]
  FROM
  		
  
  </cfquery>
  
  <cfswitch expression="#form.attendeeType#">
		<cfcase value="chkDelegate">
        	<cfset bookingType = 1>
         </cfcase>
         
         <cfcase value="chkSpeaker">
        	<cfset bookingType = 2>
         </cfcase>
         
         <cfcase value="chkGuest">
        	<cfset bookingType = 3>
         </cfcase>
         
         <cfcase value="chkModerator">
        	<cfset bookingType = 4>
         </cfcase>
         
         <cfcase value="chkExhibitor">
        	<cfset bookingType = 5>
         </cfcase>
         
         <cfcase value="chkPress">
        	<cfset bookingType = 6>
         </cfcase>
         
         <cfcase value="chkSponsor">
        	<cfset bookingType = 8>
         </cfcase>
         
         <cfcase value="chkresearch">
        	<cfset bookingType = 7>
         </cfcase>
 </cfswitch>