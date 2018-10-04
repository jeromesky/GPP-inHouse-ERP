<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>P21</title>
</head>

<body>
<cfset regOld = "chkAF">
<cfset regNew = 2>
<cfset countries = "71,141,168,186,229,245,267, 3, 6,31,139,147,169,171,224,232,273,274, 66,74,76,129,147,148,169,204,223,229,238,250,281, 150, 40, 77, 127,94, 6,26,38,42,46,47,55,56,60,73,87,88,92,102,103,140,151,156,168,171,180,181,214,218,240,272, 22, 147, 217, 54, 244, 205, 212">
<cfoutput>
<cfquery datasource="#gpp#" name="qryGet">
SELECT    DISTINCT 
			IngIndividual_ID AS userID
FROM         
			dbo.tblIndividual 
            INNER JOIN 
            	dbo.tblIndOptions 
            ON 
            	dbo.tblIndividual.IngIndividual_ID = dbo.tblIndOptions.lngIndividual_ID
			INNER JOIN
                      dbo.user2area 
            ON dbo.tblIndividual.IngIndividual_ID = dbo.user2area.userID
<!---     
		(dbo.tblIndividual.countryID  IN (#countries#) ) AND--->
 WHERE         (dbo.user2area.areaID NOT IN (2, 3, 4, 5) AND deliveryFormat  = 2) AND
		( (dbo.tblIndividual.chkMail <> 1) AND (dbo.tblIndividual.STATUS = 'c') AND (dbo.tblIndOptions.chkCompetitors <> 1)  AND (dbo.tblIndOptions.#regOld# = 1)   <!---AND (dbo.tblIndOptions.email_bounce < 15) ---> )
</cfquery>

<!---(dbo.tblIndividual.#regOld# = 1)  OR<cfquery name="qryGet" datasource="#gpp#">
SELECT DISTINCT dbo.tblIndividual.IngIndividual_ID AS userID
FROM         dbo.tblIndividual INNER JOIN
                      dbo.tblIndOptions ON dbo.tblIndividual.IngIndividual_ID = dbo.tblIndOptions.lngIndividual_ID
WHERE (  (dbo.tblIndividual.countryID  IN (#countries#) )  ) AND
				((dbo.tblIndividual.chkMail <> 1) AND (dbo.tblIndividual.STATUS = 'c') AND (dbo.tblIndOptions.chkCompetitors <> 1)  )
</cfquery>--->

</cfoutput>

<!---SELECT DISTINCT dbo.tblIndividual.IngIndividual_ID
FROM         dbo.tblIndividual INNER JOIN
                      dbo.tblIndOptions ON dbo.tblIndividual.IngIndividual_ID = dbo.tblIndOptions.lngIndividual_ID 
                      INNER JOIN
                      dbo.user2area ON dbo.tblIndividual.IngIndividual_ID = dbo.user2area.userID
WHERE     (dbo.tblIndOptions.chkWebIntAf = 1) AND (dbo.tblIndividual.countryID NOT IN (71, 141, 168, 186, 229, 245, 267, 3, 6, 31, 139, 147, 169, 171, 224, 232, 
                      273, 274, 66, 74, 76, 129, 147, 148, 169, 204, 223, 229, 238, 250, 281, 150, 40, 77, 127, 94, 6, 26, 38, 42, 46, 47, 55, 56, 60, 73, 87, 88, 92, 102, 103, 
                      140, 151, 156, 168, 171, 180, 181, 214, 218, 240, 272, 22, 147, 217, 54, 244, 205, 212)) AND (dbo.tblIndOptions.email_bounce < 15) AND 
                      (dbo.tblIndividual.chkRecAlerts <> 1) AND (dbo.tblIndOptions.chkCompetitors <> 1) AND (dbo.user2area.areaID NOT IN (2, 3, 4, 5))--->



 <cfloop query="qryGet">
<cfquery datasource="#gpp#">
INSERT INTO user2area
	(
    userID,
    areaID,
    deliveryFormat,
    areaActive
    )
VALUES
	(
    <cfqueryparam cfsqltype="cf_sql_integer" value="#qryGet.userID#">,
    <cfqueryparam cfsqltype="cf_sql_integer" value="#regNew#">,
    <cfqueryparam cfsqltype="cf_sql_integer" value="2">,
    <cfqueryparam cfsqltype="cf_sql_integer" value="1">    
    )

</cfquery>
<cfoutput>#qryGet.userID#</cfoutput><br />
</cfloop>

<cfoutput>((#qryGet.recordcount#))<br /> #countries#....</cfoutput>
</body>
</html>
<!---
Australasia  = [7][chkWebIntAus]  14,178, 191, 171, 242, 57, 210, 268, 4, 249, 131, 154, 160, 222, 99, 85, 86, 172, 255, 19, 58, 80, 110, 123, 125, 130, 161, 177, 182, 183, 184, 189, 241, 258, 264, 265, 196
Asia  =  [6][chkWebIntAs] 113, 114, 149, 219, 41, 239, 260, 136, 170, 236, 49, 28, 188, 195, 20,  174, 165, 228, 122, 132, 133, 187, 34, 69, 109
Central Asia = [15] 113, 187, 1, 237, 135, 128, 203, 257, 247, 246, 115, 16, 11, 90, 
Middle East = [8][chkWebIntMe] 3, 245, 141, 71, 118, 138, 126, 235, 246, 116, 115, 213, 186, 270, 252, 200, 134, 229, 74, 76, 223, 281, 66, 247, 257, 237, 135, 128, 16, 90, 11, 266, 275
Mediterranean  = [16] 168, 3, 141, 71, 118, 138, 235, 246, 95, 271, 2, 61, 221, 119, 164, 82, 226, 198, 63, 152, 271
Eastern Europe = [17] 197, 64, 220, 111, 61, 30, 221, 271, 2, 146, 37, 202, 163, 251, 23, 143, 137, 75,203
North America =  [9][chkWebIntNa] 43, 254 
Europe = [11][chkWebIntEu] 198, 226, 5, 82, 164, 119, 234, 15, 175, 24, 143, 117, 253, 185, 112, 233, 65, 81, 91, 197, 220, 221, 111, 61, 30, 271, 2, 146, 95, 96, 37, 202, 163, 251, 64, 23, 203, 143, 137, 75, 63, 152, 93 ,231, 124, 153, 101, 211, 142, 107, 79
Latin America = [10][chkWebIntLa] 12, 17, 21, 25, 35, 45, 59, 62, 67, 68, 72, 7, 9, 105, 108, 120, 155, 167, 173, 176, 179, 190, 97, 98, 100, 206, 207, 209, 243, 248, 261, 199,  29, 33, 70, 78, 84, 10, 104, 48, 230, 256, 193, 194, 259, 53, 159, 51, 248

north Africa= [2][chkWebIntNaf] 71,141,168,186,229,245,267, 3
south Africa [3][chkWebIntSAE]  6,31,139,147,169,171,224,232,273,274
East Africa [4][chkWebIntEAf] 66,74,76,129,147,148,169,204,223,229,238,250,281, 150, 40, 77, 127,94
western Africa [5][chkWebIntWAf] 6,26,38,42,46,47,55,56,60,73,87,88,92,102,103,140,151,156,168,171,180,181,214,218,240,272, 22, 147, 217, 54, 244, 205, 212
Worldwide  = [12][chkWebIntWo]
General  = [13][chkWebIntGen]
3rd party  = [14][chkWebIntAdvertising]

AFRICA = 71,141,168,186,229,245,267, 3, 6,31,139,147,169,171,224,232,273,274, 66,74,76,129,147,148,169,204,223,229,238,250,281, 150, 40, 77, 127,94, 6,26,38,42,46,47,55,56,60,73,87,88,92,102,103,140,151,156,168,171,180,181,214,218,240,272, 22, 147, 217, 54, 244, 205, 212--->