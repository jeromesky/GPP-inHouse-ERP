
<cftry>

<cffile action="Upload" filefield="form.fieldName" destination="G:\files\library" nameconflict="MAKEUNIQUE">
<!---<cfset fileName = "#FileReference##FilePurpose#_#fileDate#_#saveFile.fileID#x#idExtension#.#file.clientFileExt#">--->

<cfscript>
	//sizeResult		= cffile.fileSize / Evaluate(1048576);
	sizeResult		= cffile.fileSize/1024/1024;
	fileExt 				= #cffile.clientFileExt#;
	orgFileName= cffile.serverFile;
	fileName		= replace(cffile.serverFile, " ", "_", "ALL");
	fileName		= REReplace(fileName,"[^A-Za-z0-9 ]", "", "ALL");
	
	//fileSize		= NumberFormat(Round(sizeResult * 100) / 100,"0.00");
	fileSize		= NumberFormat(sizeResult ,"000.00");
</cfscript>

<cfoutput>
    file loaded: #fileName#<br />
    file size: #fileSize# Mb
</cfoutput>

<cfif form.eventType NEQ "eb" OR form.speakerType NEQ 4></cfif>


<cfquery datasource="#gpp#" name="qryMultiple">
	SELECT 
    	speakerID
    FROM		
    	Library
    WHERE
    	speakerID = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.speakerID#">
</cfquery>

<cfquery datasource="gpp" name="qry_topic">
    SELECT
        [speakerTopic]
        ,[eventID]
        ,[speakerSession]
    FROM
        [speakers]
    WHERE
        [speakerID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#speakerID#">
</cfquery>


<cfscript>
	topic = REReplace(qry_topic.speakerTopic,"[^A-Za-z0-9 ]", "", "ALL");
    topic = '#left(replace(topic, " ", "_", "ALL"), 46)#';

	if ( qryMultiple.recordcount GT 0 ){
		fileName	= #form.abbr#&'_'&#topic#&'_part'&qryMultiple.recordcount+1;
	}else {
		fileName	= #form.abbr#&'_'&#topic#;
	}
	
	fileName	= #fileName#&'.'&#cffile.clientFileExt#;
</cfscript>

<!---
topic			= REReplace(topic,"[^A-Za-z0-9 ]", "", "ALL");
fileName	= left(replace(fileName, " ", "_", "ALL"), 46);--->

<cfscript>
	thread = CreateObject("java", "java.lang.Thread");
	thread.sleep(5000);
</cfscript>


<cffile action="rename"  source="G:\files\library\#orgFileName#"  destination="G:\files\library\#fileName#" attributes="normal" mode="777">

<cfquery name="qry_loadFile" datasource="#gpp#"><!---#cffile.clientFileName#.#cffile.clientFileExt#--->
	INSERT INTO
    	[library]
        (
           libraryTitle
           ,speakerID
          ,dateLoaded
          ,fileSize
          ,fileType
        )
    VALUES
    	(
         <cfqueryparam cfsqltype="cf_sql_char" value="#fileName#">
         ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.speakerID#">
		,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
        ,<cfqueryparam cfsqltype="cf_sql_decimal" value="#fileSize#">
        ,<cfqueryparam cfsqltype="cf_sql_char" value="#fileExt#">
        )

</cfquery>

<cfcatch type="any">
	<cfmail to="jerome@glopac.com" from="message@petro21.com" subject="error on upload file duncan" type="html"><cfdump var="#cfcatch#"></cfmail>
</cfcatch></cftry>