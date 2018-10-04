<cfinclude template="../Application.cfm">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>P21</title>
</head>

<body><fieldset><legend>kl</legend>
<cfquery name="get" datasource="#dsnP21#" >
select id, title, name, surname, company, gemail, event, TransDate, netbanx_reference, eventid, userid, Pid
from Registrations
where id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
</cfquery>

<cfoutput>

<cfmail to="jerome@glopac-partners.com" cc="#get.gemail#" from="Global Pacific & Partners <web@petro21.com>" subject="Accounts department at Global Pacific & Partners" type="html" > 
 <div  style="font-family:Arial, Helvetica, sans-serif">
 Dear #get.title# #get.name# #get.surname#,<br><br>
 We have tried on your behalf to process payment from your credit card with the details you have supplied to us for the following: <br>    
	  <b>
          <ul><cfloop list="#get.event#" index="i" delimiters=",">
   			<cfset IndexOfOccurrence=REFind("/", #i#)>
				<li>#Left(i, (IndexOfOccurrence-1))#</li>
  			</cfloop>
           </ul></b><br >
			<p>			
Visa and Mastercard have now issued Verification Codes in some Countries, and where this is applicable, we are no longer able to process your payment on-line on your behalf.  In order to complete the Transaction yourself, we have created a direct link for you to use.</p>

<p>Click here to complete the Transaction <a href="http://www.petro21.com/order/client_payment.cfm?id=#get.id#">http://www.petro21.com/order/client_payment.cfm?id=#get.id#</a><br><br></p>
      <p>1. Visa and MasterCard verification explaned<br>
        <a  href="https://usa.visa.com/personal/security/vbv/index.html">https://partnernetwork.visa.com/vpn/global/category.do?userRegion=1&amp;cate</a></p>
      <p>2. Registration for MasterCard -<br>
        <a href="http://www.mastercard.com/securecd/welcome.do">http://www.mastercard.com/securecd/welcome.do</a> </p>
      <p>3. Registration for Verified by Visa -<br>
        <a  href="http://www.visaeurope.com/iusevisa/shoppingonline.html">http://www.visaeurope.com/iusevisa/shoppingonline.html</a> </p>

<p>Please contact <a href="mailto:jerry@glopac-partners.com">Jerry@glopac-partners.com</a> for any queries.</p>
<p>We thank you for your understanding</p>
The Hague, The Netherlands<br><br>

<b>Tel:</b> +31.70.324.6154 <br>
<b> Fax:</b> +31.70.324.1741<br><br>

Denneweg 124<br />
2514 CL,<br />
Den Haag<br />
The Netherlands<br />
</div>
 </cfmail>
 
 <cfquery datasource="#dsnP21#" >
UPDATE  Registrations
SET approved = 1
WHERE id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.id#">
</cfquery>
 
</cfoutput>
</fieldset>
</body>
</html>
<cflocation url="registration.cfm">