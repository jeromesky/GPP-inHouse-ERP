<CFINCLUDE template="../Application.cfm">

<cfif form.TableToChange contains "tblIndOptions" >
				<cfset theIDfieldName = "lngIndividual_ID" >
<cfelseif form.TableToChange contains "tblIndividual"  >
				<cfset theIDfieldName = "IngIndividual_ID" >
</cfif>

<cfquery name="getList" datasource="#gpp#" >
    SELECT  #theIDfieldName#
    FROM #form.TableToChange#
   WHERE  #form.field# = 
   	    	<cfif isNumeric(form.searchValue) >
        		<cfqueryparam cfsqltype="cf_sql_integer" value="#form.searchValue#" >
        <cfelse>
        		<cfqueryparam  value="#trim(form.searchValue)#" >
        </cfif>
</cfquery>

<cfoutput>
<fieldset>
	<legend>Search Result </legend>
                        <table   border="0" cellpadding="2" cellspacing="8" style="color:##333333; font-size:12px; font-family:Arial, Helvetica, sans-serif">
                          
                          <tr>
                            <td>Value to change <strong>#form.searchValue#</strong></td>
                            <td>Found <strong>#getList.recordcount#</strong> Records</td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>Table to Update</td>
                            <td>#form.TableToChange#</td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>Field to change</td>
                            <td>#form.field# <input type="hidden" value="#form.field#" name="field" />
                            <input type="hidden" value="#theIDfieldName#" name="IDfieldName" />
                            <input type="hidden" value="#form.TableToChange# " name="TableToChange" />                          </td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>Type New Value to change to</td>
                            <td ><label>
                              <input type="text" name="changeValue" id="changeValue" /><input type="hidden" value="#form.searchValue#" name="searchValue" />
                            </label></td>
                            <td>&nbsp;</td>
                          </tr>
                       <tr>
                            <td>&nbsp;</td>
                         <td > <span style="color:##FF0000; font-weight:bold; font-size:13px">Taking this action is ireversable!!</span></td>
                         <td><button >Change </button> </td>
                          </tr>
                        </table>
 </fieldset>
</cfoutput>