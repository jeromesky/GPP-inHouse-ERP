<!---<cfif form.format NEQ "excel"><cfdocumentsection></cfif>--->
<cfoutput>
<div id="header">#get.eventName# <cfif parameterexists(form.count)>Count: #get.recordcount#</cfif>
</div>
  <table width="100%" border="0" id="TableEdit" cellpadding="1" cellspacing="1" 
  style="font-family:Arial, Helvetica, sans-serif; color:##000000; font-size:12px; text-align:left;">

    <tr>
      <cfif form.format EQ "pdf">
        <th>Name</th>
        <th>Position</th>
        <cfelse>
        <th width="50">ID</th>
        <cfif parameterexists(form.title)>
          <th width="40">Title</th>
        </cfif>
        <th width="150">Name</th>
        <th width="180">Surname</th>
        <th width="600">Position</th>
        <th width="450">Company</th>
      </cfif>
      <cfif parameterexists(form.address)>
        <th>Address</th>
      </cfif>
      <cfif parameterexists(form.city)>
        <th>City</th>
      </cfif>
      <cfif parameterexists(form.country)>
        <th>Country</th>
      </cfif>
      <cfif parameterexists(form.zip)>
        <th>Zip / Postal Code</th>
      </cfif>
      <cfif parameterexists(form.email)>
        <th width="300">Email</th>
      </cfif>
      <cfif parameterexists(form.email_sec)>
        <th width="300">Email&nbsp;Secretary</th>
      </cfif>
      <cfif parameterexists(form.phone)>
        <th width="150">Phone&nbsp;No</th>
      </cfif>
      <cfif parameterexists(form.fax)>
        <th width="150">Fax&nbsp;No</th>
      </cfif>
      <cfif parameterexists(form.phone_ALT)>
        <th width="150">Phone&nbsp;Alt</th>
      </cfif>
      <cfif parameterexists(form.mobile)>
        <th width="150">Mobile</th>
      </cfif>
<!---      <cfif parameterexists(form.comment)>
        <th>Comment</th>
      </cfif>
      <cfif parameterexists(form.Comment_Public)>
        <th>Comment&nbsp;Public</th>
      </cfif>--->
      <cfif parameterexists(form.invoiceNo)>
        <th width="60">Invoice&nbsp;No</th>
      </cfif>
    </tr>
    
    <cfset var.company = "none">
    
    <cfloop query="get">
      <tr>
        <cfif form.format EQ "pdf">
          <td valign="bottom"><cfif var.company NEQ get.company> <strong>#Ucase(get.company)#</strong><br></cfif><cfset var.company = "#get.company#">
            <span class="words">#Ucase(get.name)#</span> <span class="words">#Ucase(get.surname)#</span></td>
          <td valign="bottom"><span class="words">#ucase(ReplaceNoCase(get.possition, '&AMP;', '&'))#</span></td>
          <cfelse>
          <td valign="bottom">#get.userID#</td>
          <cfif parameterexists(form.title)>
            <td valign="bottom">#Ucase(get.title)#</td>
          </cfif>
          <td valign="bottom">#Ucase(get.name)#</td>
          <td valign="bottom">#Ucase(get.surname)#</td>
          <td valign="bottom">#ucase(ReplaceNoCase(get.possition, '&AMP;', '&'))#</td>
          <td valign="bottom">#Ucase(get.company)#</td>
        </cfif>
        <cfif parameterexists(form.address)>
          <td valign="bottom">#get.address#</td>
        </cfif>
        <cfif parameterexists(form.city)>
          <td valign="bottom">#get.city#</td>
        </cfif>
        <cfif parameterexists(form.country)>
          <td valign="bottom">#get.country#</td>
        </cfif>
        <cfif parameterexists(form.zip)>
          <td valign="bottom">#get.zip#</td>
        </cfif>
        <cfif parameterexists(form.email)>
          <td valign="bottom">#Lcase(get.email)#</td>
        </cfif>
        <cfif parameterexists(form.email_sec)>
          <td valign="bottom">#Lcase(get.email_sec)#</td>
        </cfif>
        <cfif parameterexists(form.phone)>
          <td valign="bottom">#get.phone#</td>
        </cfif>
        <cfif parameterexists(form.fax)>
          <td>#get.fax#</td>
        </cfif>
        <cfif parameterexists(form.phone_ALT)>
          <td valign="bottom">#get.phone_ALT#</td>
        </cfif>
        <cfif parameterexists(form.mobile)>
          <td valign="bottom">#get.mobile#</td>
        </cfif>
<!---        <cfif parameterexists(form.comment)>
          <td valign="bottom">#get.comment#</td>
        </cfif>
        <cfif parameterexists(form.Comment_Public)>
          <td valign="bottom">#get.Comment_Public#</td>
        </cfif>--->
       
      </tr>
    </cfloop>
  </table>
</cfoutput>
