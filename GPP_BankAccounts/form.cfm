<cfinclude template="../Application.cfm">
<script type="text/javascript" >
jQuery(function($){
   $("#VATValue").mask("99.9",{placeholder:"."});
});

</script>
<cfif parameterexists(form.bankID)>
  <cfquery datasource="#gpp#" name="get">
        SELECT 
        	[bankID]
      ,[name]
      ,[companyname]
      ,[BankName]
      ,[AccountNumber]
      ,[Vat]
      ,[IBAN]
      ,[BIC]
      ,[BranchCode]
      ,[RegistrationNo]
      ,[city]
      ,[zip]
      ,[Country]
      ,[Address]
      ,[RegCompanyID]
      ,[VATValue]
      ,[TAXEDids]
      ,[currency]
      ,[companyAddress]
      ,[invoiceLocationCode]
      ,[c_address]
      ,[c_country]
      ,[c_city]
      ,[c_zip]
      ,[bankBeneficiary]
         FROM bankAccounts WHERE bankID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.bankID#">
        </cfquery>
<cfoutput>
<table border="0" cellspacing="4">
      <tr>
        <td width="115" align="right">Bank Description  name</td>
        <td colspan="7"><input type="text" name="name" value="#get.name#" maxlength="30" style="width:220px"   /></td>
      </tr>
      <tr>
        <td align="right" >Registered company name</td>
        <td colspan="7" ><input type="text" name="companyName" value="#get.companyName#" maxlength="50"    style=" width:600px"  /></td>
      </tr>
      <tr>
        <td align="right" >Bank Name</td>
        <td width="228" ><input type="text"  name="bankName" value="#get.bankName#" style="width:220px" maxlength="40"/></td>
        <td width="130" align="right" >Account Nummber</td>
        <td width="230" ><input type="text" name="AccountNumber" value="#get.AccountNumber#" style="width:220px" maxlength="20"  />    </td>
        <td width="80" align="right"  >Address</td>
        <td width="230" ><textarea name="Address"  style=" width:220px; height:40px">#get.address#</textarea></td>
        <td width="130" align="right"  >company address</td>
        <td width="230" ><textarea name="c_Address"  style=" width:220px; height:40px">#get.c_address#</textarea></td>
      </tr>
      <tr>
        <td align="right">Bank beneficiary</td>
        <td><input type="text"  name="bankBeneficiary" value="#get.bankBeneficiary#" style="width:220px" maxlength="40"/></td>
        <td align="right">&nbsp;</td>
        <td>&nbsp;</td>
        <td align="right" >&nbsp;</td>
        <td  >&nbsp;</td>
        <td  align="right" >&nbsp;</td>
        <td  >&nbsp;</td>
      </tr>
      <tr>
        <td align="right">Vat Number</td>
        <td><input type="text" name="Vat" value="#get.Vat#" maxlength="15" style="width:220px"/></td>
        <td align="right">IBAN</td>
        <td>          <input type="text" name="IBAN" value="#get.IBAN#" maxlength="40" style="width:220px" /></td>
        <td align="right" >City</td>
        <td  ><input type="text" name="city"  maxlength="20" value="#get.city#" style="width:220px" /></td>
        <td  align="right" >c city</td>
        <td  ><input type="text" name="c_city"  maxlength="20" value="#get.c_city#" style="width:220px" /></td>
      </tr>
      <tr>
        <td align="right" >BIC</td>
        <td><input type="text" name="BIC" value="#get.BIC#" maxlength="11" style="width:220px"/></td>
        <td align="right" >Branch Code</td>
        <td><input type="text" name="BranchCode" value="#get.BranchCode#" maxlength="8" style="width:220px" /></td>
        <td align="right" >ZIP</td>
        <td  ><input type="text" name="zip"  maxlength="10" value="#get.zip#" style="width:220px" /></td>
        <td  align="right" >c country</td>
        <td  ><input type="text" name="c_country"  maxlength="15" value="#get.c_country#"  style="width:220px" /></td>
      </tr>
      <tr>
        <td align="right" >Currency</td>
        <td><input type="text" name="Currency"  maxlength="8" value="#get.currency#" style="width:220px" /></td>
        <td align="right" >VAT Value</td>
        <td><input type="text" name="VATValue" id="VATValue"  maxlength="4" value="#get.VATValue#" style="width:220px" /></td>
        <td align="right" >country</td>
        <td  ><input type="text" name="country"  maxlength="15" value="#get.country#"  style="width:220px" /></td>
        <td align="right"  >c Zip/postalcode</td>
        <td  ><input type="text" name="c_zip"  maxlength="10" value="#get.c_zip#" style="width:220px" /></td>
      </tr>
      <tr>
        <td align="right" >Company Registration No</td>
        <td><input type="text" name="RegistrationNo" value="#get.RegistrationNo#"   style="width:220px" maxlength="15" /></td>
        <td align="right" >&nbsp;</td>
        <td><input name="save" type="submit" value="save" />
        <input type="hidden" name="bankID" value="#form.bankID#" /></td>
        <td align="right" >&nbsp;</td>
        <td  >&nbsp;</td>
        <td  >&nbsp;</td>
        <td  >&nbsp;</td>
      </tr>
    </table>
</cfoutput>
<cfelse>
    <table  border="0" cellspacing="4">
      <tr>
        <td width="115" align="right">Bank Description  name</td>
        <td colspan="7"><input type="text" name="name"  maxlength="30" style="width:220px"  /></td>
      </tr>
            <tr>
        <td align="right" >Registered company name</td>
        <td colspan="7" ><input type="text" name="companyName"   maxlength="50" style="width:600px" /></td>
      </tr>
      <tr>
        <td align="right" >Bank Name</td>
        <td width="228" ><input type="text"  name="bankName"  maxlength="40" style="width:220px" /></td>
        <td width="130" align="right" >Account Number<span style="color:#990000; font-size:11px"></span></td>
        <td width="230" ><input type="text" name="AccountNumber" maxlength="20"  style="width:220px" /></td>
        <td width="130" align="right" >Address</td>
        <td width="230"  ><textarea name="Address" style=" width:220px; height:40px"></textarea></td>
        <td width="130" align="right"   >company address</td>
        <td width="230"  ><textarea name="c_Address"  style=" width:220px; height:40px"></textarea></td>
      </tr>
      <tr>
        <td align="right">Bank beneficiary</td>
        <td><input type="text"  name="bankBeneficiary" style="width:220px" maxlength="40"/></td>
        <td align="right">&nbsp;</td>
        <td>&nbsp;</td>
        <td align="right" >&nbsp;</td>
        <td  >&nbsp;</td>
        <td  align="right" >&nbsp;</td>
        <td  >&nbsp;</td>
      </tr>
      <tr>
        <td align="right">Vat Number</td>
        <td><input type="text" name="Vat"  maxlength="15" style="width:220px" /></td>
        <td align="right">IBAN</td>
        <td>          <input type="text" name="IBAN"  maxlength="40" style="width:220px" /></td>
        <td align="right" >City</td>
        <td  ><input type="text" name="city"  maxlength="20" style="width:220px" /></td>
        <td  align="right" >c city</td>
        <td  ><input type="text" name="c_city"  maxlength="20" style="width:220px" /></td>
              </tr>
      <tr>
        <td align="right" >BIC</td>
        <td><input type="text" name="BIC"  maxlength="11" style="width:220px" /></td>
        <td align="right" >Branch Code</td>
        <td><input type="text" name="BranchCode"  maxlength="8" style="width:220px" /></td>
        <td align="right" >ZIP</td>
        <td  ><input type="text" name="zip"  maxlength="10"  style="width:220px" /></td>
        <td align="right"  >c country</td>
        <td  ><input type="text" name="c_country"  maxlength="15" style="width:220px" /></td>
      </tr>
      <tr>
        <td align="right" >Currency</td>
        <td><input type="text" name="Currency"  maxlength="8" style="width:220px" /></td>
        <td align="right" >VAT Value</td>
        <td><input type="text" name="VATValue"   id="VATValue" maxlength="4"  style="width:220px" /></td>
        <td align="right" >country</td>
        <td  ><input type="text" name="country"  maxlength="15" style="width:220px" /></td>
        <td  align="right" >c Zip/postalcode</td>
        <td  ><input type="text" name="c_zip"  maxlength="10"   style="width:220px" /></td>
      </tr>
      <tr>
        <td align="right" >Company Registered No</td>
        <td><input type="text" name="RegistrationNo" maxlength="15" style="width:220px" /></td>
        <td align="right" >&nbsp;</td>
        <td><input name="save" type="submit" value="save" /></td>
        <td align="right" >&nbsp;</td>
        <td  >&nbsp;</td>
        <td  >&nbsp;</td>
        <td  >&nbsp;</td>
      </tr>
    </table>
</cfif>