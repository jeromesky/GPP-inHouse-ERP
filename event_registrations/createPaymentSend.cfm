<cfinclude template="../Application.cfm">

<cfif parameterexists(form.id)>

  <cfquery datasource="#dsnP21#" name="insert">
    UPDATE 
    	registrations
    SET
      Transtype			='#form.Transtype#',
      paymentReference	='#form.paymentReference#',
      approved			= 0,
      cardpass			= 0
    WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>

  <cfelse>
  
<cftry>  

<cfquery datasource="#dsnP21#" name="insert">
  INSERT INTO 
    registrations (
      title, 
      name, 
      surname, 
      company, 
      gemail, 
      country, 
      Transtype, 
      event, 
      Pid, 
      netbanx_reference, 
      eventid, 
      userid, 
      currency, 
      eventcost, 
      VAT, 
      payment_amount, 
      payment_amount_GBP, 
      paymentReference, 
      vatreg, 
      approved, 
      cardpass
      )
  VALUES (
    '#form.title#', 
    '#Left(form.name, 50)#', 
    '#Left(form.surname, 50)#', 
    '#Left(form.company, 50)#', 
    '#Left(form.gemail, 50)#', 
    '#Left(form.country, 50)#', 
    '#Left(form.Transtype, 8)#', 
    '#Left(form.event, 450)#', 
    '#Left(form.Pid, 15)#', 
    '#Left(form.netbanx_reference, 25)#', 
    '#Left(form.eventid, 50)#', 
    '#trim(form.userid)#', 
    'GBP', 
    '#trim(numberformat(form.payment_amount_GBP,'999999.99'))#', 
    '0',
    '#trim(numberformat(form.payment_amount_GBP,'999999.99'))#', 
    '#trim(numberformat(form.payment_amount_GBP,'999999.99'))#', 
    '#Left(form.paymentReference, 10)#', 
    '#form.vatreg#', 
    0, 
    0
    )
</cfquery>

<cfcatch type = "Database">
  <cfmail from="web@petro21.com" to="#contactAdmin#" subject="Error on Payment Page DB capture">
    <cfdump var="#form#">
  </cfmail>
</cfcatch>

</cftry>
</cfif>
<cfoutput>#left(form.Pid, 15)#</cfoutput>
<cflocation url="http://www.petro21.com/order/send.cfm?Pid=#Left(form.Pid, 15)#&Transtype=#form.Transtype#" addtoken="no">