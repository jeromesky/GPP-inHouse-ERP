<cfsilent>
<cfinclude template="../application.cfm">
<!---- CHECK WICH RECORDS ARE BEING TAKEN OFF  ------>

<cfset MarkAsUnregister = "">

<cfquery datasource="#gppServer#" name="findRegistered">
SELECT   *
FROM tblIndOptions 
WHERE lngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
</cfquery>
 <!--- REGIONS OF INTEREST   ----------------------->
                     <cfif parameterexists(form.chkWebIntWo)><cfelse><cfif findRegistered.chkWebIntWo EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkWebIntWo", ",") ></cfif></cfif>
                    <cfif parameterexists(form.chkWebIntAf)><cfelse><cfif findRegistered.chkWebIntAf EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkWebIntAf", ",") ></cfif></cfif> 
                    <cfif parameterexists(form.chkWebIntNaf)><cfelse><cfif findRegistered.chkWebIntNaf EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkWebIntNaf", ",") ></cfif></cfif> 
                    <cfif parameterexists(form.chkWebIntMe)><cfelse><cfif findRegistered.chkWebIntMe EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkWebIntMe", ",") ></cfif></cfif> 
                   <cfif parameterexists(form.chkWebIntAs)><cfelse><cfif findRegistered.chkWebIntAs EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkWebIntAs", ",") ></cfif></cfif> 
                    <cfif parameterexists(form.chkWebIntLa)><cfelse><cfif findRegistered.chkWebIntLa EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkWebIntLa", ",") ></cfif></cfif> 
                    <cfif parameterexists(form.chkWebIntNa)><cfelse><cfif findRegistered.chkWebIntNa EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkWebIntNa", ",") ></cfif></cfif> 
                    <cfif parameterexists(form.chkWebIntEu)><cfelse><cfif findRegistered.chkWebIntEu EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkWebIntEu", ",") ></cfif></cfif> 
                    <cfif parameterexists(form.chkWebIntGen)><cfelse><cfif findRegistered.chkWebIntGen EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkWebIntGen", ",") ></cfif></cfif> 
                    <cfif parameterexists(form.chkWebIntSAE)><cfelse><cfif findRegistered.chkWebIntSAE EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkWebIntSAE", ",") ></cfif></cfif>
                    <cfif parameterexists(form.chkWebIntEAf)><cfelse><cfif findRegistered.chkWebIntEAf EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkWebIntEAf", ",") ></cfif></cfif>
                    <cfif parameterexists(form.chkWebIntWAf)><cfelse><cfif findRegistered.chkWebIntWAf EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkWebIntWAf", ",") ></cfif></cfif>
                    <cfif parameterexists(form.chkRecAlerts)><cfelse><cfif findRegistered.chkRecAlerts EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkRecAlerts", ",") ></cfif></cfif>
                   <cfif parameterexists(form.chkWebIntAus)><cfelse><cfif findRegistered.chkWebIntAus EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkWebIntAus", ",") ></cfif></cfif> 
<!--- NEWSLETTERS       --------------------------------------->
        			<cfif parameterexists(form.chkWebIntAdvertising)><cfelse><cfif findRegistered.chkWebIntAdvertising EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkWebIntAdvertising", ",") ></cfif></cfif>
                    <cfif parameterexists(form.chkCaNews)><cfelse><cfif findRegistered.chkCaNews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkCaNews", ",") ></cfif></cfif>
                    <cfif parameterexists(form.chkOzNews)><cfelse><cfif findRegistered.chkOzNews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkOzNews", ",") ></cfif></cfif>
                    <cfif parameterexists(form.chkMedNews)><cfelse><cfif findRegistered.chkMedNews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkMedNews", ",") ></cfif></cfif>
                    <cfif parameterexists(form.chkEAENews)><cfelse><cfif findRegistered.chkEAENews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkEAENews", ",") ></cfif></cfif>
                    <cfif parameterexists(form.chkWAENews)><cfelse><cfif findRegistered.chkWAENews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkWAENews", ",") ></cfif></cfif>
                    <cfif parameterexists(form.chkNOCNews)><cfelse><cfif findRegistered.chkNOCNews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkNOCNews", ",") ></cfif></cfif>
                    <cfif parameterexists(form.chkPCapNews)><cfelse><cfif findRegistered.chkPCapNews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkPCapNews", ",") ></cfif></cfif>
                    <cfif parameterexists(form.NL_W)><cfelse><cfif findRegistered.chkW EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkW", ",") ></cfif></cfif>
                    <cfif parameterexists(form.NL_LA)><cfelse><cfif findRegistered.chkLA EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkLA", ",") ></cfif></cfif>
                    <cfif parameterexists(form.NL_ME)><cfelse><cfif findRegistered.chkME EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkME", ",") ></cfif></cfif>
                    <cfif parameterexists(form.NL_EU)><cfelse><cfif findRegistered.chkE EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkE", ",") ></cfif></cfif>
                    <cfif parameterexists(form.NL_AF)><cfelse><cfif findRegistered.chkAF EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkAF", ",") ></cfif></cfif>
                   <cfif parameterexists(form.NL_AS)><cfelse><cfif findRegistered.chkA EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkA", ",") ></cfif></cfif>
                    <cfif parameterexists(form.chkSAENews)><cfelse><cfif findRegistered.chkSAENews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkSAENews", ",") ></cfif></cfif>
                    <cfif parameterexists(form.chkNigerNews)><cfelse><cfif findRegistered.chkNigerNews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkNigerNews", ",") ></cfif></cfif>
                    <cfif parameterexists(form.chkIndiaNews)><cfelse><cfif findRegistered.chkIndiaNews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkIndiaNews", ",") ></cfif></cfif>
                    <cfif parameterexists(form.chkBrazilNews)><cfelse><cfif findRegistered.chkBrazilNews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkBrazilNews", ",") ></cfif></cfif>
                   <cfif parameterexists(form.chkChinaNews)><cfelse><cfif findRegistered.chkChinaNews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkChinaNews", ",") ></cfif></cfif>
                   <cfif parameterexists(form.chkRussiaNews)><cfelse><cfif findRegistered.chkRussiaNews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkRussiaNews", ",") ></cfif></cfif>
                     <cfif parameterexists(form.chkAngolaNews)><cfelse><cfif findRegistered.chkAngolaNews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkAngolaNews", ",") ></cfif></cfif>
                     <cfif parameterexists(form.chkPetEurasNews)><cfelse><cfif findRegistered.chkPetEurasNews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkPetEurasNews", ",") ></cfif></cfif>
                     <cfif parameterexists(form.chkUSANews)><cfelse><cfif findRegistered.chkUSANews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkUSANews", ",") ></cfif></cfif>
                     <cfif parameterexists(form.chkPetMagNews)><cfelse><cfif findRegistered.chkPetMagNews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkPetMagNews", ",") ></cfif></cfif>
                   <cfif parameterexists(form.chkP21)><cfelse><cfif findRegistered.chkP21 EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkP21", ",") ></cfif></cfif>
                     
                     <cfif parameterexists(form.chkSuperNews)><cfelse><cfif findRegistered.chkSuperNews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkSuperNews", ",") ></cfif></cfif>
                     <cfif parameterexists(form.chkFrontierNews)><cfelse><cfif findRegistered.chkFrontierNews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkFrontierNews", ",") ></cfif></cfif>
                     <cfif parameterexists(form.chkWorldIndNews)><cfelse><cfif findRegistered.chkWorldIndNews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkWorldIndNews", ",") ></cfif></cfif>
                     <cfif parameterexists(form.chkIraqNews)><cfelse><cfif findRegistered.chkIraqNews EQ 1><cfset MarkAsUnregister = ListAppend(MarkAsUnregister,  "chkIraqNews", ",") ></cfif></cfif>
<!--- ADD RECORD TO CHANGE TABLE --------------------------------------------------->
                <cfloop list="#MarkAsUnregister#" delimiters="," index="i">
                                <cfquery datasource="#gppdata#" >
                                INSERT INTO tblGlopacHistory
                                (
                                UserID,
                                UserName , 
                                UserDateNum , 
                                UserTimeTxt , 
                                RecordWorked, 
                                RecordWorkedType, 
                                RecordDetails,
                                RecordORGValue,
                                RecordNEWValue 
                                )
                                VALUES
                                (
                                 'web', 
                                 'WEB', 
                                 <cfqueryparam  value="#DateFormat(now(), 'yyyymmdd')#" >,
                                 <cfqueryparam  value="#TimeFormat(now(), 'hhmm')#" >, 
                                 <cfqueryparam  value="#form.id#" >, 
                                 <cfqueryparam value="BIT" >, 
                                 <cfqueryparam value="#i#" >, 
                                 1, 
                                 0
                                )
                                </cfquery>
                </cfloop>

<!---- UPDATE  RECORDS  ----------->
<cfquery datasource="#gppServer#" >
UPDATE tblIndividual
SET 
  chkMail 				= <cfif parameterexists(form.chkMail)>1<cfelse>0</cfif>, 
<!--- Region of interest Mail --->
            chkPrioPost		= <cfif parameterexists(form.chkPrioPost)>1<cfelse>0</cfif>, 
            chkSecPost		= <cfif parameterexists(form.chkSecPost)>1<cfelse>0</cfif>, 
            chkW				=  <cfif parameterexists(form.chkW)>1<cfelse>0</cfif>,  
            chkNA				= <cfif parameterexists(form.chkNA)>1<cfelse>0</cfif>,  
            chkL					= <cfif parameterexists(form.chkL)>1<cfelse>0</cfif>,  
            chkME 				= <cfif parameterexists(form.chkME)>1<cfelse>0</cfif>,  
            chkE 				= <cfif parameterexists(form.chkE)>1<cfelse>0</cfif>,  
            chkAF 				= <cfif parameterexists(form.chkAF)>1<cfelse>0</cfif>,  
            chkA 				= <cfif parameterexists(form.chkA)>1<cfelse>0</cfif>,  
            chkMag 			= <cfif parameterexists(form.chkMag)>1<cfelse>0</cfif>,  
            chSAE 				= <cfif parameterexists(form.chSAE)>1<cfelse>0</cfif>, 
            chkWA 				= <cfif parameterexists(form.chkWA)>1<cfelse>0</cfif>, 
            chkEAF 			=<cfif parameterexists(form.chkEAF)>1<cfelse>0</cfif>, 
            chkIntPostAus	= <cfif parameterexists(form.chkIntPostAus)>1<cfelse>0</cfif>,  
    <!--- INdustry sector     ---------------->
			BPA_Designation	= <cfif parameterexists(form.BPA_Designation)>'#Ucase(form.BPA_Designation)#'<cfelse>''</cfif>, 
            chkExploration 	= <cfif parameterexists(form.chkExploration)>1<cfelse>0</cfif>, 
            chkRefining 		= <cfif parameterexists(form.chkRefining)>1<cfelse>0</cfif>, 
            chkPower 			= <cfif parameterexists(form.chkPower)>1<cfelse>0</cfif>, 
            chkGas 			= <cfif parameterexists(form.chkGas)>1<cfelse>0</cfif>, 
            chkRenBio 		= <cfif parameterexists(form.chkRenBio) >1<cfelse>0</cfif>, 
            dtmUpdated		= <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">,
            UpdBy				= '#Session.username#'
            
WHERE IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
</cfquery>

<cfquery datasource="#gppServer#" >
UPDATE tblIndOptions
SET 
 <!--- REGIONS OF INTEREST     -------->
                    chkWebIntWo 				= <cfif parameterexists(form.chkWebIntWo)>1<cfelse>0</cfif>, 
                    chkWebIntAf					= <cfif parameterexists(form.chkWebIntAf)>1<cfelse>0</cfif>, 
                    chkWebIntNaf				= <cfif parameterexists(form.chkWebIntNaf)>1<cfelse>0</cfif>, 
                    chkWebIntMe 				= <cfif parameterexists(form.chkWebIntMe)>1<cfelse>0</cfif>, 
                    chkWebIntAs					= <cfif parameterexists(form.chkWebIntAs)>1<cfelse>0</cfif>, 
                    chkWebIntLa					= <cfif parameterexists(form.chkWebIntLa)>1<cfelse>0</cfif>, 
                    chkWebIntNa					= <cfif parameterexists(form.chkWebIntNa)>1<cfelse>0</cfif>, 
                    chkWebIntEu 				= <cfif parameterexists(form.chkWebIntEu)>1<cfelse>0</cfif>, 
                    chkWebIntGen 				= <cfif parameterexists(form.chkWebIntGen)>1<cfelse>0</cfif>, 
                    chkWebIntSAE 				= <cfif parameterexists(form.chkWebIntSAE)>1<cfelse>0</cfif>,
                    chkWebIntEAf 				= <cfif parameterexists(form.chkWebIntEAf)>1<cfelse>0</cfif>,
                    chkWebIntWAf 				= <cfif parameterexists(form.chkWebIntWAf)>1<cfelse>0</cfif>,
                  chkWebIntAus					= <cfif parameterexists(form.chkWebIntAus)>1<cfelse>0</cfif>,
<!--- NEWSLETTERS    --------->
        			chkWebIntAdvertising 	= <cfif parameterexists(form.chkWebIntAdvertising)>1<cfelse>0</cfif>,
                    chkCaNews 			= <cfif parameterexists(form.chkCaNews)>1<cfelse>0</cfif>,
                    chkOzNews 			= <cfif parameterexists(form.chkOzNews)>1<cfelse>0</cfif>,
                    chkMedNews 		= <cfif parameterexists(form.chkMedNews)>1<cfelse>0</cfif>,
                    chkEAENews 		= <cfif parameterexists(form.chkEAENews)>1<cfelse>0</cfif>,
                    chkWAENews 		= <cfif parameterexists(form.chkWAENews)>1<cfelse>0</cfif>,
                    chkNOCNews 		= <cfif parameterexists(form.chkNOCNews)>1<cfelse>0</cfif>,
                    chkPCapNews	 	= <cfif parameterexists(form.chkPCapNews)>1<cfelse>0</cfif>,
                    chkW 					= <cfif parameterexists(form.NL_W)>1<cfelse>0</cfif>,
                    chkLA					= <cfif parameterexists(form.NL_LA)>1<cfelse>0</cfif>,
                    chkME 					= <cfif parameterexists(form.NL_ME)>1<cfelse>0</cfif>,
                    chkE 					= <cfif parameterexists(form.NL_EU)>1<cfelse>0</cfif>,
                    chkAF 					= <cfif parameterexists(form.NL_AF)>1<cfelse>0</cfif>,
                    chkA 					= <cfif parameterexists(form.NL_AS)>1<cfelse>0</cfif>,
                    chkSAENews 		= <cfif parameterexists(form.chkSAENews)>1<cfelse>0</cfif>,
                    chkNigerNews 		= <cfif parameterexists(form.chkNigerNews)>1<cfelse>0</cfif>,
                    chkIndiaNews 		= <cfif parameterexists(form.chkIndiaNews)>1<cfelse>0</cfif>,
                    chkBrazilNews 		= <cfif parameterexists(form.chkBrazilNews)>1<cfelse>0</cfif>,
                    chkChinaNews 		= <cfif parameterexists(form.chkChinaNews)>1<cfelse>0</cfif>,
                    chkRussiaNews 	= <cfif parameterexists(form.chkRussiaNews)>1<cfelse>0</cfif>,
                     chkAngolaNews 	= <cfif parameterexists(form.chkAngolaNews)>1<cfelse>0</cfif>,
                     chkPetEurasNews	= <cfif parameterexists(form.chkPetEurasNews)>1<cfelse>0</cfif>,
                     chkUSANews 		= <cfif parameterexists(form.chkUSANews)>1<cfelse>0</cfif>,
                     chkPetMagNews	=  <cfif parameterexists(form.chkPetMagNews)>1<cfelse>0</cfif>,
                     chkP21				= <cfif parameterexists(form.chkP21)>1<cfelse>0</cfif>,
                     chkSuperNews		= <cfif parameterexists(form.chkSuperNews)>1<cfelse>0</cfif>,
                     chkFrontierNews	= <cfif parameterexists(form.chkFrontierNews)>1<cfelse>0</cfif>,
                     chkWorldIndNews	= <cfif parameterexists(form.chkWorldIndNews)>1<cfelse>0</cfif>,
                     chkIraqNews			= <cfif parameterexists(form.chkIraqNews)>1<cfelse>0</cfif>,
                     chkRecAlerts		= <cfif parameterexists(form.chkRecAlerts)>1<cfelse>0</cfif>
                     
WHERE lngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
</cfquery>

<cfquery datasource="#gppServer#" >
INSERT INTO  tblGlopacHistory (UserName, UserDateNum, RecordWorked, RecordWorkedType, RecordDetails, UserTimeTxt)
VALUES ( '#Session.username#', #dateformat(now(), "yyyymmdd")#, #form.id#, 'IND', 'NEW', '#timeFormat(now(), "hhmm")#') 
</cfquery>
</cfsilent>