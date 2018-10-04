<cfinclude template="../Application.cfm">

<CFPARAM name=qry_event_edit.groupby default=0>

<cfif parameterexists(form.event_name)>
<cfquery datasource="#dsnP21#"   >
   Insert into events(event_name, event_abbr, event_year, event_type, event_expire, groupby, event_loc_country, last_updated )
   Values('#form.event_name#', '#UCASE(form.event_abbr)#', '#form.event_year#', '#form.event_type#', <cfqueryparam value="#form.event_expire#" cfsqltype="cf_sql_date">, #form.groupby#, '#form.event_loc_country#', cfqueryparam cfsqltype="cf_sql_date" value="#now()#" >)
</cfquery>

<!---<CFHTTP URL="http://www.petro21.com/my-office/events/indexCreate.cfm" METHOD="Get"></CFHTTP> 
<CFFILE ACTION="WRITE" FILE="G:\websites\my-office\events\index.cfm" OUTPUT="#CFHTTP.FileContent#" NAMECONFLICT="overwrite">--->
</cfif>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>Petro21.com / admin / events </title>

<style type="text/css">
<!--
.header{clear:both;border-bottom:1px solid #539ad2; font-weight:bold; height:20px; margin:17px 2px 3px 2px; padding:4px 0 0 4px; color:#539ad2; vertical-align:bottom;}
.row{
	clear:both;
	overflow:hidden;
	margin:0px;
}
.row .icon {
	float:left;
	clear:left;
	width:20px;
	padding:2px;
	margin:0px;	
	
}

.row .abre {
	float:left;
	clear:right;
	width:104px;
	padding:2px;
	margin:0px;
	border-bottom:solid 1px #F2F2F2;

}
.row .name {
	float:left;
	clear:right;
	width:252px;
	padding:0px;
	margin:0px;
}

.row .date {
	float:left;
	clear:right;
	width:84px;
	padding:2px;
	margin:0px;
}
.row .update {
	float:left;
	clear:right;
	width:79px;
	padding:2px;
	margin:0px;
	border-bottom:solid 1px #F2F2F2;
}
.row .econf {
	float:left;
	clear:right;
	width:31px;
	padding:2px;
	margin:0px;
	border-bottom:solid 1px #F2F2F2;
}
.row .del {
	float:left;
	clear:right;
	width:20px;
	padding:2px;
	margin:0px;
	
}

-->
</style>
	<script type='text/JavaScript' src='../javascript/scw.js'></script>

</head>
<!--- ; window.parent.location.reload(true); --->
<link rel="stylesheet" href="../img/p21-gry.css" type="text/css" mcedia="screen" title="grey" />
<body <cfif parameterexists(form.event_name)>onload="javascript:parent.window.hs.closeId('event')"</cfif>>


<FORM name="form" METHOD=POST ACTION="add_event.cfm">
		<div class="header">New Events</div>
		<div class="row" >	 
			<div>
  				<div class="icon"><a href=""></a></div>
  				<div class="name"></div> 
			</div>
		</div>
			<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"></div> 
				<div class="abre" >Event Name</div>
  				<div class="name"><input type="TEXT" name="event_name" maxlength=120 /></div> 
				<div class="date" ></div>
			  </div>
			</div>
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"></div> 
				<div class="abre" >Event group</div>
  				<div class="name"><cfinclude template="../groupby.cfm"> </div> 
				<div class="date" ></div>
		  </div>
		</div>            
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href=""></a></div> 
				<div class="abre" >Event abrev</div>
  				<div class="name"><input type="TEXT" name="event_abbr" maxlength=15  value="" /></div> 
				<div class="date" ></div>
		  </div>
		</div>
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href=""></a></div> 
				<div class="abre" >Event Type</div>
  				<div class="name"><select name="event_type" class="label">
                    <option value="Week" >Oil Week</option>
                    <option value="Event" >Event</option>
                    <option value="EB" >Briefing</option>
					<option value="DIN" >Dinner</option>
                    <option value="book" >Books</option>
                    <option value="CLUB" >Club</option>
                    <option value="Advis" >Advisory</option>
                    <option value="CM" >Content Management</option>
                  </select>	</div> 
				<div class="date" ></div>
		  </div>
		</div>
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href=""></a></div> 
				<div class="abre" >Event Year </div>
  				<div class="name"><input type="TEXT" name="event_year" maxlength=4 size=4 value="<cfoutput>#dateformat(datenow + 160, 'YYYY')#</cfoutput>" /></div> 
				<div class="date" ></div>
		  </div>
		</div>
        		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href=""></a></div> 
				<div class="abre" >Event Country </div>
  				<div class="name"><CF_dsp_country Add_Text="Country" Add_value=1 Optionvalue=2  selectname="event_loc_country" ></div> 
				<div class="date" ></div>
		  </div>
		</div>
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href=""></a></div> 
				<div class="abre" >Expire Date </div>
			  <div class="name"><input type="TEXT" name="event_expire" maxlength=20 size=10 value="<cfoutput>#dateformat(datenow + 160, 'MM dd YYYY')#</cfoutput>" /> 
			    <img src="../img/calendar_24.gif" border="0" onclick="scwShow(scwID('event_expire'),event,3);"  >use calendar for date,</div> 
				<div class="date" ></div>
		  </div>
		</div>
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href=""></a></div> 
				<div class="abre" ></div>
				use first day of first event, or week</div>
		</div>	
		<div class="row" >	 
			<div style="margin:0px;">
  				<div class="icon"><a href=""></a></div> 
				<div class="abre" ></div>
  				<div class="name"><input type="SUBMIT" class="btnOk" value="Submit" name="_ok_" /></div> 
				<div class="date" ></div>
		  </div>
		</div>	
</FORM>
</body></html>