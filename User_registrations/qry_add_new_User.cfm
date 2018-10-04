<cfquery datasource="#gpp#" name="get">
  UPDATE   
    tblIndividual
                SET              
                strDesignation 					= <cfqueryparam cfsqltype="cf_sql_char"  value="#form.strDesignation#">
               , lngCompany_ID				= <cfqueryparam  cfsqltype="cf_sql_integer" value="#form.lngCompany_ID#">
                ,cityID								= <cfqueryparam  cfsqltype="cf_sql_integer" value="#form.cityID#">
               , countryID							= <cfqueryparam  cfsqltype="cf_sql_integer" value="#form.countryID#">
                ,strPostal_Adress				= <cfqueryparam  cfsqltype="cf_sql_char" value="#form.strPostal_Adress#">
                ,strStreet_Adress				= <cfqueryparam  cfsqltype="cf_sql_char" value="#form.strStreet_Adress#">
                ,Addr_State						= <cfqueryparam  cfsqltype="cf_sql_char" value="#form.Addr_State#">
                ,intCode 							= <cfqueryparam cfsqltype="cf_sql_char"  value="#form.intCode#">
               ,strMobile_No						=  <cfqueryparam cfsqltype="cf_sql_char"  value="#form.strMobile_No#">
               ,userPhoNumbInt				= <cfqueryparam cfsqltype="cf_sql_char" value="#form.userPhoNumbInt#">
               ,AreaCodeTel						= <cfqueryparam cfsqltype="cf_sql_char"  value="#form.AreaCodeTel#">
               ,strPhDirect_No					= <cfqueryparam cfsqltype="cf_sql_char"  value="#form.strPhDirect_No#">
               ,AreaCodeTelAlt					=<cfqueryparam cfsqltype="cf_sql_char"  value="#form.AreaCodeTelAlt#"> 
               ,strPhAlt1_No						=<cfqueryparam cfsqltype="cf_sql_char"  value="#form.strPhAlt1_No#"> 
               ,AreaCodeFax						= <cfqueryparam cfsqltype="cf_sql_char"  value="#form.AreaCodeFax#">
               ,strFaxDirect_No					= <cfqueryparam cfsqltype="cf_sql_char"  value="#form.strFaxDirect_No#">
               ,AreaCodeFaxAlt					= <cfqueryparam cfsqltype="cf_sql_char"  value="#form.AreaCodeFaxAlt#">
               ,strFaxAlt1_No					= <cfqueryparam cfsqltype="cf_sql_char"  value="#form.strFaxAlt1_No#">
               , strEmail 							= <cfqueryparam  cfsqltype="cf_sql_char" value="#form.strEmail#">
               , strEmail_Alt 					= <cfqueryparam  cfsqltype="cf_sql_char" value="#form.strEmail_Alt#">
                ,strSecretary_Email 		= <cfqueryparam cfsqltype="cf_sql_char" value="#form.strSecretary_Email#">
                ,status								= <cfqueryparam  cfsqltype="cf_sql_char" value="C">
           WHERE IngIndividual_ID   = <cfqueryparam  value="#form.id#">
   </cfquery>