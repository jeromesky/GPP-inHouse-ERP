<CFINCLUDE template="../Application.cfm">

<cfparam name="Attributes.DataSource" default=""> 
<cfparam name="Attributes.ColumnList" default="*">
<cfparam name="Attributes.table" default="tblIndividual">
<cfparam name="Attributes.Constraints" default="">
<cfparam name="Attributes.GroupBy" Default="">
<cfparam name="Attributes.OrderBy" Default="#Attributes.ColumnList#">

<cfquery name="getList" datasource="#gpp#" >
    SELECT TOP 1  #Attributes.ColumnList#
    FROM #form.tableSelect#
 <!---   <cfif Attributes.Constraints neq "">WHERE #PreserveSingleQuotes(Attributes.Constraints)#</cfif>
    <cfif Attributes.GroupBy neq "">GROUP BY #Attributes.GroupBy#</cfif>
    <cfif Attributes.OrderBy neq "">ORDER BY #Attributes.OrderBy#</cfif>--->
</cfquery>
 <cfset LoopList = "getList.ColumnList">
 <cfoutput>
<table  border="0" cellpadding="2" cellspacing="6" style="color:##FFFFFF; font-size:12px; font-family:Arial, Helvetica, sans-serif">
                          <tr>
                            <td>Select Field to Search</td>
                            <td>
                            <select name="field" id="field">
                            <cfloop index="ColumnHeadings" list="#Evaluate(LoopList)#">
                            <option value="#ColumnHeadings#" >#ColumnHeadings#</option>
                            </cfloop>
                            </select>                            </td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>Type Value to search</td>
                            <td ><label>
                            	<input type="hidden" name="TableToChange" id="TableToChange" value=" #form.tableSelect#" />
                              <input type="text" name="searchValue" id="searchValue" />
                            </label></td>
                            <td><button >Search </button> &nbsp;</td>
                          </tr>
                       <tr>
                       		<td>&nbsp;</td>
                            <td  ><div id="progressSearch"></div></td>
                            <td>&nbsp;</td>
                          </tr>
                        </table>
 </cfoutput>