<cfinclude template="../application.cfm">
<cfset AddOperator = 0 >
<!---<cftry>---> 

<cfif trim(form.InvoiceNo_LNK) NEQ "">
        <cfquery datasource="#gpp#" name="get">
        SELECT 
             	id,  
                title, 
                name, 
                surname, 
                position, 
                company, 
                country, 
                city, 
                strEmail, 
                STATUS, 
                strSecretary_Email, 
                strEmail_Alt, 
                email_web
        FROM
             	CRM_search_Client_Invoice
		WHERE 
           		InvoiceNo_LNK = '#trim(Lcase(form.InvoiceNo_LNK))#'
                <cfset AddOperator = 1 >
    
        <cfif form.name  NEQ  "" >
        		<cfif AddOperator EQ 1 >
                	AND
                </cfif>
        		LOWER(LTRIM(RTRIM(name)))  LIKE '%#Trim(Lcase(form.name))#%'
                <cfset AddOperator = 1 >
    	</cfif>
        <cfif form.surname  NEQ  "" >
        		<cfif AddOperator EQ 1 >
                	AND
                </cfif>
                LOWER(LTRIM(RTRIM(surname))) LIKE '%#Trim(Lcase(form.surname))#%' 
                <cfset AddOperator = 1 >
    	</cfif>
        <cfif form.company  NEQ  "" >
        		<cfif AddOperator EQ 1 >
                	AND
                </cfif>
                LOWER(LTRIM(RTRIM(company)))  LIKE '%#Trim(Lcase(form.company))#%' 
                <cfset AddOperator = 1 >
    	</cfif>
    	<cfif form.strEmail  NEQ  "" >
        		<cfif AddOperator EQ 1 >
                	AND
                </cfif>
              (  
              	LOWER(LTRIM(RTRIM(strEmail))) LIKE '%#Trim(Lcase(form.strEmail))#%' OR
                LOWER(LTRIM(RTRIM(strSecretary_Email))) LIKE '%#Trim(Lcase(form.strEmail))#%' OR
                LOWER(LTRIM(RTRIM(strEmail_Alt))) LIKE '%#Trim(Lcase(form.strEmail))#%' OR
                LOWER(LTRIM(RTRIM(email_web))) LIKE '%#Trim(Lcase(form.strEmail))#%' 
              )
    </cfif>
          
		<cfif form.STATUS NEQ "*">
        		AND status = '#form.STATUS#' 
        <cfelse>
                AND status <> '2'
		</cfif>
        ORDER BY company
</cfquery>

<cfelse>

            <cfquery datasource="#gpp#" name="get">
            SELECT 
            		id,  
                    title, 
                    name, 
                    surname, 
                    position, 
                    company, 
                    country, 
                    city, 
                    strEmail, 
                    STATUS,
                    strEmail_Alt,
                    strSecretary_Email,
                    countryID
                FROM 
                	CRM_Search_Client                
                WHERE <!---1=1--->

                    <cfif form.name  NEQ  "" >
                            <cfif AddOperator EQ 1 >
                                AND
                            </cfif>
                            LOWER(LTRIM(RTRIM(name))) LIKE '%#Trim(Lcase(form.name))#%'
                            <cfset AddOperator = 1 >
                    </cfif>
                    <cfif form.surname  NEQ  "" >
                            <cfif AddOperator EQ 1 >
                                AND
                            </cfif>
                            LOWER(LTRIM(RTRIM(surname))) LIKE '%#Trim(Lcase(form.surname))#%' 
                            <cfset AddOperator = 1 >
                    </cfif>
                    <cfif form.company  NEQ  "" >
                            <cfif AddOperator EQ 1 >
                                AND
                            </cfif>
                            LOWER(LTRIM(RTRIM(company))) LIKE '%#Trim(Lcase(form.company))#%' 
                            <cfset AddOperator = 1 >
                    </cfif>
                    <cfif form.strEmail  NEQ  "" >
                            <cfif AddOperator EQ 1 >
                                AND
                            </cfif>
                          (  
                            LOWER(LTRIM(RTRIM(strEmail))) LIKE '%#Trim(Lcase(form.strEmail))#%' OR
                            LOWER(LTRIM(RTRIM(strSecretary_Email))) LIKE '%#Trim(Lcase(form.strEmail))#%' OR
                            LOWER(LTRIM(RTRIM(strEmail_Alt))) LIKE '%#Trim(Lcase(form.strEmail))#%' <!---OR
                            LOWER(LTRIM(RTRIM(email_web))) LIKE '%#Trim(Lcase(form.strEmail))#%' --->
                          )
                </cfif>
                
                    <cfif form.STATUS NEQ "*">
                        AND status = '#form.STATUS#'
                    <cfelse>
                    		AND status <> '2'
                    </cfif>
                    <cfif form.searchUserCountryID NEQ 0 AND form.searchUserCountryID NEQ "">
                    		<cfif AddOperator EQ 1 >
                                AND
                            </cfif>
                             countryID = #form.searchUserCountryID#
                    </cfif>
                    ORDER BY company
            </cfquery>
</cfif>

<cfif get.recordCount eq 0 >
No result found
</cfif>

<table width="100%" border="0" cellspacing="1" cellpadding="4" id="tableClientSearchResult">
	   <tr> 
        <td colspan="8" bgcolor="#FAFAFA"><cfoutput>found #get.recordcount# records</cfoutput></td>
      </tr>
<cfoutput query="get">
      <tr onMouseOver="style.backgroundColor='##D8E2F9';style.cursor='hand'" onMouseOut="style.backgroundColor='##ffffff';" onclick="javascript:loadTabs(#get.id#);">
        <td>#get.title#  #get.name#  #get.surname# &nbsp;</td>
        <td>#get.position#&nbsp;</td>
        <td>#get.company#&nbsp;</td>
        <td>#get.country#&nbsp; </td>
        <td>#get.city#&nbsp;</td>
        <td> #get.strEmail#&nbsp; </td>
        <td>#get.STATUS#</td>
        <td>(#get.id#)</td>
      </tr></cfoutput>
    </table>

<script type="text/javascript">
<!---
<script type="text/javascript">
$(document).ready(function() { 	   
$('#crm_button_NewUser').css({ 'visibility' : 'visible'});
});
</script>
<cfcatch type="any">
<cfoutput>#cfcatch.Detail#<br>
#cfcatch.Message#<br>
#cfcatch.Type#
</cfoutput>
</cfcatch>
</cftry>--->