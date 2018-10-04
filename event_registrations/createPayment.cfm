<cfinclude template="../application.cfm">
<!---<cfset thisYear = year(now())>
<cfset thisMonth = month(now()-120)>
<cfset thisDay = day(now())>
<cfset DateBack = DateFormat(createDate(thisMonth,  thisDay, thisYear ), "mm/dd/yyyy") >AND (event_expire > #DateBack#)--->
<cfquery name=event datasource="#dsnP21#">
   	SELECT id, event_name, event_date, event_type
   	FROM events
	WHERE (event_type = 'Event') OR (event_type = 'EB') OR (event_type = 'DIN') OR (event_type = 'RE') OR (event_type = 'book')
   	ORDER BY event_expire desc
</cfquery>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="../styles/indexV2.css" rel="stylesheet" type="text/css">
<link href="../styles/styles.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../javascript/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>P21</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.t_detail {
	clear:both;
	overflow:hidden;
}
.t_detail .title {
	float:left;
	clear:left;
	color: #335EA8;
	width:213px;
	background-color:#FFFFFF;
	padding:4px;
	margin:2px;
	border:1px solid #EEEEEE;
	border-right:1px solid #AAAAAA;
}
.t_detail .info {
	float:left;
	clear:right;
	width:85px;
	color: #335EA8;
	padding:4px;
	margin:2px;
	border:1px solid #EEEEEE;
}
.t_detail .temp {
	float:left;
	clear:right;
	width:386px;
	color: #335EA8;
	padding:3px;
	margin:2px;
}
.t_detail .name {
	float:left;
	clear:left;
	width:140px;
	color: #335EA8;
	padding:4px;
	margin:2px;
	border:1px solid #EEEEEE;
	border-right:1px solid #AAAAAA;
}
.t_detail .surname {
	float:left;
	clear:right;
	width:140px;
	color: #335EA8;
	padding:4px;
	margin:2px;
	border:1px solid #EEEEEE;
}
.t_detail .email {
	float:left;
	clear:right;
	width:260px;
	color: #335EA8;
	padding:4px;
	margin:2px;
	border:1px solid #EEEEEE;
}
.t_detail .user {
	float:left;
	clear:right;
	width:30px;
	color: #335EA8;
	padding:2px;
	margin:2px;
	border:1px solid #EEEEEE;
}
-->
</style>
</head>
<body>
<cfinclude template="../nav/testNav2009V2.cfm">
<div id="header">Create a Transactions for NetBanx:  -- <span class="header_title">select transaction Method</span></div>
<div id="outer">
  <div id="iner">
    <div style="height:23px; background-image:url(img/menu_back.jpg); padding:1px 20px 1px 20px; width:682px;">
      <div style="float:left; clear:both; width:150px; height:21px; padding:8px 0 0 0; text-align:center; border-right:1px dotted #3f63b7;" onmouseover="this.style.backgroundColor='#cce1fd'; this.style.cursor='hand'" onmouseout="this.style.backgroundColor=''"><a href="createPayment.cfm?action=card">Card&nbsp;Payment </a></div>
      <div style="float:left; width:150px; height:21px; padding:8px 0 0 0; text-align:center; border-right:1px dotted #3f63b7;" onmouseover="this.style.backgroundColor='#cce1fd'; this.style.cursor='hand'" onmouseout="this.style.backgroundColor=''"><a href="conference_registration.cfm?action=user">Registered&nbsp;User</a></div>
      <div style="float:left; width:150px; height:21px; padding:8px 0 0 0; text-align:center; border-right:1px dotted #3f63b7;" onmouseover="this.style.backgroundColor='#cce1fd'; this.style.cursor='hand'" onmouseout="this.style.backgroundColor=''"><a href="createPayment.cfm?action=wire">Card&nbsp;Payment&nbsp;for&nbsp;WT</a></div>
      <div style="float:left; width:150px; height:21px; padding:8px 0 0 0; text-align:center;" onmouseover="this.style.backgroundColor='#cce1fd'; this.style.cursor='hand'" onmouseout="this.style.backgroundColor=''"><a href="../control_econference/newUser.cfm?page=../event_registrations/createPayment.cfm">Add&nbsp;User</a></div>
    </div>
    <!--- Rgisered users --->
    <cfif parameterexists(action)>
      <div style="border:1px solid #666666;width:700px; background-color:#fff; padding:0 10px 0 10px; font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#333333 ">
      <cfif action EQ "user">
        <script language="javascript">
	//new form1 validate
	function checkform()
{
	if (document.form1.gemail.value == '')
	{
		alert('the email field is empty');
		return false;
	}

	else if (document.form1.name.value == '')
	{
		alert('the name field is empty');
		return false;
	}
	else if (document.form1.surname.value == '')
	{
		alert('the surname field is empty');
		return false;
	}
	else if (document.form1.company.value == '')
	{
		alert('the comany field is empty');
		return false;
	}
	else if (document.form1.country.options
[document.form1.country.selectedIndex].value == 1 )
	{
		// something else is wrong
		alert('A country needs to be selected');
		return false;
	}	
		return true;
}
</script>
        <form method="post" action="createPayment.cfm">
          <div class="t_detail">
            <div>
              <div class="title" style=" width:612px; background-color:#FFFFCC" ><b>Step 1</b>: Search for a user</div>
            </div>
          </div>
          <div class="t_detail">
            <div>
              <div class="title">Key word </div>
              <div class="temp" style="background-color:#F4F4F4">
                <input type="text" name="name" style="width:170px"/>
              </div>
            </div>
          </div>
          <div class="t_detail">
            <div>
              <div class="title"></div>
              <div class="temp" style="background-color:#F4F4F4">
                <select name="select" style="width:250px">
                  <option value="surname">Surname</option>
                  <option value="name">Name</option>
                  <option value="emailAddr">Email Address</option>
                  <option value="company">@acompany.com</option>
                </select>
              </div>
            </div>
          </div>
          <div class="t_detail" >
            <div>
              <div class="title" ></div>
              <div class="temp"  style="background-color:#F4F4F4">
                <input type="submit" name="Submit" value="Next">
                <input type="hidden" name="action" value="user">
              </div>
            </div>
          </div>
        </form>
        <!--- start display alll users --->
        <CFIF parameterexists(form.Name)>
          <CFIF IsDefined("url.edit")>
            <cfset select = #url.select#>
            <cfset nameP   =  #url.name#>
            <cfelse>
            <cfset select = #form.select#>
            <cfset nameP   =  #form.name#>
          </CFIF>
          <CFQUERY datasource="#dsnP21#"  Name="result">
 	SELECT id, name, surname, emailAddr FROM email_news
 <cfif select EQ "company" >
 	WHERE emailAddr LIKE  '%#nameP#'
 <cfelse>
	 WHERE #select# =  '#nameP#'
 </cfif>
 	 Order By surname
 </CFQUERY>
          <div class="t_detail" >
            <div>
              <div class="title" style=" width:612px; background-color:#FFFFCC" ><b>Step 2</b>: Select User</div>
            </div>
          </div>
          <cfloop QUERY="result">
          <cfoutput>
          <div class="t_detail" >
            <div style="border:1px solid ##fff;">
              <div class="name" style="background-color:###iif(currentrow MOD 2,DE('FFFFFF'),DE('E8EAFD'))#">#result.name#</div>
              <div class="surname" style="background-color:###iif(currentrow MOD 2,DE('FFFFFF'),DE('E8EAFD'))#">#result.surname#</div>
              <div class="email" style="background-color:###iif(currentrow MOD 2,DE('FFFFFF'),DE('E8EAFD'))#">#result.emailAddr#</div>
              <div class="user" style="background-color:###iif(currentrow MOD 2,DE('FFFFFF'),DE('E8EAFD'))#;color:##993300"><a href="createPayment.cfm?userid=#result.id#&action=user" style="color:##993333">use</a></div>
            </div>
          </div>
          </cfoutput>
          </cfloop>
        </cfif>
        <!--- select events --->
        <CFIF parameterexists(url.userid)>
          <form name="form2" method="post" action="createPayment.cfm">
            <div class="t_detail" >
              <div>
                <div class="title" style=" width:612px; background-color:#FFFFCC"><b>Step 3</b>: Select Events for
                  <input type="hidden" name="action" value="user"> transaction</div>
              </div>
            </div>
            <cfloop QUERY="event">
            <cfoutput>
            <div class="t_detail" >
              <div style="border:1px solid ##fff;">
                <div class="title" style="background-color:###iif(currentrow MOD 2,DE('FFFFFF'),DE('E8EAFD'))#">#event_name#</div>
                <div class="surname" style="background-color:###iif(currentrow MOD 2,DE('FFFFFF'),DE('E8EAFD'))#">#event_date#
                  <input type="hidden" name="#id#" value="#event_name#" />
                </div>
                <div class="email"style="background-color:###iif(currentrow MOD 2,DE('FFFFFF'),DE('E8EAFD'))#"></div>
                <div class="user" style="background-color:###iif(currentrow MOD 2,DE('FFFFFF'),DE('E8EAFD'))#">
                  <input type="checkbox" name="id" value="#id#">
                </div>
              </div>
            </div>
            </cfoutput>
            </cfloop>
            <div class="t_detail">
              <div>
                <div class="title"></div>
                <div class="temp" style="background-color:#F4F4F4">
                  <input type="submit" name="Submit" value="Submit">
                  <input type="hidden" name="userid" value="<cfoutput>#url.userid#</cfoutput>">
                </div>
              </div>
            </div>
          </form>
        </cfif>
        <!--- user details pane --->
        <CFIF parameterexists(form.id)>
          <CFQUERY datasource="#dsnP21#" Name="showuser">
 Select *
 From email_news
 WHERE id =  #userid#
</CFQUERY>
          <form name="form1" method="post" action="createPaymentSend.cfm" onSubmit="return checkform()">
            <div class="t_detail" >
              <div>
                <div class="title" style=" width:612px; background-color:#FFFFCC"><b>Step 4</b>: User details, select Card / WireTransfer for transaction</div>
              </div>
            </div>
            <div class="t_detail">
              <div >
                <div class="title" >Title</div>
                <div class="temp" style="background-color:#F4F4F4">
                  <select name="title" style="width:170px"><cfif showuser.title EQ "">
                      <option value="Mr" selected>Mr</option>
                      <cfelse>
                      <option value="<cfoutput>#showuser.title#</cfoutput>" selected>
                      <cfoutput>#showuser.title#</cfoutput>
                      </option>
                    </cfif>
                    <option value="Mr">Mr</option>
                    <option value="Mrs">Mrs</option>
                    <option value="Ms">Ms</option>
                    <option value="Dr">Dr</option>
                  </select>
                  <cfif isDefined("form.id")>
                    <cfset event = "" >
                    <cfset cost = 0 >
                    <cfloop list="#form.id#" index="i">
                    <cfquery name=getname datasource="#dsnP21#"   >
   					SELECT id, event_name, event_cost_us, event_type
   					FROM events
					WHERE id = #i#
  				</cfquery>
                    <cfset cost = getname.event_cost_us + cost >
                    <cfset event = getname.event_name & "/" & getname.event_type & "," & event >
                    </cfloop>
                  </cfif>
                </div>
              </div>
            </div>
            <div class="t_detail">
              <div >
                <div class="title">First Name</div>
                <div class="temp" style="background-color:#F4F4F4">
                  <input name="name" type="text" id="name" value="<cfoutput>#showuser.name#</cfoutput>" style="width:170px">
                </div>
              </div>
            </div>
            <div class="t_detail">
              <div >
                <div class="title">Surname</div>
                <div class="temp" style="background-color:#F4F4F4">
                  <input name="surname" type="text" id="surname" value="<cfoutput>#showuser.surname#</cfoutput>" style="width:170px">
                </div>
              </div>
            </div>
            <div class="t_detail">
              <div>
                <div class="title">Company</div>
                <div class="temp" style="background-color:#F4F4F4">
                  <input name="company" type="text" id="company" value="<cfoutput>#showuser.company#</cfoutput>" style="width:170px">
                </div>
              </div>
            </div>
            <div class="t_detail">
              <div >
                <div class="title">Email</div>
                <div class="temp" style="background-color:#F4F4F4">
                  <input type="text" name="gemail" value="<cfoutput>#showuser.emailaddr#</cfoutput>" style="width:170px" />
                </div>
              </div>
            </div>
            <div class="t_detail">
              <div>
                <div class="title">Country</div>
                <div class="temp" style="background-color:#F4F4F4">
                  <cfinclude template="../components/country.cfm">
                </div>
              </div>
            </div>
            <div class="t_detail">
              <div >
                <div class="title">Transaction type</div>
                <div class="temp" style="background-color:#F4F4F4">
                  <select name="Transtype" style="width:170px">
                    <option value="netbanx" selected>NetBanx</option>
                    <option value="WT">WireTransfer</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="t_detail">
              <div >
                <div class="title">Payment Reference</div>
                <div class="temp" style="background-color:#F4F4F4">
                  <input name="paymentReference"  type="text" maxlength="10" style="width:170px" />
                </div>
              </div>
            </div>
            <div class="t_detail" >
              <div >
                <div class="title">VAT Reg no</div>
                <div class="temp" style="background-color:#F4F4F4">
                  <input type="text" name="vatreg" style="width:170px" />
                </div>
              </div>
            </div>
            <div class="t_detail">
              <div >
                <div class="title">Amount to pay in GBP</div>
                <div class="temp" style="background-color:#F4F4F4">
                  <input type="text" name="payment_amount_GBP" value="<cfoutput>#cost#</cfoutput>" style="width:170px" />
                  <input type="hidden" name="currency" value="GBP">
                  No VAT calculation(price should be checked)</div>
              </div>
            </div>
            <div class="t_detail">
              <div >
                <div class="title">
                  <input type="hidden" name="event" value="<cfoutput>#event#</cfoutput>">
                  <cfset Pid = (CFTOKEN & (RandRange(1000, 9999)))>
                  <input type="hidden" name="Pid" value="<cfoutput>#Pid#</cfoutput>">
                  <input type="hidden" name="netbanx_reference" value="<cfoutput>#Left(trim(event), 3)##Pid#</cfoutput>">
                  <input type="hidden" name="eventid" value="<cfoutput>#id#</cfoutput>">
                  <input type="hidden" name="userid" value="<cfoutput>#userid#</cfoutput>">
                </div>
                <div class="temp" style="background-color:#F4F4F4">
                  <input type="submit" name="Submit4" value="submit transaction" onclick="checkForm()" />
                </div>
              </div>
            </div>
          </form>
        </CFIF>
        <!--- end --->
      </cfif>
      <!--- card payment -------->
      <cfif action EQ "card">
        <script language="javascript">
	//new form1 validate
	function checkform()
{
	if (document.form1.gemail.value == '')
	{
		alert('the email field is empty');
		return false;
	}

		else if (document.form1.currency.options
[document.form1.currency.selectedIndex].value != 'GBP' && document.form1.eventcostGBP.value == '')
	{
		// something else is wrong
		alert('Amount to pay in GBP is empty, you have selected the currency to not be in GBP');
		return false;
	}
		return true;
}
</script>
        <form name="form1" method="post" action="createPaymentSend.cfm" onSubmit="return checkform()">
          <div class="t_detail">
            <div>
              <div class="title" style="width:612px; background-color:#FFFFCC">Netbanx card Transaction, not for Event registration.</div>
            </div>
          </div>
          <div class="t_detail">
            <div>
              <div class="title">Description</div>
              <div class="temp" style="background-color:#F4F4F4">
                <select name="Event" style="width:250px">
                  <option value="card transaction/RE" selected="selected">card transaction</option>
                  <option value="" selected="selected"></option>
                  <option value="" selected="selected">---- Events ----</option>
                  <cfoutput query=event>
                  <cfif event.event_type EQ "event">
                    <option value="#event_name#/#event_type#">#event_name#</option>
                  </cfif>
                  </cfoutput>
                  <option value="" selected="selected"></option>
                  <option value="" selected="selected">---- Breifings ----</option>
                  <cfoutput query=event>
                  <cfif event.event_type EQ "EB">
                    <option value="#event_name#/#event_type#">#event_name#</option>
                  </cfif>
                  </cfoutput>
                  <option value="" selected="selected"></option>
                  <option value="" selected="selected">---- Dinners ----</option>
                  <cfoutput query=event>
                  <cfif event.event_type EQ "DIN">
                    <option value="#event_name#/#event_type#">#event_name#</option>
                  </cfif>
                  </cfoutput>
                  <option value="" selected="selected"></option>
                  <option value="" selected="selected">---- Books ----</option>
                  <cfoutput query=event>
                  <cfif event.event_type EQ "book">
                    <option value="#event_name#/#event_type#">#event_name#</option>
                  </cfif>
                  </cfoutput>
                </select>
              </div>
            </div>
          </div>
          <div class="t_detail" >
            <div>
              <div class="title">Title</div>
              <div class="temp" style="background-color:#F4F4F4">
                <select name="title" style="width:170px">
                  <option value="Mr" selected >Mr</option>
                  <option value="Mrs">Mrs</option>
                  <option value="Ms">Ms</option>
                  <option value="Dr">Dr</option>
                </select>
              </div>
            </div>
          </div>
          <div class="t_detail" >
            <div>
              <div class="title" >First Name</div>
              <div class="temp" style="background-color:#F4F4F4">
                <input name="name" type="text" class="fadedreg" style="width:170px">
              </div>
            </div>
          </div>
          <div class="t_detail" >
            <div>
              <div class="title">Surname</div>
              <div class="temp" style="background-color:#F4F4F4">
                <input name="surname" type="text" class="fadedreg" style="width:170px">
              </div>
            </div>
          </div>
          <div class="t_detail" >
            <div>
              <div class="title">Company</div>
              <div class="temp" style="background-color:#F4F4F4">
                <input name="company" type="text" class="fadedreg" style="width:170px">
              </div>
            </div>
          </div>
          <div class="t_detail" >
            <div>
              <div class="title">Email</div>
              <div class="temp" style="background-color:#F4F4F4">
                <input type="text" name="gemail" style="width:170px" />
              </div>
            </div>
          </div>
          <div class="t_detail">
            <div >
              <div class="title">Country</div>
              <div class="temp" style="background-color:#F4F4F4; width:170px">
                <cfinclude template="../components/country.cfm">
              </div>
            </div>
          </div>
          <div class="t_detail">
            <div>
              <div class="title">Amount to pay in GBP</div>
              <div class="temp" style="background-color:#F4F4F4">
                <input type="text" name="payment_amount_GBP" style="width:170px" />
                <input type="hidden" name="currency" value="GBP">
                No VAT calculation done here.. </div>
            </div>
          </div>
          <div class="t_detail">
            <div>
              <div class="title">Payment Reference</div>
              <div class="temp" style="background-color:#F4F4F4">
                <input name="paymentReference" type="text" maxlength="10" style="width:170px" />
              </div>
            </div>
          </div>
          <div class="t_detail">
            <div>
              <div class="title" >
                <cfset Pid = (CFTOKEN & (RandRange(1000, 9999)))>
                <input type="hidden" name="Pid" value="<cfoutput>#Pid#</cfoutput>"	>
                <input type="hidden" name="netbanx_reference" value="<cfoutput>#Left(RandRange(1000, 9999), 3)##Pid#</cfoutput>">
                <input type="hidden" name="eventid" value="">
                <input type="hidden" name="userid" value="">
                <input type="hidden" name="vatreg" value=""/>
                <input type="hidden" name="Transtype" value="trans" />
              </div>
              <div class="temp" style="background-color:#F4F4F4">
                <input type="submit" name="Submit42" value="submit transaction" onclick="checkForm()" />
              </div>
            </div>
          </div>
        </form>
        </div>
      </cfif>
      <cfif action EQ "wire">
        <!--- wires orders --->
        <cfquery name="getWT" datasource="#dsnP21#"  >
			select id, name, surname, netbanx_reference 
            FROM registrations 
            WHERE transType = 'wire' 
            AND approved = 0 
            ORDER BY id desc
		</cfquery>
        <form name="form1" method="post" action="createPayment.cfm"   onSubmit="return checkform()">
          <div class="t_detail" >
            <div>
              <div class="title" style=" width:612px; background-color:#FFFFCC" >Step 1: Find Wiretransfer transaction. </div>
            </div>
          </div>
          <div class="t_detail">
            <div>
              <div class="title" >Find transaction
                <input type="hidden" name="action" value="wire">
              </div>
              <div class="temp"  style="background-color:#F4F4F4">
                <select name="id">
                  <cfloop query="getWT">
                  <cfoutput>
                  <option value="<cfoutput>#id#">#name# #surname# (#netbanx_reference#)</option>
                  </cfoutput>
                  </cfoutput>
                  </cfloop>
                </select>
                <input type="submit" name="Submit32" value="Submit" />
              </div>
            </div>
          </div>
        </form>
        <cfif parameterexists(id)>
          <cfquery name="showWT" datasource="#dsnP21#">
select * FROM registrations WHERE id = #form.id#
</cfquery>
          <form name="form1" method="post" action="createPaymentSend.cfm" onSubmit="return checkform()">
            <div class="t_detail">
              <div>
                <div class="title" style="width:612px; background-color:#FFFFCC">Step 2: Confirm User and go to Netbanx</div>
              </div>
            </div>
            <div class="t_detail">
              <div>
                <div class="title">client</div>
                <div class="temp" style="background-color:#F4F4F4">
                  <cfoutput>#showWT.title# #showWT.name# #showWT.surname#</cfoutput>
                </div>
              </div>
            </div>
            <div class="t_detail">
              <div>
                <div class="title">Company</div>
                <div class="temp" style="background-color:#F4F4F4">
                  <cfoutput>#showWT.company#</cfoutput>
                </div>
              </div>
            </div>
            <div class="t_detail">
              <div>
                <div class="title">Country</div>
                <div class="temp" style="background-color:#F4F4F4">
                  <cfoutput>#showWT.country#</cfoutput>
                </div>
              </div>
            </div>
            <div class="t_detail" >
              <div>
                <div class="title">Email</div>
                <div class="temp" style="background-color:#F4F4F4">
                  <cfoutput>#showWT.gemail#</cfoutput>
                </div>
              </div>
            </div>
            <div class="t_detail">
              <div>
                <div class="title">Registered for the following events</div>
                <div class="temp" style="background-color:#F4F4F4">
                  <cfoutput>#showWT.event#</cfoutput>
                </div>
              </div>
            </div>
            <div class="t_detail">
              <div >
                <div class="title">Amount to pay</div>
                <div class="temp" style="background-color:#F4F4F4">
                  <cfoutput>#showWT.payment_amount_GBP#</cfoutput>
                  GBP </div>
              </div>
            </div>
            <div class="t_detail" >
              <div>
                <div class="title">Payment Reference:</div>
                <div class="temp" style="background-color:#F4F4F4">
                  <input name="paymentReference"  type="text" maxlength="10" />
                </div>
              </div>
            </div>
            <div class="t_detail" >
              <div>
                <div class="title" >
                  <!--- <cfset Pid = (CFTOKEN & (RandRange(1000, 9999)))> --->
                  <cfoutput>
                  <input type="hidden" name="Pid" value="#showWT.Pid#"	>
                  <input type="hidden" name="netbanx_reference" value="">
                  <input type="hidden" name="vatreg" value=""/>
                  <input type="hidden" name="Transtype" value="card" />
                  <input type="hidden" name="title" value="#showWT.title#">
                  <input type="hidden" name="name" value="#showWT.name#">
                  <input type="hidden" name="surname" value="#showWT.surname#">
                  <input type="hidden" name="company" value="#showWT.company#">
                  <input type="hidden" name="gemail" value="#showWT.gemail#">
                  <input type="hidden" name="country" value="#showWT.country#">
                  <input type="hidden" name="event" value="#showWT.event#">
                  <input type="hidden" name="eventid" value="#showWT.eventid#">
                  <input type="hidden" name="userid" value="#showWT.userid#">
                  <input type="hidden" name="payment_amount_GBP" value="#showWT.payment_amount_GBP#">
                  <input type="hidden" name="id" value="#showWT.id#">
                  </cfoutput>
                </div>
                <div class="temp" style="background-color:#F4F4F4">
                  <input type="submit" name="Submit42" value="submit transaction" onclick="checkForm()" />
                </div>
              </div>
            </div>
          </form>
        </cfif>
      </cfif>
    </cfif>
  </div>
</div>
</body>
</html>