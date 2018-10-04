


<cfquery datasource="GPP" name="qry">
SELECT  DISTINCT dbo.tblIndividual.strFirst_Name as Name, dbo.tblIndividual.strSurname as Surname, lower(rtrim(ltrim(dbo.tblIndividual.strEmail))) as email
FROM         dbo.tblIndividual
WHERE 1=1
AND countryID IN (29,48,53,70,193,194,256)
AND (dbo.tblIndividual.anouncements = 1) 
AND (dbo.tblIndividual.active = 1)
AND (dbo.tblIndividual.strEmail LIKE '%_@__%._%') 
AND (CHARINDEX(' ', LTRIM(RTRIM(dbo.tblIndividual.strEmail))) = 0) AND (LEFT(LTRIM(dbo.tblIndividual.strEmail), 1) <> '@') 
AND (RIGHT(RTRIM(dbo.tblIndividual.strEmail), 1) <> '.') 
AND (CHARINDEX('.', dbo.tblIndividual.strEmail, CHARINDEX('@', dbo.tblIndividual.strEmail)) - CHARINDEX('@', dbo.tblIndividual.strEmail) > 1) 	  
AND (LEN(LTRIM(RTRIM(dbo.tblIndividual.strEmail))) - LEN(REPLACE(LTRIM(RTRIM(dbo.tblIndividual.strEmail)), '@', '')) = 1)
AND (CHARINDEX('.', REVERSE(LTRIM(RTRIM(dbo.tblIndividual.strEmail)))) >= 3) 
AND (CHARINDEX('.@', dbo.tblIndividual.strEmail) = 0) AND (CHARINDEX('..', dbo.tblIndividual.strEmail) = 0) 			  
AND (SUBSTRING(dbo.tblIndividual.strEmail, LEN(dbo.tblIndividual.strEmail) - CHARINDEX('.', REVERSE(dbo.tblIndividual.strEmail)) + 2, CHARINDEX('.', REVERSE(dbo.tblIndividual.strEmail))) IN (SELECT TLDname FROM dbo.TLD) ) 

AND (dbo.tblIndividual.strEmail NOT LIKE ' %_@__%._%') 
AND (dbo.tblIndividual.strEmail NOT LIKE '%_@__%._% ')
AND (dbo.tblIndividual.strEmail NOT LIKE '%Webmaster@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'master@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'info%@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'informacion@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'inquiries@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'enquiries@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'enquiry@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'investor%@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'invester%@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'contact@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'director%@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'ir@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'inbox@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'mail@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'mailbox@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'office@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'sales%@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'public%@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'support@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE '%international%@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'trading@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'trade@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE '%@%.ac.za')
AND (dbo.tblIndividual.strEmail NOT LIKE '%@%.163.com')

AND (strSurname != 'management')
AND (strSurname != '1%')
AND (strSurname != '2%')
AND (strSurname != '8%')
AND (strSurname != '9%')
AND (dbo.tblIndividual.strFirst_Name IS NOT NULL AND dbo.tblIndividual.strFirst_Name != '')
AND (dbo.tblIndividual.strSurname IS NOT NULL AND dbo.tblIndividual.strSurname != '')
AND ((select count(*) from dbo.tblIndividual A where A.strEmail = dbo.tblIndividual.strEmail) = 1)

ORDER BY email

</cfquery>
<!---  avieira@miswaço.com
<cfoutput>#qry.recordcount#</cfoutput>
babette@glopac.com; query="qry" --->

<cfloop query="qry">


<cfif isvalid("email", qry.email)>
    <cfmail 
        to="#qry.email#"
        from="sonika@petro21.com"
        subject="ARPEL 2013 Conference: 9 - 11 April, Montevideo, Uruguay"
        type="html"
        >
   <p><strong>Press Release</strong></p>
     
    <h4>ARPEL 2013 Conference: 9 - 11 April, Montevideo, Uruguay</h4>
     
    <p>Our Vice President, International, Sonika Greyvenstein, will be in attendance in Montevideo for ARPEL 2013 Conference taking place at the Conrad Hotel from 9 - 11 April 2013, where we are pleased to be attending as a Delegate.</p>
     
    <p>The Conference ARPEL is a regional, Bi-Annual forum dialogue of the oil and gas sector focused on sustainable energy development in Latin America and the Caribbean (http://www.conferenciaarpel.org/) and Global Pacific & Partners is pleased to support the organization following our long-standing relationship with ARPEL through our Latin Upstream meeting.</p>
     
    <h4>19th Latin Upstream 2013 Conference & Exhibition, 15 - 17 May 2013, Sofitel Hotel Rio de Janeiro, Brazil.</h4>
     
    <p>RIO DE JANEIRO - With some of the world's fastest-growing oil and gas reserves found, plus huge unconventional resources, the Latin American continent awaits major capital investment projects across the region.</p>
     
    <p>The Conference is a premier and long established international oil and gas business and deal-making exploration event and will highlight the significant potential for companies, state players, investors, Majors, independents, service/supply companies, financiers and traders.</p>
     
    <p>Latin America accommodates numerous acreage openings, new oil/gas and LNG projects, plus huge gas developments in gas-prone onshore and offshore basins, and a rising corporate deal-flow. New frontiers offer major oil and gas opportunities.</p>
     
    <p>During the Conference key speakers will focus on Latin gas-LNG and GTL ventures, mature exploration zones, heavy oil, deepwater potential and new plays. The meeting also shows how private and state oil/gas companies and governments will reshape Latin America inside the world's upstream game.</p>
     
    <p>Petra Energia reveals China's energy plans in Latin America. State oil companies like Petrobras and Statoil present their Brazilian positions, TGP gives an update about Peru's gas pipeline infrastructure and PetroCaribbean gives new insight on the exploration and development of Colombia's Putumayo Basin.</p>
     
    <p>Prior to the 19th Latin Upstream Conference, the 9th Latin Petroleum Strategy Briefing on May 15th with Presentations by Dr Duncan Clarke provides key insights and an in-depth examination of the competitive upstream oil and gas-LNG strategies in exploration and development in Latin America, and the strategies of corporates, governments and state oil players on the continent.</p>
     
    <p>For further information, please contact Sonika Greyvenstein of Global Pacific & Partners, e-mail: sonika@glopac-partners.com</p>
     
    <h4>Over 200 Senior executives have attended annually:</h4>
     From over 20 Countries including: 
     <ul>
        <li>Brazil, USA, Uruguay, Ecuador, Colombia, United Kingdom, Russia, Canada, Bahrain, France, Australia, Indonesia, Netherlands, South Africa, Peru, Japan, Norway, Mexico, Bolivia, Venezuela, Argentina, Paraguay, Jamaica, Belize, Trinidad & Tobago, Nigeria</li>
        <li>30 Speakers</li>
        <li>Exhibition</li>
     </ul>
     
    <p>Note:  11th Oil and Gas Bid Round in Brazil<br>
    ANP, the Brazilian National Hydrocarbons Agency, has published a calendar for the Bid Rounds for an expression of interest, May 14-15 for submitting a bid, and August 2013 for execution of the awarded concession contracts.  2013 is shaping up to be an active year for upstream Bid Rounds in Brazil. A Bid Round for non-conventional oil and gas is expected for later this year, as well as an additional Bid Round under the new production sharing contracts for the pre-salt layer.</p>
     
    <p>With kind regards,</p>
     
    <p>_________________________________________</p>
     
     
    <p>Sonika Greyvenstein<br>
    Vice President, International<br>
    Global Pacific & Partners<br>
    Tel: +27 11 880 7052<br>
    Fax: +27 11 880 1742<br>
    Mobile: +27 79 872 8331<br>
    Email: sonika@glopac-partners.com</p>
     
    <p>Dr Duncan Clarke, Chairman & CEO<br>
    Duncan@glopac.com</p>
     
    <p>Babette van Gessel, Deputy Vice Chairman<br>
    babette@glopac-partners.com</p>
    </cfmail>
	</cfif>
</cfloop>


<!---
SELECT DISTINCT   dbo.tblIndividual.strEmail
FROM         dbo.tblIndividual LEFT OUTER JOIN
                      dbo.subscriptions ON dbo.tblIndividual.IngIndividual_ID = dbo.subscriptions.userID
WHERE     (dbo.tblIndividual.email_bounce < 15) AND (dbo.tblIndividual.newsletters = 1) AND (dbo.subscriptions.subActive = 1) AND 
                      (dbo.tblIndividual.strEmail NOT LIKE '%@yahoo.de') AND (CHARINDEX(' ', LTRIM(RTRIM(dbo.tblIndividual.strEmail))) = 0) AND (LEFT(LTRIM(dbo.tblIndividual.strEmail), 
                      1) <> '@') AND (RIGHT(RTRIM(dbo.tblIndividual.strEmail), 1) <> '.') AND (CHARINDEX('.', dbo.tblIndividual.strEmail, CHARINDEX('@', dbo.tblIndividual.strEmail)) 
                      - CHARINDEX('@', dbo.tblIndividual.strEmail) > 1) AND (LEN(LTRIM(RTRIM(dbo.tblIndividual.strEmail))) - LEN(REPLACE(LTRIM(RTRIM(dbo.tblIndividual.strEmail)), '@', 
                      '')) = 1) AND (CHARINDEX('.', REVERSE(LTRIM(RTRIM(dbo.tblIndividual.strEmail)))) >= 3) AND (CHARINDEX('.@', dbo.tblIndividual.strEmail) = 0) AND (CHARINDEX('..', 
                      dbo.tblIndividual.strEmail) = 0) AND (SUBSTRING(dbo.tblIndividual.strEmail, LEN(dbo.tblIndividual.strEmail) - CHARINDEX('.', REVERSE(dbo.tblIndividual.strEmail)) + 2,
                       CHARINDEX('.', REVERSE(dbo.tblIndividual.strEmail))) IN
                          (SELECT     TLDname
                            FROM          dbo.TLD)) AND (dbo.tblIndividual.strEmail LIKE '%_@__%._%') AND (dbo.tblIndividual.strEmail NOT LIKE ' %_@__%._%') AND 
                      (dbo.tblIndividual.strEmail NOT LIKE '%_@__%._% ') AND (dbo.tblIndividual.strEmail > 'avieira@miswaço.com')
ORDER BY dbo.tblIndividual.strEmail---->




<!---
SELECT  DISTINCT dbo.tblIndividual.strFirst_Name as Name, dbo.tblIndividual.strSurname as Surname, lower(rtrim(ltrim(dbo.tblIndividual.strEmail))) as email
FROM         dbo.tblIndividual
WHERE 1=1
AND countryID IN (29,48,53,70,193,194,256)
AND (dbo.tblIndividual.anouncements = 1) 
AND (dbo.tblIndividual.active = 1)
AND (dbo.tblIndividual.strEmail LIKE '%_@__%._%') 
AND (CHARINDEX(' ', LTRIM(RTRIM(dbo.tblIndividual.strEmail))) = 0) AND (LEFT(LTRIM(dbo.tblIndividual.strEmail), 1) <> '@') 
AND (RIGHT(RTRIM(dbo.tblIndividual.strEmail), 1) <> '.') 
AND (CHARINDEX('.', dbo.tblIndividual.strEmail, CHARINDEX('@', dbo.tblIndividual.strEmail)) - CHARINDEX('@', dbo.tblIndividual.strEmail) > 1) 	  
AND (LEN(LTRIM(RTRIM(dbo.tblIndividual.strEmail))) - LEN(REPLACE(LTRIM(RTRIM(dbo.tblIndividual.strEmail)), '@', '')) = 1)
AND (CHARINDEX('.', REVERSE(LTRIM(RTRIM(dbo.tblIndividual.strEmail)))) >= 3) 
AND (CHARINDEX('.@', dbo.tblIndividual.strEmail) = 0) AND (CHARINDEX('..', dbo.tblIndividual.strEmail) = 0) 			  
AND (SUBSTRING(dbo.tblIndividual.strEmail, LEN(dbo.tblIndividual.strEmail) - CHARINDEX('.', REVERSE(dbo.tblIndividual.strEmail)) + 2, CHARINDEX('.', REVERSE(dbo.tblIndividual.strEmail))) IN (SELECT TLDname FROM dbo.TLD) ) 

AND (dbo.tblIndividual.strEmail NOT LIKE ' %_@__%._%') 
AND (dbo.tblIndividual.strEmail NOT LIKE '%_@__%._% ')
AND (dbo.tblIndividual.strEmail NOT LIKE '%Webmaster@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'master@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'info%@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'informacion@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'inquiries@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'enquiries@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'enquiry@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'investor%@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'invester%@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'contact@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'director%@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'ir@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'inbox@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'mail@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'mailbox@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'office@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'sales%@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'public%@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'support@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE '%international%@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'trading@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE 'trade@%.%')
AND (dbo.tblIndividual.strEmail NOT LIKE '%@%.ac.za')
AND (dbo.tblIndividual.strEmail NOT LIKE '%@%.163.com')

AND (strSurname != 'management')
AND (strSurname != '1%')
AND (strSurname != '2%')
AND (strSurname != '8%')
AND (strSurname != '9%')
AND (dbo.tblIndividual.strFirst_Name IS NOT NULL AND dbo.tblIndividual.strFirst_Name != '')
AND (dbo.tblIndividual.strSurname IS NOT NULL AND dbo.tblIndividual.strSurname != '')
AND ((select count(*) from dbo.tblIndividual A where A.strEmail = dbo.tblIndividual.strEmail) = 1)

AND 
YEAR(dtmCaptured) >= 2007

ORDER BY email
------>