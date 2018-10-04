<cfinclude template="qry_TLD.cfm">
<cfoutput>{"countryName": "#trim(qryTLD.countryName)#", "countryID": #trim(qryTLD.CountryID)#, "countryPhoneCode": #trim(qryTLD.countryPhoneCode)#}</cfoutput>