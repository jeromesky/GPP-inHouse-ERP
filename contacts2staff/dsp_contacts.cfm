<cfinclude template="../Application.cfm">
<cfset eventid = #form.param1#>

<cfinclude template="qry_contacts.cfm">
<div id="contactAddArea" style="width:250px; float:left; display:block; margin:0 15px 0 10px ">
			
          
            <select name="contactType" id="contactType"><cfoutput query="get_contactType">
                            <option value="#get_contactType.contactTypeID#">#get_contactType.contactTypedescription#</option>
                    </cfoutput>
                 </select>
            <div style="height:300px; overflow:auto; ">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td>Staff name</td>
                        <td><a href="javascript:('',);">add</td>
                      </tr>
                     <cfoutput query="get_Staff"><tr>
                        <td>#get_Staff.staffName#</td>
                        <td><a href="javascript:addContactFunction('../contacts2staff/qry_editContactList.cfm', #eventid#, #get_Staff.staffID#, 'table_contact2staff' )" ><img src="../img/blue_But_Plus.jpg" border="0"  /></a></td>
                      </tr></cfoutput>
                    </table>
            </div>

<!---            <div style="width:250px; height:70px; overflow:auto; float:left; display:block">
                
            </div>--->

</div>

<div id="contactListArea" style="float:right; display:block; width:500px;height:300px; overflow:auto; margin:15px 15px 0px 15px; ">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="table_contact2staff">
        <cfoutput query="get_Contact2Staff"><tr id="contact_#get_Contact2Staff.contact2staffID#">
            <td>#get_Contact2Staff.StaffName#</td>
            <td>#get_Contact2Staff.contactTypeDescription#</td>
            <td><a href="javascript:DeleteFunction('../contacts2staff/qry_editContactList.cfm', #get_Contact2Staff.contact2staffID#, 'contact_');">remove</a></td>
          </tr></cfoutput>
        <tr>
        	<td></td>
            <td></td>
            <td></td>
        </tr>
        </table>
</div>