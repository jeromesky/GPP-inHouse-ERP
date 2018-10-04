<cfparam name="form.username" default="">
<cfparam name="form.useremail" default="">

<cfquery datasource="#gpp#" name="qryUser">
SELECT Top 100 
		[name]
      ,[surname]
      ,[strEmail]
      ,[strSecretary_Email]
      ,[strEmail_Alt]
      ,[userEmail]
      ,[AKA_companyName]
      ,[companyName]
  FROM 
  		[CRM_Individual_Details]
 WHERE 
 	1 = 1
 <cfif form.username NEQ "">
 	AND
 	name + ' ' + surname = <cfqueryparam value="#form.username#">
 </cfif>
 <cfif form.useremail NEQ "">
 	AND
      ( [strEmail] = <cfqueryparam value="#form.useremail#"> 
       OR [strSecretary_Email] = <cfqueryparam value="#form.useremail#"> 
       OR [strEmail_Alt] = <cfqueryparam value="#form.useremail#">)
 </cfif>
 order by 
 	[name]
      ,[surname]
      ,[strEmail]
      ,[strSecretary_Email]
      ,[strEmail_Alt]
      ,[userEmail]
      ,[AKA_companyName]
      ,[companyName]
 </cfquery>