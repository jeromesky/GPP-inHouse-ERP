<cfquery datasource="#gpp#" name="qryBooking">
SELECT
		[bookingReference]
      ,[invoiceID]
      ,[insertDate]
      ,[profileUserID]
      ,[p_name]
      ,[p_otherNames]
      ,[p_lastName]
      ,[p_position]
      ,[p_email]
      ,[p_AKA_companyName]
      ,[p_addressPostal]
      ,[p_addressCityName]
      ,[p_addressCityID]
      ,[P_addressPostalCode]
      ,[eventID]
      ,[p_phoneCode]
      ,[p_phoneNo]
      ,[p_faxCode]
      ,[p_faxNo]
      ,[countryPhoneCode]
      ,[countryName]
      ,[namePrefixLabel]
  FROM 
  		[CRM_booking_Details]
  WHERE
  		[bookingReference] = <cfqueryparam cfsqltype="cf_sql_char" value="#url.bookingReference#">
  </cfquery>
  
  <cfset EventIDs = ValueList(qryBooking.eventID, ",")>
  
  <cfquery datasource="#gpp#" name="qryEvents">
  	SELECT
    	[eventName]
        ,[eventID]
    FROM
    	[CRM_events]
  WHERE
  		[eventID] IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#EventIDs#">)
  </cfquery>