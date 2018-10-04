<cfparam name="form.id" default="0">

<cfparam name="url.pgnum" default="yes">
<cfparam name="url.count" default="yes">
<cfparam name="url.printdate" default="yes">
<cfparam name="url.surnamehighlight" default="no">
<cfparam name="url.firstlettergroup" default="no">
<cfparam name="url.indent" default="0"> 

<cfinclude template="../Application.cfm">
<cfset AttendTypeCount = ListLen(form.AttendType, "," )>
<CFSET fieldcount = 0 >
<cfset counter = 1 >
<!--- COUNT THE FIELDS FOR THE COLUMNS COUNT TABLE --->
<cfloop collection="#form#" item="fname">
<cfset fieldcount = fieldcount + 1>
</cfloop>
<cfparam name="get.eventName" default="search result">

<cfif form.id EQ '0'>

</cfif>

<cfif parameterexists(form.countryID) OR parameterexists(form.industrySector)>
<cfset indSec = 1>
	<cfquery datasource="#gpp#" name="get">
    SELECT 
    	disintct *
    FROM
    	[CRM_Report_User_Country]
    WHERE 
		1=1
    	AND
        <cfif parameterexists(form.countryID) AND form.countryID NEQ "">
    		[countryID] IN (#form.countryID#)
        </cfif>
        <cfif parameterexists(form.industrySector) AND form.industrySector NEQ "">
        	1=1
        	AND
        	(
        	1=1 <cfloop list="#form.industrySector#" delimiters="," index="i">
            	<cfif indSec NEQ 1>
                	OR
                </cfif>
                	#i# = 1
             <cfset indSec = indSec +1>
            </cfloop>
        )</cfif>;
    </cfquery>

<cfelseif parameterexists(form.id) AND form.id NEQ "">
        <cfquery datasource="#gpp#" name="get">
        SELECT distinct
        	 *
        FROM 
        	[VIEW_Conference_Attendence_list]
        WHERE 
        	[eventId] IN (#form.id#) 
        AND (
         <cfloop list="#form.AttendType#" delimiters="," index="i">
          <cfif counter NEQ 1 > OR </cfif> #i# = 1<cfset counter = counter + 1 >
         </cfloop>
         )
        <cfif form.paid EQ "yes" OR form.paid EQ "no">
        AND (
         <cfif form.paid EQ "no"> paid = 'NO' OR paid IS NULL 
         <cfelse> paid = 'YES'
         </cfif>
          )
        </cfif>
        AND
         (status LIKE '%#form.Status#%' )
        <cfif form.ChkCancelled NEQ "*">
        AND
         (ChkCancelled #form.ChkCancelled#)
         </cfif>
        ORDER BY 
         company;
        </cfquery>
</cfif>

<!--- /QUERY --->
<cfif parameterexists(form.external) AND form.external eq "excel">
  <CFHEADER NAME="Content-Disposition" VALUE="inline; filename=output_#dateformat(now(), "yyyy-mm-dd")#.xls">
  <CFCONTENT TYPE="application/vnd.msexcel">
  <!---- CREATE EXCEL FOR BADGES --->
  <cfif parameterexists(form.badge) >
    <cftable query ="get"  HTMLTable colheaders>
    <cfcol text = "#Ucase(get.name)#">
    <cfcol text = "#ucase(get.name)# #ucase(get.surname)#">
    <cfcol text="#ucase(ReplaceNoCase(get.possition, '&AMP;', '&'))#">
    <cfcol text = "#Ucase(get.company)#">
    <cfif parameterexists(form.email)>
      <cfcol text = "#get.email#">
    </cfif>
    <cfif parameterexists(form.email_sec)>
      <cfcol text = "#get.email_sec#">
    </cfif>
    <cfif parameterexists(form.phone)>
      <cfcol text = "#get.phone#">
    </cfif>
    <cfif parameterexists(form.fax)>
      <cfcol text = "#get.fax#">
    </cfif>
    <cfif parameterexists(form.phone_ALT)>
      <cfcol text = "#get.phone_ALT#">
    </cfif>
    <cfif parameterexists(form.mobile)>
      <cfcol text = "#get.mobile#">
    </cfif>
    <cfif parameterexists(form.address)>
      <cfcol text = "#get.address#, #get.zip#, #get.city#">
    </cfif>
    <cfif parameterexists(form.pobox)>
      <cfcol text = "#get.POBOX#">
    </cfif>
    <cfif parameterexists(form.country)>
      <cfcol text = "#get.country#">
    </cfif>
    <cfif parameterexists(form.comment)>
      <cfcol text = "#get.comment#">
    </cfif>
    <cfif parameterexists(form.invoiceNo)>
      <cfcol text = "#get.invoiceNo#">
    </cfif>
    <cfif form.paid EQ "yes" OR form.paid EQ "no" OR form.paid EQ "all">
      <cfcol text = "#get.paid#">
    </cfif>
    <cfif parameterexists(form.attend_type)>
      <cfif get.chkDelegate EQ 1 >
        <cfset attend_type = "delegate">
        <cfelseif get.chkSpeaker EQ 1>
        <cfset attend_type = "speaker">
        <cfelseif get.chkGuest EQ 1>
        <cfset attend_type = "guest">
        <cfelseif get.chkModerator EQ 1>
        <cfset attend_type = "moderator">
        <cfelseif get.chkExhibitor EQ 1>
        <cfset attend_type = "exhibitor ">
        <cfelseif get.chkPress EQ 1>
        <cfset attend_type = "press">
<!---        <cfelseif get.chkResearch EQ 1>
        <cfset attend_type = "research">--->
        <cfelseif get.chkSponsor EQ 1>
        <cfset attend_type = "sponsor">
      </cfif>
      <cfcol text = "#attend_type#">
    </cfif>
    <cfif parameterexists(form.chkCompGuest)>
      <cfcol text = "#get.chkCompGuest#">
    </cfif>
    <cfif parameterexists(form.discount)>
      <cfcol text = "#get.discount#">
    </cfif><!---
    <cfif form.status EQ "C" OR form.status EQ "A">
      <cfcol text = "#get.status#">
    </cfif>--->
    </cftable>
    <!--- CREATE EXCEL --->
    <cfelse>
    <table width="100%" border="0" cellpadding="4" cellspacing="1" id="TableEdit">
      <tr >
        <th><cfoutput>#get.eventName#:
          <cfif parameterexists(form.count)>
            Count #get.recordcount#
          </cfif>
        </th>
          </cfoutput>
          <cfif parameterexists(form.Mailmerge)>
          <th>Name</th>
          <th>Position
          </th></cfif>

        <cfif parameterexists(form.email)>
          <th>email&nbsp;</th>
        </cfif>
        <cfif parameterexists(form.email_sec)>
          <th>email&nbsp;secretary</th>
        </cfif>
        <cfif parameterexists(form.phone)>
          <th>Phone&nbsp;No</th>
        </cfif>
        <cfif parameterexists(form.fax)>
          <th>Fax&nbsp;No</th>
        </cfif>
        <cfif parameterexists(form.phone_ALT)>
          <th>Phone&nbsp;Alt</th>
        </cfif>
        <cfif parameterexists(form.mobile)>
          <th>mobile&nbsp;</th>
        </cfif>
        <cfif parameterexists(form.address) AND parameterexists(form.pobox) >
          <th>address&nbsp;</th>
          <cfelse>
          <cfif parameterexists(form.address)>
            <th>address&nbsp;</th>
          </cfif>
          <cfif parameterexists(form.pobox)>
            <th>PO Box&nbsp;</th>
          </cfif>
        </cfif>
        <cfif parameterexists(form.country)>
          <td>country&nbsp;</td>
        </cfif>
        <cfif parameterexists(form.comment)>
          <th>Comment&nbsp;</th>
        </cfif>
        <cfif parameterexists(form.Comment_Public)>
          <th>Comment public&nbsp;</th>
        </cfif>
        <cfif parameterexists(form.invoiceNo)>
          <th width="60">Invoice&nbsp;No</th>
        </cfif>
        <cfif form.paid EQ "yes" OR form.paid EQ "no" OR form.paid EQ "all">
          <th width="60">Paid&nbsp;</th>
        </cfif>
        <cfif parameterexists(form.chkCompGuest)>
          <th width="60">3rd guest&nbsp;</th>
        </cfif>
        <cfif parameterexists(form.attend_type)>
          <th width="60">attend type&nbsp;</th>
        </cfif>
        <cfif parameterexists(form.discount)>
          <th width="100"> discounted&nbsp;</th>
        </cfif>
        <!---<cfif parameterexists(form.status)>
          <th width="35">status&nbsp;</th>
        </cfif>--->
      </tr>
      <cfoutput query="get">
      <cfif parameterexists(form.Mailmerge)>
      	<td class="TDdelegate">
      		<span class="words">#Ucase(get.company)#</span>
        </td>
      <cfelse>
      <tr>
        <td colspan="#(fieldcount - 2)#" style="border-bottom:1px solid ##FFFFFF"><span class="words">#Ucase(get.company)#</span></td>
      <tr>
        </cfif><td class="TDdelegate">
			<cfif parameterexists(form.Title)>
            <span class="words">#Ucase(get.Title)#</span></cfif>
          <span class="words">#ucase(get.name)#</span> 
          <span class="words">#ucase(get.surname)#</span><br />
		<cfif parameterexists(form.Mailmerge)>
        </td>
        <td class="TDdelegate">
          </cfif><span class="words">#ucase(ReplaceNoCase(get.possition, '&AMP;', '&'))#</span>
        </td>
        <cfif parameterexists(form.email)>
          <td>#Lcase(get.email)#&nbsp;</td>
        </cfif>
        <cfif parameterexists(form.email_sec)>
          <td>#lcase(get.email_sec)#&nbsp;</td>
        </cfif>
        <cfif parameterexists(form.phone)>
          <td>#get.phone#&nbsp;</td>
        </cfif>
        <cfif parameterexists(form.fax)>
          <td>#get.fax#&nbsp;</td>
        </cfif>
        <cfif parameterexists(form.phone_ALT)>
          <td>#get.phone_ALT#&nbsp;</td>
        </cfif>
        <cfif parameterexists(form.mobile)>
          <td>#get.mobile#&nbsp;</td>
        </cfif>
        <cfif parameterexists(form.address) AND parameterexists(form.pobox) >
          <td><cfif  get.POBOX NEQ "no details - postal address - db">
              #get.POBOX#
              <cfelse>
              #get.address#
            </cfif>
            , #get.zip#, #get.city#&nbsp;</td>
          <cfelse>
          <cfif parameterexists(form.address)>
            <td>#get.address#, #get.zip#, #get.city#&nbsp;</td>
          </cfif>
          <cfif parameterexists(form.pobox)>
            <td>#get.POBOX#&nbsp;</td>
          </cfif>
        </cfif>
        <cfif parameterexists(form.country)>
          <td>#get.country#&nbsp;</td>
        </cfif>
        <cfif parameterexists(form.comment)>
          <td>#get.comment#&nbsp;</td>
        </cfif>
        <cfif parameterexists(form.Comment_Public)>
          <td>#get.Comment_Public#&nbsp;</td>
        </cfif>
        <cfif parameterexists(form.invoiceNo)>
          <td>#get.invoiceNo#&nbsp;</td>
        </cfif>
        <cfif form.paid EQ "yes" OR form.paid EQ "no" OR form.paid EQ "all">
          <td><cfif get.paid EQ "yes">
              Yes
              <cfelse>
              No
            </cfif>&nbsp;</td>
        </cfif>
        <cfif parameterexists(form.chkCompGuest)>
          <td><span id="#get.RegTable_id#" class="isguest">
            <cfif get.chkCompGuest EQ 1 >
              Yes
            </cfif>
            </span>&nbsp;</td>
        </cfif>
        <cfif parameterexists(form.attend_type)>
          <td ><cfif get.chkDelegate EQ 1 >
              delegate
              <cfelseif get.chkSpeaker EQ 1>
              speaker
              <cfelseif get.chkGuest EQ 1>
              guest
              <cfelseif get.chkModerator EQ 1>
              moderator
              <cfelseif get.chkExhibitor EQ 1>
              exhibitor
              <cfelseif get.chkPress EQ 1>
              press
<!---         <cfelseif get.chkResearch EQ 1>
              research--->
              <cfelseif get.chkSponsor EQ 1>
              sponsor
            </cfif></td>
        </cfif>
        <cfif parameterexists(form.discount)>
          <td><span id="#get.RegTable_id#" class="discount">
            <cfif get.discount EQ 1 > Yes
            </cfif></span>&nbsp;</td>
        </cfif>
       <!--- <cfif form.status EQ "C" OR form.status EQ "A">
          <td>#get.status#&nbsp;</td>
        </cfif> ---->
      </tr></cfoutput>
    </table>
  </cfif>
  </CFCONTENT>
  <cfelseif parameterexists(form.external) AND form.external eq "pdf">
  <cfdocument format="pdf" pagetype="A4" marginbottom="0.4" margintop="0.85" marginleft="0.01" marginright="0.01">
  <style type="text/css">
#TableEdit { font-family:Arial, Helvetica, sans-serif; color:#000000; font-size:12px;}
.words {text-transform: capitalize}
td { border-bottom:1px solid #E8E8E8}
th { }
.TDdelegate { width:250px}
</style>
  <cfdocumentitem type="header">
  <table width="100%" border="0" cellpadding="4" cellspacing="1" id="TableEdit" style="font-family:Arial, Helvetica, sans-serif; color:##000000; font-size:12px;font-weight:bold; color:#333333; text-align:left; background-color:#CCCCCC">
    <tr>
      <th align="left"><cfoutput>#get.eventName# <cfif parameterexists(form.count)> <span style="float:right">Count: #get.recordcount#</span></cfif>
        </cfoutput></th>
      <cfif parameterexists(form.email)>
        <th>email&nbsp;</th>
      </cfif>
      <cfif parameterexists(form.email_sec)>
        <th>email&nbsp;secretary</th>
      </cfif>
      <cfif parameterexists(form.phone)>
        <th>Phone&nbsp;No</th>
      </cfif>
      <cfif parameterexists(form.fax)>
        <th>Fax&nbsp;No</th>
      </cfif>
      <cfif parameterexists(form.phone_ALT)>
        <th>Phone&nbsp;Alt</th>
      </cfif>
      <cfif parameterexists(form.mobile)>
        <th>Mobile&nbsp;</th>
      </cfif>
      <cfif parameterexists(form.address) AND parameterexists(form.pobox)>
        <th>Address&nbsp;</th>
        <cfelse>
        <cfif parameterexists(form.address)>
          <th>Address&nbsp;</th>
        </cfif>
        <cfif parameterexists(form.pobox)>
          <th>PO Box&nbsp;</th>
        </cfif>
      </cfif>
      <cfif parameterexists(form.country)>
        <td>Country&nbsp;</td>
      </cfif>
      <cfif parameterexists(form.comment)>
        <th>Comment&nbsp;</th>
      </cfif>
      <cfif parameterexists(form.Comment_Public)>
        <th>Comment public&nbsp;</th>
      </cfif>
      <cfif parameterexists(form.invoiceNo)>
        <th width="60">Invoice&nbsp;No</th>
      </cfif>
      <cfif form.paid EQ "yes" OR form.paid EQ "no" OR form.paid EQ "all">
        <th width="60">Paid&nbsp;</th>
      </cfif>
      <cfif parameterexists(form.chkCompGuest)>
        <th width="60">3rd Guest&nbsp;</th>
      </cfif>
      <cfif parameterexists(form.attend_type)>
        <th width="60">Attendance Type&nbsp;</th>
      </cfif>
      <cfif parameterexists(form.discount)>
        <th width="100">Discounted&nbsp;</th>
      </cfif>
      <!---<cfif form.status EQ "C" OR form.status EQ "A">
        <th width="35">Status&nbsp;</th>
      </cfif> --->
    </tr>
  </table>
  </cfdocumentitem>
  <cfdocumentsection>
  <table width="100%" border="0" cellpadding="4" cellspacing="1" id="TableEdit" style="font-family:Arial, Helvetica, sans-serif; color:##000000; font-size:12px;">
    <cfoutput query="get" group='company'>
    <tr>
      <td colspan="#(fieldcount - 2)#" style="border-bottom:1px solid ##FFFFFF;font-size:15px;"><span class="words"><strong>#Ucase(get.company)#</strong></span></td>
    <tr>
    <cfoutput>
    <td class="TDdelegate" style="border-bottom:1px solid ##E8E8E8"><span class="words">#ucase(get.name)#</span> <span class="words">#ucase(get.surname)#</span><br />
      <span class="words">#ucase(ReplaceNoCase(get.possition, '&AMP;', '&'))#</span></td>
    <cfif parameterexists(form.email)>
      <td style="border-bottom:1px solid ##E8E8E8">#Lcase(get.email)#&nbsp;</td></cfif>
    <cfif parameterexists(form.email_sec)>
      <td style="border-bottom:1px solid ##E8E8E8">#get.email_sec#&nbsp;</td></cfif>
    <cfif parameterexists(form.phone)>
      <td style="border-bottom:1px solid ##E8E8E8">#get.phone#&nbsp;</td></cfif>
      <cfif parameterexists(form.fax)>
      <td style="border-bottom:1px solid ##E8E8E8">#get.fax#&nbsp;</td></cfif>
    <cfif parameterexists(form.phone_ALT)>
      <td style="border-bottom:1px solid ##E8E8E8">#get.phone_ALT#&nbsp;</td></cfif>
    <cfif parameterexists(form.mobile)>
      <td style="border-bottom:1px solid ##E8E8E8">#get.mobile#&nbsp;</td></cfif>
    <cfif parameterexists(form.address) AND parameterexists(form.pobox) >
      <td style="border-bottom:1px solid ##E8E8E8"><cfif  get.POBOX NEQ "no details - postal address - db">
          #get.POBOX#
          <cfelse>
          #get.address#
        </cfif>, #get.zip#, #get.city#&nbsp;</td>
      <cfelse>
      <cfif parameterexists(form.address)>
        <td style="border-bottom:1px solid ##E8E8E8">#get.address#, #get.zip#, #get.city#&nbsp;</td></cfif>
      <cfif parameterexists(form.pobox)>
        <td style="border-bottom:1px solid ##E8E8E8">#get.POBOX#&nbsp;</td></cfif>
    </cfif>
    <cfif parameterexists(form.country)>
      <td style="border-bottom:1px solid ##E8E8E8">#get.country#&nbsp;</td></cfif>
    <cfif parameterexists(form.comment)>
      <td style="border-bottom:1px solid ##E8E8E8">#get.comment#&nbsp;</td></cfif>
    <cfif parameterexists(form.Comment_Public)>
      <td style="border-bottom:1px solid ##E8E8E8">#get.Comment_Public#&nbsp;</td></cfif>
    <cfif parameterexists(form.invoiceNo)>
      <td style="border-bottom:1px solid ##E8E8E8">#get.invoiceNo#&nbsp;</td></cfif>
    <cfif form.paid EQ "yes" OR form.paid EQ "no" OR form.paid EQ "all">
      <td style="border-bottom:1px solid ##E8E8E8"><cfif get.paid EQ "yes">Yes
          <cfelse>No
        </cfif>&nbsp;</td>
    </cfif>
    <cfif parameterexists(form.chkCompGuest)>
      <td style="border-bottom:1px solid ##E8E8E8"><span id="#get.RegTable_id#" class="isguest">
        <cfif get.chkCompGuest EQ 1>Yes</cfif></span>&nbsp;</td>
    </cfif>
    <cfif parameterexists(form.attend_type)>
      <td style="border-bottom:1px solid ##E8E8E8">
	  		<cfif get.chkDelegate EQ 1 >Delegate
          <cfelseif get.chkSpeaker EQ 1>Speaker
          <cfelseif get.chkGuest EQ 1> Guest
          <cfelseif get.chkModerator EQ 1>Moderator
          <cfelseif get.chkExhibitor EQ 1>Exhibitor
          <cfelseif get.chkPress EQ 1>Press
          <!---<cfelseif get.chkResearch EQ 1> Research--->
          <cfelseif get.chkSponsor EQ 1>Sponsor
        </cfif></td>
    </cfif>
    <cfif parameterexists(form.discount)>
      <td style="border-bottom:1px solid ##E8E8E8"><span id="#get.RegTable_id#" class="discount">
        <cfif get.discount EQ 1 >Yes</cfif></span>&nbsp;</td>
    </cfif>
    <!--- <cfif form.status EQ "C" OR form.status EQ "A">
      <td style="border-bottom:1px solid ##E8E8E8">#get.status#&nbsp;</td>
    </cfif> --->
    </tr>
    </cfoutput></cfoutput>
  </table>
  <cfoutput><br/>
  <table width="100%" border="0" cellpadding="4" cellspacing="1" id="TableEdit" style="font-family:Arial, Helvetica, sans-serif; color:##ccc; font-size:10px;">
    <tr>
      <td align=center>Printed on #dateformat(now(), "yyyy-mm-dd")#</td>
    </tr>
  </table>
  </cfoutput>
  </cfdocumentsection>
  <cfdocumentitem type="footer">
  <table width="100%" border="0" cellpadding="4" cellspacing="1" id="TableEdit" style="font-family:Arial, Helvetica, sans-serif; color:##000000; font-size:12px;">
    <tr>
      <td><cfoutput>#dateformat(now(), "dddd, dd, mmmm yyyy")#</cfoutput></td>
    </tr>
  </table>
  </cfdocumentitem>
  </cfdocument>
  
  <cfelseif parameterexists(form.external) AND form.external eq "pdf2">
    <!---<cfinclude template="dsp_col2pdf.cfm">--->
     <cfoutput> <pre>      SELECT 
        	 *
        FROM 
        	[VIEW_Conference_Attendence_list]
        WHERE 
        	[eventId] IN (#form.id#) 
        AND (
         <cfloop list="#form.AttendType#" delimiters="," index="i">
          <cfif counter NEQ 1 > OR </cfif> #i# = 1<cfset counter = counter + 1 >
         </cfloop>
         )
        <cfif form.paid EQ "yes" OR form.paid EQ "no">
        AND (
         <cfif form.paid EQ "no"> paid = 'NO' OR paid IS NULL 
         <cfelse> paid = 'YES'
         </cfif>
          )
        </cfif>
        AND
         (status LIKE '%#form.Status#%' )
        <cfif form.ChkCancelled NEQ "*">
        AND
         (ChkCancelled #form.ChkCancelled#)
         </cfif>
        ORDER BY 
         company</pre></cfoutput>

  <cfelseif parameterexists(form.id)>
  <script type="text/javascript">
 $(document).ready(function() {
<!--- <cfif parameterexists(form.discount)>
    $('.discount').editable('Update_attendence.cfm', { 
    	id  : 'id',
			name : 'chkDiscount',
			submit  : 'OK',
			width	: 30,
     	indicator : '<img src="../img/indicator.gif">',
     	tooltip  : 'Make discount'
   		}); 
</cfif>
<cfif parameterexists(form.chkCompGuest)>
		 $('.isguest').editable('Update_attendence.cfm', { 
    	id  : 'id',
			name : 'chkCompGuest',
			submit  : 'OK',
			width	: 30,
     	indicator : '<img src="../img/indicator.gif">',
     	tooltip  : 'Make guest'
   		}); 
</cfif>--->

});
</script>
  <style type="text/css" media="print">
#TableEdit { font-family:Arial, Helvetica, sans-serif; color:#000000; font-size:12px;}
.words {text-transform: capitalize; font-size:15px;}
td { border-bottom:1px solid #E8E8E8}
th { font-weight:bold; color:#333333; text-align:left; background-color:#CCCCCC}
.TDdelegate { width:250px}
</style>
  <table width="100%" border="0" cellpadding="4" cellspacing="1" id="TableEdit">
    <tr>
      <th><cfoutput>#get.eventName#:<cfif parameterexists(form.count)>
           <span style="float:right">Count: #get.recordcount#</span>
        </cfif></cfoutput></th>
      <cfif parameterexists(form.email)>
        <th>email&nbsp;</th>
      </cfif>
      <cfif parameterexists(form.email_sec)>
        <th>email&nbsp;secretary</th>
      </cfif>
      <cfif parameterexists(form.phone)>
        <th>Phone&nbsp;No</th>
      </cfif>
        <cfif parameterexists(form.fax)>
        <th>Fax&nbsp;No</th>
      </cfif>
      <cfif parameterexists(form.phone_ALT)>
        <th>Phone&nbsp;Alt</th>
      </cfif>
      <cfif parameterexists(form.mobile)>
        <th>mobile&nbsp;</th>
      </cfif>
      <cfif parameterexists(form.address) AND parameterexists(form.pobox)>
        <th>address&nbsp;</th>
        <cfelse>
        <cfif parameterexists(form.address)>
          <th>address&nbsp;</th>
        </cfif>
        <cfif parameterexists(form.pobox)>
          <th>PO Box&nbsp;</th>
        </cfif>
      </cfif>
      <cfif parameterexists(form.country)>
        <th>country&nbsp;</th>
      </cfif>
      <cfif parameterexists(form.comment)>
        <th>Comment&nbsp;</th>
      </cfif>
      <cfif parameterexists(form.Comment_Public)>
        <th>Comment public&nbsp;</th>
      </cfif>
      <cfif parameterexists(form.invoiceNo)>
        <th width="60">Invoice&nbsp;No</th>
      </cfif>
      <cfif form.paid EQ "yes" OR form.paid EQ "no" OR form.paid EQ "all">
        <th width="60">Paid&nbsp;</th>
      </cfif>
      <cfif parameterexists(form.chkCompGuest)>
        <th width="60">3rd guest&nbsp;</th>
      </cfif>
      <cfif parameterexists(form.attend_type)>
        <th width="60">attend type&nbsp;</th>
      </cfif>
      <cfif parameterexists(form.discount)>
        <th width="100"> discounted&nbsp;</th>
      </cfif>
      <!---<cfif parameterexists(form.status)>
        <th width="35">status&nbsp;</th>
      </cfif>--->
    </tr>
    <cfoutput query="get"><tr>
      <td colspan="#(fieldcount - 2)#" style="border-bottom:1px solid ##FFFFFF"><span class="words"><strong>#Ucase(get.company)#</strong></span></td>
    <tr>
      <td class="TDdelegate"><span class="words"> &nbsp; #Lcase(get.name)#</span> <span class="words">#Lcase(get.surname)#</span><br />
        <span class="words">&nbsp; #ucase(ReplaceNoCase(get.possition, '&AMP;', '&'))#</span></td>
      <cfif parameterexists(form.email)>
        <td>#Lcase(get.email)#&nbsp;</td>
      </cfif>
      <cfif parameterexists(form.email_sec)>
        <td>#get.email_sec#&nbsp;</td>
      </cfif>
      <cfif parameterexists(form.phone)>
        <td>#get.phone#&nbsp;</td>
      </cfif>
      <cfif parameterexists(form.phone_ALT)>
        <td>#get.phone_ALT#&nbsp;</td>
      </cfif>
      <cfif parameterexists(form.mobile)>
        <td>#get.mobile#&nbsp;</td>
      </cfif>
      <cfif parameterexists(form.address) AND parameterexists(form.pobox) >
        <td><cfif  get.POBOX NEQ "no details - postal address - db">
            #get.POBOX#
            <cfelse>
            #get.address#</cfif>
          , #get.zip#, #get.city#&nbsp;</td>
        <cfelse>
        <cfif parameterexists(form.address)>
          <td>#get.address#, #get.zip#, #get.city#&nbsp;</td>
        </cfif>
        <cfif parameterexists(form.pobox)>
          <td>#get.POBOX#&nbsp;</td>
        </cfif>
      </cfif>
      <cfif parameterexists(form.country)>
        <td>#get.country#&nbsp;</td>
      </cfif>
      <cfif parameterexists(form.comment)>
        <td>#get.comment#&nbsp;</td>
      </cfif>
      <cfif parameterexists(form.Comment_Public)>
        <td>#get.Comment_Public#&nbsp;</td>
      </cfif>
      <cfif parameterexists(form.invoiceNo)>
        <td>#get.invoiceNo#&nbsp;</td>
      </cfif>
      <cfif form.paid EQ "yes" OR form.paid EQ "no" OR form.paid EQ "all">
        <td><cfif get.paid EQ "yes">Yes<cfelse>
            No</cfif>&nbsp;</td>
      </cfif>
      <cfif parameterexists(form.chkCompGuest)>
        <td><span id="#get.RegTable_id#" class="isguest">
          <cfif get.chkCompGuest EQ 1 >Yes</cfif></span>&nbsp;</td>
      </cfif>
      <cfif parameterexists(form.attend_type)>
        <td><cfif get.chkDelegate EQ 1 >Delegate
          <cfelseif get.chkSpeaker EQ 1>Speaker
          <cfelseif get.chkGuest EQ 1> Guest
          <cfelseif get.chkModerator EQ 1>Moderator
          <cfelseif get.chkExhibitor EQ 1>Exhibitor
          <cfelseif get.chkPress EQ 1>Press
          <!---<cfelseif get.chkResearch EQ 1> Research--->
          <cfelseif get.chkSponsor EQ 1>Sponsor
        </cfif></td>
      </cfif>
      <cfif parameterexists(form.discount)>
        <td><span id="#get.RegTable_id#" class="discount"><cfif get.discount EQ 1 >Yes</cfif></span>&nbsp;</td>
      </cfif>
      <!---<cfif parameterexists(form.status)><td>#get.status#&nbsp;</td></cfif> --->
    </tr>
    </cfoutput>
  </table>
</cfif>
<!--- FROM EXCEL 
<cfquery datasource="#gpp#" name="Get">
	SELECT *
	FROM VIEW_Conference_Attendence_list
	WHERE eventid = <cfqueryparam cfsqltype="cf_sql_integer" value="#form.id#">
	AND (
		<cfloop list="#form.AttendType#" delimiters="," index="i">
			<cfif counter NEQ 1> OR </cfif> #i# = 1<cfset counter = counter + 1 >
		</cfloop>
		)
	ORDER BY 
		company
</cfquery>--->