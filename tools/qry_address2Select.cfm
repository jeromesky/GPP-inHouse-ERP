<cfset gpp = "GPP">
<cfdump var="#form#">


<cfset allUserID = #form.allUserID#>
<cfif parameterexists(form.userID)><cfset userID = #form.userID#><cfelse><cfset userID =""></cfif>
<cfset usersRemove = "">


<cfif parameterexists(form.userID)>
    <cfloop list="#userID#" index="user">
        <cfset allUserID =	ListDeleteAt(allUserID,  listfind(allUserID, user, ","), ",")>
        <cfset form[#user#] = #form[user]# - 100>
        
        
        <cfquery datasource="#gpp#">
            UPDATE tblIndividual
                SET branchID = #form[user]#
                WHERE IngIndividual_ID = #user#
        </cfquery>
    </cfloop>
</cfif>

remove to 5:<cfdump var="#allUserID#"><br>
Keep: <cfdump var="#userID#">
<cfdump var="#form#">


<cfif ListLen(allUserID, ",") GT 0>
    <cfquery datasource="#gpp#" name="editBranch">
        UPDATE tblIndividual
            SET 
            branchID = -5
        WHERE IngIndividual_ID IN (#allUserID#)
    </cfquery>
</cfif>

<cflocation url="dsp_address2Select.cfm?searching=#form.searching#" addtoken="no">