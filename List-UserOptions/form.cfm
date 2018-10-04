<cfparam name="form.id" default="0">
<cfinclude template="../Application.cfm">
<!---<cfset AttendTypeCount = ListLen(form.AttendType, "," )>--->
<CFSET fieldcount = 0 >
<cfset counter = 1 >
<!--- COUNT THE FIELDS FOR THE COLUMNS COUNT TABLE --->
    <cfloop collection="#form#" item="fname">
    <cfset fieldcount = fieldcount + 1>
    </cfloop>
<cfparam name="get.eventName" default="search result">



<cfif  parameterexists(form.countryID)  OR parameterexists(form.industrySector) >
<cfset indSec = 1>
	<cfquery datasource="#gpp#" name="get">
    SELECT *
    FROM
    	[CRM_Report_User_Country]
    WHERE 
	1=1
        
        <cfif parameterexists(form.countryID) AND form.countryID NEQ "">
        AND
    	[countryID] IN (#form.countryID#)
        </cfif>
        <cfif parameterexists(form.industrySector) AND form.industrySector NEQ "">
        AND
        (

        	<cfloop list="#form.industrySector#" delimiters="," index="i">
            	<cfif indSec NEQ 1>
                	OR
                </cfif>
                	#i# = 1
             <cfset indSec = indSec +1>
            </cfloop>
        	
        )
        </cfif>
<!---        AND
        	(
            
            address <> 'no details - street address - db' AND POBOX <> 'no details - postal address - db'
            
            )--->
    
    </cfquery>





</cfif>












<!--- END QUERY -------->
<cfif parameterexists(form.external) AND form.external eq "excel">
  <CFHEADER NAME="Content-Disposition" VALUE="inline; filename=output_#dateformat(now(), "yyyy-mm-dd")#.xls">
  <CFCONTENT TYPE="application/vnd.msexcel">
  <!---- CREATE EXCEL FOR BADGES --->
  <cfif parameterexists(form.badge) >
    <cftable query ="get"  HTMLTable colheaders>

    <cfcol text = "#Ucase(get.name)#">
    <cfcol text = "#ucase(get.surname)#">
    <cfcol text="#Ucase(get.possition)#">
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
    <cfif parameterexists(form.phone_ALT)>
      <cfcol text = "#get.phone_ALT#">
    </cfif>
    <cfif parameterexists(form.mobile)>
      <cfcol text = "#get.mobile#">
    </cfif>
    
    <cfif parameterexists(form.address)>
    	<cfif get.POBOX EQ "no details - postal address - db">
      <cfcol text = "#get.Address#">
      	<cfelse>
      <cfcol text = "#get.POBOX#">
      	</cfif>
      <cfcol text = "#get.zip#">
      <cfcol text = "#get.city#">
    </cfif>

    
<!---    <cfif parameterexists(form.pobox)>
      <cfcol text = "#get.POBOX#">
    </cfif>--->
    <cfif parameterexists(form.country)>
      <cfcol text = "#get.country#">
    </cfif>
    <cfif parameterexists(form.comment)>
      <cfcol text = "#get.comment#">
    </cfif>
    <cfif parameterexists(form.invoiceNo)>
      <cfcol text = "#get.invoiceNo#">
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
    <!---- CREATE EXCEL ------>
    <cfelse>
    <table width="100%" border="0" cellpadding="4" cellspacing="1" id="TableEdit">
      <tr >
        <th><cfoutput>#get.eventName#:
          <cfif parameterexists(form.count)>
            Count #get.recordcount#
          </cfif>
        </th>
          </cfoutput>

          <th>id</th>
          <th>Name           </th>
          <th>SurName           </th>
          <th>Position           </th>
          <th>Company</th>
          
          
        
        <cfif parameterexists(form.email)>
          <th>email&nbsp;</th>
        </cfif>
        <cfif parameterexists(form.email_sec)>
          <th>email&nbsp;secretary</th>
        </cfif>
        <cfif parameterexists(form.phone)>
          <th>Phone&nbsp;No</th>
        </cfif>
        <cfif parameterexists(form.phone_ALT)>
          <th>Phone&nbsp;Alt</th>
        </cfif>
        <cfif parameterexists(form.mobile)>
          <th>mobile&nbsp;</th>
        </cfif>

          <cfif parameterexists(form.address)>
            <th>address&nbsp;</th>
            <th> zip&nbsp;</th>
            <th>city&nbsp;</th>
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
      <!---<cfif parameterexists(form.Mailmerge)>
      	<td class="TDdelegate">
      		<span class="words">#Ucase(get.company)#</span>
        </td>
      <cfelse>
      
      <tr>
        <td colspan="#(fieldcount - 2)#" style="border-bottom:1px solid ##FFFFFF"><span class="words">#Ucase(get.company)#</span></td>
      <tr>
      
      	
        
        </cfif>
		<td class="TDdelegate">
			<cfif parameterexists(form.Title)>
            <span class="words">#Ucase(get.Title)#</span>
            </cfif>--->
          <td><span class="words">#ucase(get.userID)#</span></td>
          <td><span class="words">#ucase(get.name)#</span></td> 
         <td> <span class="words">#ucase(get.surname)#</span></td>
         <td><span class="words">#Ucase(get.company)#</span></td>
        
	<!---	<cfif parameterexists(form.Mailmerge)>
        </td>
        <td class="TDdelegate"> </cfif>--->
        
        <td><span class="words">#ucase(get.possition)#</span>
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
        <cfif parameterexists(form.phone_ALT)>
          <td>#get.phone_ALT#&nbsp;</td>
        </cfif>
        <cfif parameterexists(form.mobile)>
          <td>#get.mobile#&nbsp;</td>
        </cfif>
        
          <cfif parameterexists(form.address)>
            <td><cfif get.POBOX EQ "no details - postal address - db">#get.address#<cfelse>#get.POBOX#</cfif>&nbsp;</td>
            <td> #get.zip#&nbsp;</td>
            <td>#get.city#&nbsp;</td>
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
<!---              <cfelseif get.chkResearch EQ 1>
              research--->
              <cfelseif get.chkSponsor EQ 1>
              sponsor
            </cfif></td>
        </cfif>
        <cfif parameterexists(form.discount)>
          <td><span id="#get.RegTable_id#" class="discount">
            <cfif get.discount EQ 1 >
              Yes
            </cfif>
            </span>&nbsp;</td>
        </cfif>
       <!--- <cfif form.status EQ "C" OR form.status EQ "A">
          <td>#get.status#&nbsp;</td>
        </cfif> ---->
      </tr>
      </cfoutput>
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
      <th><cfoutput>#get.eventName#:
        <cfif parameterexists(form.count)>
          - Count: #get.recordcount#
        </cfif>
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
      <cfif parameterexists(form.phone_ALT)>
        <th>Phone&nbsp;Alt</th>
      </cfif>
      <cfif parameterexists(form.mobile)>
        <th>Mobile&nbsp;</th>
      </cfif>

        <cfif parameterexists(form.address)>
          <th>Address&nbsp;</th>
          <th>Zip&nbsp;</th>
          <th>City&nbsp;</th>
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
      <span class="words">#ucase(get.possition)#</span></td>
    <cfif parameterexists(form.email)>
      <td style="border-bottom:1px solid ##E8E8E8">#Lcase(get.email)#&nbsp;</td></cfif>
    <cfif parameterexists(form.email_sec)>
      <td style="border-bottom:1px solid ##E8E8E8">#get.email_sec#&nbsp;</td></cfif>
    <cfif parameterexists(form.phone)>
      <td style="border-bottom:1px solid ##E8E8E8">#get.phone#&nbsp;</td></cfif>
    <cfif parameterexists(form.phone_ALT)>
      <td style="border-bottom:1px solid ##E8E8E8">#get.phone_ALT#&nbsp;</td></cfif>
    <cfif parameterexists(form.mobile)>
      <td style="border-bottom:1px solid ##E8E8E8">#get.mobile#&nbsp;</td></cfif>
    
	
	
      <cfif parameterexists(form.address)>
        <td style="border-bottom:1px solid ##E8E8E8"><cfif get.POBOX EQ "no details - postal address - db">#get.address#<cfelse>#get.POBOX#</cfif> &nbsp;</td>
                <td style="border-bottom:1px solid ##E8E8E8">#get.zip#&nbsp;</td>
        <td style="border-bottom:1px solid ##E8E8E8">#get.city#&nbsp;</td></cfif>

<!---      <cfif parameterexists(form.pobox)>
        <td style="border-bottom:1px solid ##E8E8E8">#get.POBOX#&nbsp;</td>
    </cfif>
--->
    
    <cfif parameterexists(form.country)>
      <td style="border-bottom:1px solid ##E8E8E8">#get.country#&nbsp;</td></cfif>
    <cfif parameterexists(form.comment)>
      <td style="border-bottom:1px solid ##E8E8E8">#get.comment#&nbsp;</td></cfif>
    <cfif parameterexists(form.Comment_Public)>
      <td style="border-bottom:1px solid ##E8E8E8">#get.Comment_Public#&nbsp;</td></cfif>
    <cfif parameterexists(form.invoiceNo)>
      <td style="border-bottom:1px solid ##E8E8E8">#get.invoiceNo#&nbsp;</td></cfif>

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
  </cfdocumentitem >
  </cfdocument>
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
          - Count: #get.recordcount#
        </cfif></cfoutput></th>
        <th>id</th>
        <th>name</th>
        <th>surname</th>
        <th>possition</th>
      <cfif parameterexists(form.email)>
        <th>email&nbsp;</th>
      </cfif>
      <cfif parameterexists(form.email_sec)>
        <th>email&nbsp;secretary</th>
      </cfif>
      <cfif parameterexists(form.phone)>
        <th>Phone&nbsp;No</th>
      </cfif>
      <cfif parameterexists(form.phone_ALT)>
        <th>Phone&nbsp;Alt</th>
      </cfif>
      <cfif parameterexists(form.mobile)>
        <th>mobile&nbsp;</th>
      </cfif>
      
	  
	  <cfif parameterexists(form.address)>
          <th><cfif get.POBOX EQ "no details - postal address - db">address<cfelse>POBOX</cfif></th>
          <th> zip</th>
          <th> city&nbsp;</th>
     </cfif>
     
     
        
<!---      <cfif parameterexists(form.pobox)>
          <th>#get.POBOX#&nbsp;</th>
        </cfif>--->
      <cfif parameterexists(form.country)>
        <th>#get.country#&nbsp;</th>
      </cfif>
      
<!---      <cfif parameterexists(form.address) AND parameterexists(form.pobox)>
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
      </cfif>--->
      <cfif parameterexists(form.comment)>
        <th>Comment&nbsp;</th>
      </cfif>
      <cfif parameterexists(form.Comment_Public)>
        <th>Comment public&nbsp;</th>
      </cfif>
      <cfif parameterexists(form.invoiceNo)>
        <th width="60">Invoice&nbsp;No</th>
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
	<tr>
	<!---colspan="#(fieldcount - 2)#"---> style="border-bottom:1px solid ##FFFFFF" class="TDdelegate"><td <!---colspan="#(fieldcount - 2)#"---> style="border-bottom:1px solid ##FFFFFF" class="TDdelegate"><span class="words"><strong>#Ucase(get.company)#</strong></span></td>

      <td class="TDdelegate">#get.userID#</td>
      <td class="TDdelegate">
      			<span class="words"> &nbsp; #Lcase(get.name)#</span> </td>
         <td class="TDdelegate">
         		<span class="words">#Lcase(get.surname)#</span></td>
            <td class="TDdelegate">
        		<span class="words"> &nbsp; #Lcase(get.possition)#</span>
      </td>
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
     
     
       
        <cfif parameterexists(form.address)>
          <td>#get.address#,</td>
          <td> #get.zip#,</td>
          <td> #get.city#&nbsp;</td>
     </cfif>
     
     
        
<!---      <cfif parameterexists(form.pobox)>
          <td>#get.POBOX#&nbsp;</td>
        </cfif>--->
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

      <cfif parameterexists(form.chkCompGuest)>
        <td><span id="#get.RegTable_id#" class="isguest">
          <cfif get.chkCompGuest EQ 1 >Yes</cfif></span>&nbsp;</td>
      </cfif>
      <cfif parameterexists(form.attend_type)>
        <td ><cfif get.chkDelegate EQ 1 >Delegate
          <cfelseif get.chkSpeaker EQ 1>Speaker
          <cfelseif get.chkGuest EQ 1> Guest
          <cfelseif get.chkModerator EQ 1>Moderator
          <cfelseif get.chkExhibitor EQ 1>Exhibitor
          <cfelseif get.chkPress EQ 1>Press
          <cfelseif get.chkSponsor EQ 1>Sponsor
        </cfif></td>
      </cfif>
      <cfif parameterexists(form.discount)>
        <td><span id="#get.RegTable_id#" class="discount"><cfif get.discount EQ 1 >Yes</cfif></span>&nbsp;</td>
      </cfif>

    </tr>
    </cfoutput>
  </table>
</cfif>





<!---  <!---  <tr>--->
      <!---colspan="#(fieldcount - 2)#"---> style="border-bottom:1px solid ##FFFFFF" class="TDdelegate"><!---colspan="#(fieldcount - 2)#"---> style="border-bottom:1px solid ##FFFFFF" class="TDdelegate"><!---colspan="#(fieldcount - 2)#"---> style="border-bottom:1px solid ##FFFFFF" class="TDdelegate">--->