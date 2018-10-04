
<cfinclude template="../Application.cfm">
<cfset backdate = DateAdd("m", -6, now())  >

<cfquery datasource="#gpp#" name="showuser">
 	select  strEmail AS emailaddr, companyName AS company, surname AS surname, name AS name, Title AS title, country AS country
	from CRM_Individual_Details
	WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.userid#" >
</cfquery>

<!---<CFQUERY datasource="#gpp#" Name="showuser">
 Select *
 From email_news
 WHERE id =  #form.userid#
</CFQUERY>--->

	<cfset event = "" >
	  	<cfset cost = 0 >
 			<cfloop list="#form.id#" index="i">
 				<cfquery name="getname" datasource="#gpp#"   >
   					SELECT 
                    	webid AS id, 
                        event_name, 
                        event_cost_us, 
                        event_type, 
                        event_cost_currency
   					FROM 
                    	CRM_events
					WHERE eventID = #i#
  				</cfquery>
                
				<cfif getname.event_cost_us EQ  "" OR getname.event_cost_us EQ 0 >
					<cfset eventCost = 0 >
                <cfelse>
                	<cfset eventCost = getname.event_cost_us >
                </cfif>
  				<cfset cost =  cost + eventCost >
  				<cfset event = getname.event_name & "/" & getname.event_type & "," & event >
 			</cfloop>


 <table width="100%" border="0" cellspacing="2" cellpadding="2"  style="color:#333333">

  <tr>
    <td width="176">&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td>title</td>
    <td>
    	<input  type="text" name="title" value="<cfoutput>#showuser.title#</cfoutput>" />
     <!--- <select name="title" style="width:170px">
	  <cfif showuser.title EQ "" ><option value="Mr" selected>Mr</option>
	  <cfelse><option value="<cfoutput>#showuser.title#</cfoutput>" selected><cfoutput>#showuser.title#</cfoutput></option>
	  </cfif>
        <option value="Mr">Mr</option>
        <option value="Mrs">Mrs</option>
        <option value="Ms">Ms</option>
        <option value="Dr">Dr</option>
      </select> --->   </td>
  </tr>
  <tr>
    <td>name</td>
    <td><div class="fieldarea"><input name="name" type="text" id="name" value="<cfoutput>#showuser.name#</cfoutput>" style="width:170px"></div></td>
    </tr>
  <tr>
    <td>surname</td>
    <td><div class="fieldarea"><input name="surname" type="text" id="surname" value="<cfoutput>#showuser.surname#</cfoutput>" style="width:170px"></div></td>
    </tr>
  <tr>
    <td>company</td>
    <td><div class="fieldarea"><input name="company" type="text" id="company" value="<cfoutput>#showuser.company#</cfoutput>" style="width:170px"></div></td>
    </tr>
  <tr>
    <td>email</td>
    <td><div class="fieldarea"><input type="text" name="gemail"  id="gemail"value="<cfoutput>#showuser.emailaddr#</cfoutput>" style="width:170px" /></div></td>
    </tr>
  <tr>
    <td>country</td>
    <td><div class="fieldarea"><input type="text" name="country"  id="country"value="<cfoutput>#showuser.country#</cfoutput> "><!---<cfinclude template="../components/country.cfm">---></div></td>
   </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
   </tr>
  <tr>
    <td>Transaction type</td>
    <td width="1137"><select name="Transtype" style="width:170px"><option value="netbanx" selected>NetBanx</option><option value="WT">WireTransfer</option></select></td>
   </tr>
  <tr>
    <td>Payment Reference</td>
    <td><input name="paymentReference"  type="text" maxlength="10" style="width:170px" /></td>
   </tr>

  <tr>
    <td>VAT Reg no</td>
    <td><input type="text" name="vatreg" style="width:170px" /></td>
   </tr>
  <tr>
    <td></td>
    <td>&nbsp;</td>
   </tr>
  <tr>
    <td>Total amount in  <cfoutput>#getname.event_cost_currency#</cfoutput></td>
    <td><input type="text" name="payment_amount_GBP" value="<cfoutput>#cost#</cfoutput>" style="width:170px" /><input type="hidden" name="currency" value="GBP">
  		No VAT calculated (price should be checked, for discounts) please convert to GBP if needed</td>
   </tr>
  <tr>
    <td>Currency converter</td>
    <td><a href="../components/currencyConverter.cfm" id="idnewuser" onClick="return hs.htmlExpand(this, { contentId: 'convert', objectType: 'iframe',		objectWidth: 426, objectHeight: 240} )" class="highslide">Launch Currency Converter</a></td>
  </tr>
  <tr>
  	<td>
    		<input type="hidden" name="event" value="<cfoutput>#event#</cfoutput>">
			<cfset Pid = ((RandRange(1000, 9999) & CFTOKEN))>
			<input type="hidden" name="Pid" value="<cfoutput>#Pid#</cfoutput>"	>
			<input type="hidden" name="netbanx_reference" value="<cfoutput>#Left(trim(event), 3)##Pid#</cfoutput>">
			<input type="hidden" name="eventid" value="<cfoutput>#form.id#</cfoutput>">
			<input type="hidden" name="userid" value="<cfoutput>#form.userid#</cfoutput>"></td>
    <td><input type="submit" name="button" id="button" value="Submit">
      <span class="temp" style="background-color:#F4F4F4">
          </td>
  </tr>
</table>
