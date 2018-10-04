<cfparam name="form.fileQuality" default="1">

<cfset fileDate 	= "#dateFormat(now(), "yyyymmdd")#">
<cfset idExtension 	= #form.fileTableID#>
<cfset FilePurpose 	= #replace(form.FilePurposeLabel, " ", "_", "ALL")#>
<cfset Directory 	= "_files" >
<!---<cfset FilePurpose = "">--->
<cfscript>
 edf = createObject("component", "Officecfc.fileLocation");
 qry_filePath = edf.fileServerPath(form.fileType, form.FilePurposeID);
</cfscript>

  <cfquery name="qry_fileName" datasource="#gpp#">
	INSERT INTO [files]
        (
         [fileTable]
        ,[fileTableID]
        ,[fileType]
        ,[FilePurposeID]
      	,[fileDate]
      	,[staffID]
        ,[fileComment]
        ,[fileQuality]
        )
    VALUES
    	(
        <cfqueryparam cfsqltype="cf_sql_char" value="#form.fileTable#">
        ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.fileTableID#">
        ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.fileType#">
        ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.FilePurposeID#">
        ,<cfqueryparam cfsqltype="cf_sql_date" value="#now()#">
        ,<cfqueryparam cfsqltype="cf_sql_integer" value="#session.staffID#">
        ,<cfqueryparam cfsqltype="cf_sql_char" value="#form.fileComment#">
        ,<cfqueryparam cfsqltype="cf_sql_integer" value="#form.fileQuality#">
        )
     SELECT @@IDENTITY AS fileID
  </cfquery>
  
<!---- SET DIRECTORY  LOCATION ------>
<cfswitch expression="#form.FilePurposeID#">
    		<cfcase value="176">
            		<cfquery datasource="#gpp#" name="qry_user">
                    SELECT 	userName + ' ' + userSurname AS users
                    FROM		[CRM_users]
                    WHERE	[userID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.fileTableID#">
                    </cfquery>
            		
					<cfset FilePurpose = "#REReplace(replace(qry_user.users, " ", "_", "ALL"),"[^0-9A-Za-z ]","","all")#"><!---replace(qry_user.users, " ", "_", "ALL")#---->
            </cfcase>
            
            <cfcase value="170,174,172,173" delimiters=",">
                    <cfquery datasource="#gpp#" name="qry_events">
                    SELECT 	[event_name]
                    FROM		[CRM_events]
                    WHERE	[eventID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.fileTableID#">
                    </cfquery>
            
            		<cfset FilePurpose = "#REReplace(replace(qry_events.event_name, " ", "_", "ALL"),"[^0-9A-Za-z ]","","all")#"><!---#replace(qry_events.event_name, " ", "_", "ALL")#--->
            </cfcase>
</cfswitch>

		<cffile ACTION="Upload" FILEFIELD="form.fileName" DESTINATION="#qry_filePath#" nameconflict="MAKEUNIQUE"><!---#ServerRootPath##Directory#--->

		<cfset fileName_renamed = "#FilePurpose#_#fileDate#_#qry_fileName.fileID#x#idExtension#.#file.clientFileExt#">

		<cfoutput>#qry_fileName.fileID# // #FilePurpose#</cfoutput><cfdump var="#form#">

		<cffile action="rename" source="#qry_filePath#\#File.ServerFile#"  destination="#qry_filePath#\#fileName_renamed#"><!---#ServerRootPath##Directory#  #ServerRootPath##Directory#--->

      <cfquery datasource="#gpp#">
        UPDATE 
            [files]
        SET
            [fileName] = <cfqueryparam cfsqltype="cf_sql_char" value="#fileName_renamed#">
        WHERE
            [fileID] = <cfqueryparam cfsqltype="cf_sql_integer" value="#qry_fileName.fileID#">
      </cfquery>
  
<!---  
  <cfdump var="#form#">
    <cfdump var="#url#">
  --->
  
 <!---- FILE TO BE EDITED ---->
 <cfif form.fileQuality EQ 1 AND form.FilePurposeID EQ 175 OR form.FilePurposeID EQ 178 >
 
    <cfmail to="administrator@glopac-partners.com"
        from="web@petro21.com"
        subject="Uploaded file to be edited">
        Table =   #form.fileTable#
        tableId =   #form.fileTableID#
        Comment =   #form.fileComment#
        FileName = #fileName_renamed#
        FileID	= #qry_fileName.fileID#
        upload by staffid: #session.staffID#
     </cfmail> 
  </cfif>
  

  
<!---  <cfcatch type="any">
  	<cfmail to="jerome@glopac.com" from="web@petro21.com" subject="file upload" type="html"><cfdump var="#cfcatch#"></cfmail>
  </cfcatch>
  </cftry>--->

<!---
<cfif  listContains("170", form.FilePurposeID, ",")>
	<cfset Directory = "_files\downloads" >

<cfelseif listContains("175,176", form.FilePurposeID, ",")>
	<cfset Directory = "_files\client" >
    
<cfelseif listContains("178", form.FilePurposeID, ",")>
	<cfset Directory = "_files\business" >
    
<cfelseif listContains("199", form.FilePurposeID, ",")>
	<cfset Directory = "_files\conference" >
</cfif>
<cfif form.fileType EQ 150 form.FilePurposeID >
	<cfset Directory = "\downloads" >
	
<cfelseif form.fileType EQ 151>
	<cfset Directory = "\_files\#SubDirectory#" >
<cfelseif form.fileType EQ 152>
	<cfset Directory = "\_files\#SubDirectory#" >
</cfif>
<cfswitch expression="#form.fileTable#">
 			<cfcase value="tblCompany">
					
            </cfcase>
            
            <cfcase value="tblIndividual">
              		
            </cfcase>
            
            <cfcase value="tblAnnual_Conf">

            </cfcase>
            
            <cfdefaultcase>
            		
			</cfdefaultcase>
</cfswitch> 
--->
<!---<!---- SET ROOT PATH  LOCATION ------>
<cfswitch expression="#form.fileType#">
	<cfcase value="152">
        <cfset ServerRootPath =  "G:\Websites\my-office\">
    </cfcase>
    
    <cfcase value="151">
    	<cfset ServerRootPath =  "G:\Websites\petro21\htdocs\">
    </cfcase>
    
    <cfcase value="150">
    	<cfset ServerRootPath =  "G:\Websites\petro21\htdocs\">
    </cfcase>
</cfswitch>

<!---- SET DIRECTORY  LOCATION --------->
<cfswitch expression="#form.FilePurposeID#">
	<cfcase value="171">
    		<cfset Directory = "_files\downloads" >
    </cfcase>
    
    <cfcase value="175,176" delimiters=",">
    		<cfset Directory = "_files\client" >
    </cfcase>
    
    <cfcase value="178">
    		<cfset Directory = "_files\business" >
    </cfcase>
    
    <cfcase value="170,172,173,174,179" delimiters=",">
    		<cfset Directory = "_files\conference" >
    </cfcase>
</cfswitch>--->