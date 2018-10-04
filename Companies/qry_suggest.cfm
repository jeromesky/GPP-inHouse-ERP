<cfparam name="companyType" default="">
<cfparam name="sName" default="#form.sName#">
<cfparam name="sVal" default="#form.sVal#">

<cfswitch expression="#form.sName#">

<cfcase value="searchCountry">
   <cfquery datasource="#gpp#" name="qryCompanies">
        SELECT 
            [companyName]
           ,[companyURL]
           ,[companyID]
       FROM
            [companies]
       WHERE
            [companyName] LIKE '- %'
      ORDER BY 
            [companyName]
    </cfquery>
    <cfset companyType = "country">
</cfcase>

<cfcase value="searchAcademic">
   <cfquery datasource="#gpp#" name="qryCompanies">
        SELECT 
            [companyName]
           ,[companyURL]
           ,[companyID]
       FROM
            [companies]
       WHERE
            [companyName] LIKE '-- Academic%'
      ORDER BY 
            [companyName]
    </cfquery>
     <cfset companyType = "academic">
</cfcase>

<cfcase value="searchIndependent">
   <cfquery datasource="#gpp#" name="qryCompanies">
        SELECT 
            [companyName]
           ,[companyURL]
           ,[companyID]
       FROM
            [companies]
       WHERE
            [companyName] LIKE '-- Independent%'
      ORDER BY 
            [companyName]
    </cfquery>
    <cfset companyType = "independent">
</cfcase>

<cfcase value="searchAssociation">
   <cfquery datasource="#gpp#" name="qryCompanies">
        SELECT 
            [companyName]
           ,[companyURL]
           ,[companyID]
       FROM
            [companies]
       WHERE
            [companyName] LIKE '-- Association%'
      ORDER BY 
            [companyName]
    </cfquery>
    <cfset companyType = "association">
</cfcase>

<cfcase value="searchDomain">
  <cfquery datasource="#gpp#" name="qryCompanies">
      SELECT 
          [companyName]
         ,[companyURL]
         ,[companyID]
     FROM
          [companies]
     WHERE
          [companyURL] LIKE '%#form.sVal#%' 
          OR
          [companyName] LIKE '%#form.sVal#%'
    ORDER BY 
          [companyName]
  </cfquery>
   <cfset companyType = "company">
</cfcase>

<cfcase value="searchLabels"> 
    <cfquery datasource="#gpp#" name="qryCompanies">
        SELECT TOP 1
            [companyName]
           ,[companyURL]
           ,[companyID]
       FROM
            [companies]
       WHERE
            [companyID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.sVal#">
    </cfquery>
     <cfset companyType = "labels">
</cfcase>

</cfswitch>

<!---<cfset countries = "499, 557, 881, 984, 1043, 1303, 1436, 1457, 1459, 1467, 1660, 1835, 1841, 1846, 1856, 1987, 2363, 2524, 2757, 2870, 2874, 2875, 2881, 2886, 2894, 2906, 2907, 2908, 2913, 2918, 2923, 2934, 2936, 2938, 2941, 2943, 3141, 3143, 3148, 3154, 3155, 3157, 3160, 3367, 3371, 3373, 3376, 3545, 3546, 3558, 3597, 3805, 3966, 4157, 4172, 4261, 4283, 4430, 4637, 4648, 4670, 4876, 4878, 4885, 4917, 4920, 4921, 4983, 5291, 5313, 5319, 5328, 5336, 5367, 5392, 5394, 5437, 5504, 5563, 5593, 5713, 5742, 5830, 5885, 5901, 5914, 5966, 6048, 6068, 6239, 6272, 6277, 6307, 6356, 6389, 6411, 6443, 6477, 6487, 6496, 6560, 6797, 6864, 6885, 6942, 7015, 7017, 7018, 7020, 7038, 7043, 7052, 7057, 7064, 7102, 7121, 7129, 7146, 7192, 7229, 7294, 7374, 7392, 7405, 7411, 7428, 7433, 7448, 7461, 7468, 7469, 7470, 7471, 7472, 7473, 7474, 7475, 7476, 7477, 7478, 7479, 7480, 7481, 7482, 7483, 7484, 7485, 7486, 7487, 7488, 7489, 7490, 7491, 7492, 7493, 7494, 7495, 7496, 7497, 7498, 7499, 7500, 7501, 7502, 7503, 7504, 7505, 7506, 7507, 7508, 7509, 7510, 7511, 7512, 7513, 7514, 7515, 7516, 7517, 7518, 7519, 7520, 7521, 7522, 7523, 7524, 7525, 7526, 7527, 7528, 7529, 7530, 7531, 7532, 7533, 7534, 7535, 7536, 7537, 7538 ">
<cfset emailContact = "7802, 7803, 7804, 7805, 7806, 7807, 7808, 7809, 7810, 7811 ">
<cfset asociations = "7617, 7618, 7619, 7620, 7621, 7622, 7623, 7624, 7625, 7626, 7627, 7628, 7629, 7630, 7631, 7632, 7633, 7634, 7637 ">--->