<cfsilent>
<cfinclude template="../application.cfm">

<cfset  lngCompany_ID		= "" >

<!--- SET THE COMPANY ID --------->
<cfif parameterexists(form.lngCompany_ID) AND form.lngCompany_ID NEQ "" >
		<cfset  lngCompany_ID		= #form.lngCompany_ID# >
</cfif>

<cfif parameterexists(form.SearchCompany) AND form.SearchCompany NEQ "" AND form.lngCompany_ID EQ "" >
<!--- CHECK to see if this company actually existys ---------------------->    
        <cfquery name="companyCheck" datasource="#gpp#">
            SELECT IngCompany_ID
            FROM tblCompany
            WHERE strCompany_Name = <cfqueryparam value="#trim(form.SearchCompany)#">
        </cfquery> 
           
		<cfif companyCheck.recordcount EQ 0 >
<!--- DID NOT FIND RECORD, CREAT NEW COMPANY ---------------------->                
                <cfquery name="GetNewCompanyID" datasource="#gpp#">
                    INSERT INTO tblCompany ( strCompany_Name )
                    VALUES (<cfqueryparam value="#trim(form.SearchCompany)#">)
                    SELECT @@IDENTITY AS id
                </cfquery>  
                  
                <cfset  lngCompany_ID		= #GetNewCompanyID.id# >  
         <cfelse>
<!--- FOUND RECORD, GET THE COMPANY ID ---------------------->   
		 		 <cfset  lngCompany_ID		= #companyCheck.IngCompany_ID# >
		 </cfif>
</cfif>







<!---- ########## UPDATE  RECORDS  ########################################################------------>
<cfquery datasource="#gpp#" >
UPDATE tblIndividual_web
SET 
<!--- Personal Details   _--------------------------------------->
            <!---Title 						= '#form.title#',  
            strFirst_Name		= '#form.strFirst_Name#', 
            strSurname			= '#form.strSurname#', 
            strDesignation		= '#form.strDesignation#', 
            BPA_Designation	= '#form.BPA_Designation#', 
            strPhDirect_Code	= '#form.strPhDirect_Code#',
            strPhDirect_No		= '#form.strPhDirect_No#',
            strFaxDirect_Code	= '#form.strFaxDirect_Code#',
            strFaxDirect_No		= '#form.strFaxDirect_No#',
            strEmail				= '#form.strEmail#',
            strStreet_Adress 	= '#form.strStreet_Adress#', 
            strPostal_Adress 	= '#form.strPostal_Adress#',  
            username 				=  '#form.username#',
            password 				=  '#form.password#',
            strCity 					= '#form.strCity#', 
            intCode 				= '#form.intCode#', 
            CountryName			= '#form.CountryName#',--->
<cfif lngCompany_ID NEQ "" >
            lngCompany_ID		= #lngCompany_ID#,
</cfif>
            chkMail 				= <cfif parameterexists(form.chkMail)>1<cfelse>0</cfif>, 
            <!---lngCompany_ID 	= <cfif parameterexists(form.lngCompany_ID)>1<cfelse>0</cfif>, --->
	
<!--- Region of interest Mail                         _--------------------------------------->
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
            chkIntPostAus 	=<cfif parameterexists(form.chkIntPostAus)>1<cfelse>0</cfif>, 
    <!--- INdustry sector                                                  _--------------------------------------->
			BPA_Designation	= <cfif parameterexists(form.BPA_Designation)>'#trim(form.BPA_Designation)#'<cfelse>''</cfif>, 
            chkExploration 	= <cfif parameterexists(form.chkExploration)>1<cfelse>0</cfif>, 
            chkRefining 		= <cfif parameterexists(form.chkRefining)>1<cfelse>0</cfif>, 
            chkPower 			= <cfif parameterexists(form.chkPower)>1<cfelse>0</cfif>, 
            chkGas 			= <cfif parameterexists(form.chkGas)>1<cfelse>0</cfif>, 
            chkRenBio 		= <cfif parameterexists(form.chkRenBio) >1<cfelse>0</cfif>,
            industrySecEconomy	=  <cfif parameterexists(form.industrySecEconomy) >1<cfelse>0</cfif>,
    <!--- DUPLICAT COMMENT  ------------------------> 
    		<cfif parameterexists(form.comment) >   
            comment 			= <cfqueryparam value="#left(form.comment, 200)#" >,
            </cfif>
    <!--- Record approved and saved ------------------------>        
            <cfif  parameterexists(form.SaveOptionsOnly) >
            approved			= 1,
            </cfif>
             <cfif  parameterexists(form.isADup) >
            isADup			= 1,
            </cfif>
            dtmUpdated		= <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
WHERE RecID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
</cfquery>

<cfquery datasource="#gpp#" >
UPDATE tblIndOptions_web
SET 
 <!--- REGIONS OF INTEREST                                             _--------------------------------------->
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
                    chkWebIntAus 				= <cfif parameterexists(form.chkWebIntAus)>1<cfelse>0</cfif>,
<!--- NEWSLETTERS                                             _--------------------------------------->
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
                     
                     chkSuperNews 		= <cfif parameterexists(form.chkSuperNews)>1<cfelse>0</cfif>,
                     chkFrontierNews	= <cfif parameterexists(form.chkFrontierNews)>1<cfelse>0</cfif>,
                     chkWorldIndNews = <cfif parameterexists(form.chkWorldIndNews)>1<cfelse>0</cfif>,
                     chkIraqNews			=  <cfif parameterexists(form.chkIraqNews)>1<cfelse>0</cfif>,
                     chkAtlanticNews	= <cfif parameterexists(form.chkAtlanticNews)>1<cfelse>0</cfif>,
                     
                     insertDate				= <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
                     
WHERE IND_RecID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
</cfquery>



<cfif NOT parameterexists(form.SaveOptionsOnly) >

<!--- ##################################################
 GET OLD RECORD ID IF ITS AN UPDATE  
 
 ####################################### -------->
<cfif parameterexists(form.UpdateRecord) >

		<cfparam name="get_NewID.newid" default="#form.oldRecord#" >

<cfquery datasource="#gpp#" name="get_individual">
SELECT * 
FROM  tblIndividual_web
WHERE RecID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
</cfquery>       
        
        
        <cfquery datasource="#gpp#" >
UPDATE tblIndividual
SET 
<!--- Personal Details   _--------------------------------------->
<cfif parameterexists(form.userDetails)  >
			<cfif get_individual.title NEQ "" >
            Title 						= '#trim(get_individual.title)#',  
            </cfif>
            <cfif get_individual.strFirst_Name NEQ "" >
            strFirst_Name		= '#trim(get_individual.strFirst_Name)#', 
            </cfif>
            <cfif get_individual.strSurname NEQ "" >
            strSurname			= '#trim(get_individual.strSurname)#', 
            </cfif>
            <cfif get_individual.strDesignation NEQ "" >
            strDesignation		= '#trim(get_individual.strDesignation)#', 
            </cfif>
            <cfif get_individual.strPhDirect_Code NEQ "" >
            strPhDirect_Code	= '#get_individual.strPhDirect_Code#',
            </cfif>
            <cfif get_individual.strPhDirect_No NEQ "" >
            strPhDirect_No		= '#get_individual.strPhDirect_No#',
            </cfif>
            <cfif get_individual.strFaxDirect_Code NEQ "" >
            strFaxDirect_Code	= '#get_individual.strFaxDirect_Code#',
            </cfif>
            <cfif get_individual.strFaxDirect_No NEQ "" >
            strFaxDirect_No		= '#get_individual.strFaxDirect_No#',
            </cfif>
            <cfif get_individual.strEmail NEQ "" >
            strEmail				= '#trim(get_individual.strEmail)#',
            </cfif>
            
           
            <cfif get_individual.strSecretary_Email NEQ "" >
            strSecretary_Email		= '#trim(get_individual.strSecretary_Email)#',
            </cfif>            
            
            <cfif get_individual.strEmail_Alt NEQ "" >
            strEmail_Alt				= '#trim(get_individual.strEmail_Alt)#',
            </cfif>
            
                        
            
            <cfif get_individual.strStreet_Adress NEQ "" >
            strStreet_Adress 	= '#trim(get_individual.strStreet_Adress)#', 
            </cfif>
            <cfif get_individual.strPostal_Adress NEQ "" >
            strPostal_Adress 	= '#trim(get_individual.strPostal_Adress)#', 
            </cfif>
            
            <cfif get_individual.username NEQ "" > 
            username 				=  '#get_individual.username#',
            </cfif>
            <cfif get_individual.password NEQ "" > 
            password 				=  '#get_individual.password#',
            </cfif>
            <cfif get_individual.strCity NEQ "" > 
            strCity 					= '#trim(get_individual.strCity)#', 
            </cfif>
            <cfif get_individual.intCode NEQ "" >
            intCode 				= '#get_individual.intCode#', 
            </cfif>
            <cfif get_individual.CountryName NEQ "" >
            CountryName			= '#trim(get_individual.CountryName)#',
            </cfif>
            lngCompany_ID 	= #get_individual.lngCompany_ID#,
</cfif>
		<cfif  parameterexists(form.BPA_Designation_Update) >            
					<cfif get_individual.BPA_Designation NEQ "" >
                    BPA_Designation	= '#trim(get_individual.BPA_Designation)#', 
                    </cfif>
		</cfif>


            
            chkMail 				= #get_individual.chkMail#,

		<cfif get_individual.strWebSite NEQ "" >
        		strWebSite			= '#get_individual.strWebSite#',
        </cfif>
		<cfif parameterexists(form.IndustrySector) >
                chkExploration 	= #get_individual.chkExploration#,
                chkRefining 		= #get_individual.chkRefining#,
                chkPower 			= #get_individual.chkPower#,
                chkGas 			= #get_individual.chkGas#,
                chkRenBio 		= #get_individual.chkRenBio#,
                industrySecEconomy	=  #get_individual.industrySecEconomy#,
		</cfif>
		<cfif   parameterexists(form.PostInterest)>
					<!--- Region of interest Mail                         _--------------------------------------->
                    chkW				=  #get_individual.chkW#, 
                    chkNA				= #get_individual.chkNA#, 
                    chkL					= #get_individual.chkL#, 
                    chkME 				= #get_individual.chkME#, 
                    chkE 				= #get_individual.chkE#, 
                    chkAF 				= #get_individual.chkAF#, 
                    chkA 				= #get_individual.chkA#, 
                    chkMag 			= #get_individual.chkMag#, 
                    chSAE 				= #get_individual.chSAE#,
                    chkWA 				= #get_individual.chkWA#,
                    chkEAF 			=#get_individual.chkEAF#,
                    chkIntPostAus 	=#get_individual.chkIntPostAus#,
		</cfif>
            strIndSource		= 'web',
            STATUS			= 'C',

            UpdBy				= <cfqueryparam value="#Session.staffName#">,	
            
			dtmUpdated 		= <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">

WHERE IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#get_NewID.newid#" >

</cfquery>



<!--- GEt DATA FROM OPTION WEB TABLE -------->
<cfquery datasource="#gpp#" name="get_options">
SELECT * 
FROM  tblIndOptions_web
WHERE IND_RecID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
</cfquery>

<cfquery datasource="#gpp#" >
UPDATE tblIndOptions
SET 
      
<!--- REGIONS OF INTEREST                                             _--------------------------------------->
<cfif   parameterexists(form.WebInterest)>
                    chkWebIntWo 				= #get_options.chkWebIntWo#, 
                    chkWebIntAf					= #get_options.chkWebIntAf#, 
                    chkWebIntNaf				= #get_options.chkWebIntNaf#, 
                    chkWebIntMe 				= #get_options.chkWebIntMe#, 
                    chkWebIntAs					= #get_options.chkWebIntAs#, 
                    chkWebIntLa					= #get_options.chkWebIntLa#, 
                    chkWebIntNa					= #get_options.chkWebIntNa#, 
                    chkWebIntEu 				= #get_options.chkWebIntEu#, 
                    chkWebIntGen 				= #get_options.chkWebIntGen#, 
                    
                    chkWebIntSAE 				= #get_options.chkWebIntSAE#,
                    chkWebIntEAf 				= #get_options.chkWebIntEAf#,
                    chkWebIntWAf 				= #get_options.chkWebIntWAf#,
                    chkWebIntAdvertising 	= #get_options.chkWebIntAdvertising#,
                    chkWebIntAus			 	= #get_options.chkWebIntAus#,
</cfif>
<cfif   parameterexists(form.newsletters)>
<!--- NEWSLETTERS                                             _--------------------------------------->
        			
                    chkCaNews 			= #get_options.chkCaNews#,
                    chkOzNews 			= #get_options.chkOzNews#,
                    chkMedNews 		= #get_options.chkMedNews#,
                    chkEAENews 		= #get_options.chkEAENews#,
                    chkWAENews 		= #get_options.chkWAENews#,
                    chkNOCNews 		= #get_options.chkNOCNews#,
                    chkPCapNews	 	= #get_options.chkPCapNews#,
                    chkW 					= #get_options.chkW#,
                    chkLA					= #get_options.chkLA#,
                    chkME 					= #get_options.chkME#,
                    chkE 					= #get_options.chkE#,
                    chkAF 					= #get_options.chkAF#,
                    chkA 					= #get_options.chkA#,
                    chkSAENews 		= #get_options.chkSAENews#,
                    
                    chkNigerNews 		= #get_options.chkNigerNews#,
                    chkIndiaNews 		= #get_options.chkIndiaNews#,
                    chkBrazilNews 		= #get_options.chkBrazilNews#,
                    chkChinaNews 		= #get_options.chkChinaNews#,
                    chkRussiaNews 	= #get_options.chkRussiaNews#,
                     chkAngolaNews 	= #get_options.chkAngolaNews#,
                     chkPetEurasNews	= #get_options.chkPetEurasNews#,
                     chkUSANews 		= #get_options.chkUSANews#,
                     chkPetMagNews	= #get_options.chkPetMagNews#,
                     
                     chkSuperNews 		= #get_options.chkSuperNews#,
                     chkFrontierNews	= #get_options.chkFrontierNews#,
                     chkWorldIndNews = #get_options.chkWorldIndNews#,
                     chkIraqNews			=  #get_options.chkIraqNews#,
                      chkAtlanticNews	= #get_options.chkAtlanticNews#,
 </cfif>                    
 					merged 					= 0
WHERE lngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#get_NewID.newid#" >
</cfquery>
        
        
        
<!---#####################
	 
	 ###########
	 END UPDATE OLD RECORD    
        
 #############################--->       
        
        
        
        
        

<cfelse>
		<!--- Create new Record and get ID -------->
        <cfquery name="get_NewID" datasource="#gpp#" >
        INSERT INTO tblIndividual (dtmCaptured)
        VALUES (<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">)
        SELECT @@IDENTITY AS newid
        </cfquery>
<!---- ########## ADD  THE RECORDS  TO GPP DB ########################################################------------>

<cfquery datasource="#gpp#" name="get_individual">
SELECT * 
FROM  tblIndividual_web
WHERE RecID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
</cfquery>

<cfquery datasource="#gpp#" >
UPDATE tblIndividual
SET 
<!--- Personal Details   _--------------------------------------->

			<cfif get_individual.title NEQ "" >
            Title 						= '#trim(get_individual.title)#',  
            </cfif>
            <cfif get_individual.strFirst_Name NEQ "" >
            strFirst_Name		= '#trim(get_individual.strFirst_Name)#', 
            </cfif>
            <cfif get_individual.strSurname NEQ "" >
            strSurname			= '#trim(get_individual.strSurname)#', 
            </cfif>
            <cfif get_individual.strDesignation NEQ "" >
            strDesignation		= '#trim(get_individual.strDesignation)#', 
            </cfif>

           
					<cfif get_individual.BPA_Designation NEQ "" >
                    BPA_Designation	= '#trim(get_individual.BPA_Designation)#', 
                    </cfif>

            <cfif get_individual.strPhDirect_Code NEQ "" >
            strPhDirect_Code	= '#get_individual.strPhDirect_Code#',
            </cfif>
            <cfif get_individual.strPhDirect_No NEQ "" >
            strPhDirect_No		= '#get_individual.strPhDirect_No#',
            </cfif>
            <cfif get_individual.strFaxDirect_Code NEQ "" >
            strFaxDirect_Code	= '#get_individual.strFaxDirect_Code#',
            </cfif>
            <cfif get_individual.strFaxDirect_No NEQ "" >
            strFaxDirect_No		= '#get_individual.strFaxDirect_No#',
            </cfif>
            <cfif get_individual.strEmail NEQ "" >
            strEmail				= '#trim(get_individual.strEmail)#',
            </cfif>
            
            <cfif get_individual.strSecretary_Email NEQ "" >
            strSecretary_Email		= '#trim(get_individual.strSecretary_Email)#',
            </cfif>            
            
            <cfif get_individual.strEmail_Alt NEQ "" >
            strEmail_Alt				= '#trim(get_individual.strEmail_Alt)#',
            </cfif>            
            
            
            <cfif get_individual.strStreet_Adress NEQ "" >
            strStreet_Adress 	= '#trim(get_individual.strStreet_Adress)#', 
            </cfif>
            <cfif get_individual.strPostal_Adress NEQ "" >
            strPostal_Adress 	= '#trim(get_individual.strPostal_Adress)#', 
            </cfif>
            <cfif get_individual.username NEQ "" > 
            username 				=  '#get_individual.username#',
            </cfif>
            <cfif get_individual.password NEQ "" > 
            password 				=  '#get_individual.password#',
            </cfif>
            <cfif get_individual.strCity NEQ "" > 
            strCity 					= '#trim(get_individual.strCity)#', 
            </cfif>
            <cfif get_individual.intCode NEQ "" >
            intCode 				= '#get_individual.intCode#', 
            </cfif>
            <cfif get_individual.CountryName NEQ "" >
            CountryName			= '#trim(get_individual.CountryName)#',
            </cfif>
            
            chkMail 				= #get_individual.chkMail#,
            lngCompany_ID 	= #get_individual.lngCompany_ID#,
			<cfif get_individual.strWebSite NEQ "" >
            strWebSite			= '#get_individual.strWebSite#',
            </cfif>

			chkExploration 	= #get_individual.chkExploration#,
            chkRefining 		= #get_individual.chkRefining#,
            chkPower 			= #get_individual.chkPower#,
            chkGas 			= #get_individual.chkGas#,
            chkRenBio 		= #get_individual.chkRenBio#,
            industrySecEconomy	= #get_individual.industrySecEconomy#,


<!--- Region of interest Mail                         _--------------------------------------->
            chkW				=  #get_individual.chkW#, 
            chkNA				= #get_individual.chkNA#, 
            chkL					= #get_individual.chkL#, 
            chkME 				= #get_individual.chkME#, 
            chkE 				= #get_individual.chkE#, 
            chkAF 				= #get_individual.chkAF#, 
            chkA 				= #get_individual.chkA#, 
            chkMag 			= #get_individual.chkMag#, 
            chSAE 				= #get_individual.chSAE#,
            chkWA 				= #get_individual.chkWA#,
            chkEAF 			=#get_individual.chkEAF#,
             chkIntPostAus 	=#get_individual.chkIntPostAus#,
    <!--- INdustry sector                                                  _--------------------------------------->

<!---            chkExploration 	= #get_individual.chkExploration#,
            chkRefining 		= #get_individual.chkRefining#,
            chkPower 			= #get_individual.chkPower#,
            chkGas 			= #get_individual.chkGas#,
            chkRenBio 		= #get_individual.chkRenBio#,--->
            CapBy				= <cfqueryparam value="#Session.staffName#">,	
            strIndSource		= 'web',
            STATUS			= 'C',
            UpdBy				= <cfqueryparam value="#Session.staffName#">,	
            
			dtmUpdated 		= <cfqueryparam cfsqltype="cf_sql_date" value="#now()#">

WHERE IngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#get_NewID.newid#" >

</cfquery>



<!--- Create new Record In  Options Table ONLY IF ADDINVG NEW RECORD -------->
        <cfquery  datasource="#gpp#" >
        INSERT INTO tblIndOptions (lngIndividual_ID)
        VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value="#get_NewID.newid#">)
        </cfquery>

<!--- GEt DATA FROM OPTION WEB TABLE -------->
<cfquery datasource="#gpp#" name="get_options">
SELECT * 
FROM  tblIndOptions_web
WHERE IND_RecID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
</cfquery>

<cfquery datasource="#gpp#" >
UPDATE tblIndOptions
SET 
      
<!--- REGIONS OF INTEREST                                             _--------------------------------------->
                    chkWebIntWo 				= #get_options.chkWebIntWo#, 
                    chkWebIntAf					= #get_options.chkWebIntAf#, 
                    chkWebIntNaf				= #get_options.chkWebIntNaf#, 
                    chkWebIntMe 				= #get_options.chkWebIntMe#, 
                    chkWebIntAs					= #get_options.chkWebIntAs#, 
                    chkWebIntLa					= #get_options.chkWebIntLa#, 
                    chkWebIntNa					= #get_options.chkWebIntNa#, 
                    chkWebIntEu 				= #get_options.chkWebIntEu#, 
                    chkWebIntGen 				= #get_options.chkWebIntGen#, 
                    
                    chkWebIntSAE 				= #get_options.chkWebIntSAE#,
                    chkWebIntEAf 				= #get_options.chkWebIntEAf#,
                    chkWebIntWAf 				= #get_options.chkWebIntWAf#,
                    chkWebIntAus			 	= #get_options.chkWebIntAus#,

<!--- NEWSLETTERS                                             _--------------------------------------->
        			chkWebIntAdvertising 	= #get_options.chkWebIntAdvertising#,
                    chkCaNews 			= #get_options.chkCaNews#,
                    chkOzNews 			= #get_options.chkOzNews#,
                    chkMedNews 		= #get_options.chkMedNews#,
                    chkEAENews 		= #get_options.chkEAENews#,
                    chkWAENews 		= #get_options.chkWAENews#,
                    chkNOCNews 		= #get_options.chkNOCNews#,
                    chkPCapNews	 	= #get_options.chkPCapNews#,
                    chkW 					= #get_options.chkW#,
                    chkLA					= #get_options.chkLA#,
                    chkME 					= #get_options.chkME#,
                    chkE 					= #get_options.chkE#,
                    chkAF 					= #get_options.chkAF#,
                    chkA 					= #get_options.chkA#,
                    chkSAENews 		= #get_options.chkSAENews#,
                    
                    chkNigerNews 		= #get_options.chkNigerNews#,
                    chkIndiaNews 		= #get_options.chkIndiaNews#,
                    chkBrazilNews 		= #get_options.chkBrazilNews#,
                    chkChinaNews 		= #get_options.chkChinaNews#,
                    chkRussiaNews 	= #get_options.chkRussiaNews#,
                     chkAngolaNews 	= #get_options.chkAngolaNews#,
                     chkPetEurasNews	= #get_options.chkPetEurasNews#,
                     chkUSANews 		= #get_options.chkUSANews#,
                     chkPetMagNews	= #get_options.chkPetMagNews#,
                     chkSuperNews 		= #get_options.chkSuperNews#,
                     chkFrontierNews	= #get_options.chkFrontierNews#,
                     chkWorldIndNews = #get_options.chkWorldIndNews#,
                     chkIraqNews			=  #get_options.chkIraqNews#,
                     chkAtlanticNews	= #get_options.chkAtlanticNews#
                     
WHERE lngIndividual_ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#get_NewID.newid#" >
</cfquery>











</cfif>















<!---################# DELEYTE THE TEMP RECORDS #####################_----------->
<cfquery datasource="#gpp#" >
 	DELETE FROM tblIndividual_WEB
	    
    WHERE RecID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
	
</cfquery>

<cfquery datasource="#gpp#" >
 	DELETE FROM tblIndOptions_WEB
	    
    WHERE IND_RecID =  <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#" >
	
</cfquery>



</cfif>
</cfsilent>
<cfoutput>#form.id#</cfoutput>