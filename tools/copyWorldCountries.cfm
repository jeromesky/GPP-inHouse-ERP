<cfinclude template="../Application.cfm">
<!DOCTYPE,html,PUBLIC,"-//W3C//DTD,XHTML,1.0,Transitional//EN","http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html,xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta,http-equiv="Content-Type",content="text/html;,charset=UTF-8",/>
<title>P21</title>
</head>

<body>
<cfset countries = "Afghanistan,Albania,Algeria,Andorra,Angola,Antigua and Barbuda,Argentina,Armenia,Australia,Austria,Azerbaijan,Bahamas,Bahrain,Bangladesh,Barbados,Belarus,Belgium,Belize,Benin,Bhutan,Bolivia,Bosnia and Herzegovina,Botswana,Brazil,Brunei,Darussalam,Bulgaria,Burkina Faso,Burma (Myanmar),Burundi,Cambodia,Cameroon,Canada,Cape Verde,Central African Republic,Chad,Chile,China,Colombia,Comoros,Congo,Congo Republic,Costa Rica,Côte d'Ivoire,Croatia,Cuba,Cyprus,Czech Republic,Denmark,Djibouti,Dominica,Dominican Republic,Ecuador,Egypt,El Salvador,Equatorial Guinea,Eritrea,East Timor,Estonia,Ethiopia,Fiji,Finland,France,Gabon,Gambia The,Georgia,Germany,Ghana,Greece,Grenada,Guatemala,Guinea,Guinea-Bissau,Guyana,Haiti,Honduras,Hungary,Iceland,India,Indonesia,Iran,Iraq,Ireland,Israel,Italy,Jamaica,Japan,Jordan,Kazakhstan,Kenya,Kiribati,Korea North,Korea South,Kuwait,Kyrgyzstan,Laos,Latvia,Lebanon,Lesotho,Liberia,Libya,Liechtenstein,Lithuania,Luxembourg,Macedonia,Madagascar,Malawi,Malaysia,Maldives,Mali,Malta,Marshall Islands,Mauritania,Mauritius,Mexico,Micronesia,Moldova,Monaco,Mongolia,Morocco,Mozambique,Myanmar,Namibia,Nauru,Nepal,The Netherlands,New Zealand,Nicaragua,Niger,Nigeria,Norway,Oman,Pakistan,Palau,Palestinian State,Panama,Papua New Guinea,Paraguay,Peru,The Philippines,Poland,Portugal,Qatar,Romania,Russia,Rwanda,St.Kitts and Nevis,St.Lucia,St.Vincent Grenadines,Samoa,San Marino,São Tomé and Príncipe,Saudi Arabia,Senegal,Serbia and Montenegro,Seychelles,Sierra Leone,Singapore,Slovakia,Slovenia,Solomon Islands,Somalia,South Africa,Spain,Sri Lanka,Sudan,Suriname,Swaziland,Sweden,Switzerland,Syria,Taiwan,Tajikistan,Tanzania,Thailand,Timor-Leste,Togo,Tonga,Trinidad and Tobago,Tunisia,Turkey,Turkmenistan,Tuvalu,Uganda,Ukraine,United Arab Emirates,United Kingdom,United States,Uruguay,Uzbekistan,Vanuatu,Vatican City (Holy See),Venezuela,Vietnam,Western Sahara,Yemen,Yugoslavia,Zaire,Zambia,Zimbabwe" >

<cfloop index="i" list="#countries#">
	<cfquery datasource="#dsnP21#">
    	INSERT INTO countries(country)
        VALUES('#i#')
    </cfquery>
</cfloop>
</body>
</html>