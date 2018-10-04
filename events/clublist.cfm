<cfinclude template="../Application.cfm">
<cfquery name="clubs" datasource="#dsnP21#">
   SELECT *
   FROM clubs
   order by id desc
</cfquery>
<cfinclude template="json.cfc">
<cfset open = "{" >
<cfset close = "}" >
<cfset TheValues = "" >

<cfoutput query="clubs">
	<cfset getVal =  "'" & #trim(clubs.id)# & "' : '" & #trim(clubs.name)# & "'" >
	<cfset TheValues = ListAppend(TheValues, getVal, ",")  >
</cfoutput>
<cfset  result = open & TheValues & close >
<!---
<cfscript>
	thestruct = StructNew();
	for (  intRow = 1 ;  intRow LTE #clubs.RecordCount# ; intRow = intRow + 1 ){
	
			
		thestruct["ww"] = "www")
			
	}
	thestruct["integer"] = intRow;
	thestruct["integer2"] = "#clubs.RecordCount#";
</cfscript>

<cfinvoke component="JSON" method="encode" data="#thestruct#" returnvariable="result" />--->

<cfoutput>#result#</cfoutput>

<!---
<cfparam name="thestruct" default="#StructNew()#" />
<cfloop collection="#BillingStruct#" item="intRow">
    <cfoutput>#intRow# = #BillingStruct[key]#<br /></cfoutput>
</cfloop> --->

<!---





 intRow = 0 ;  intRow LTE clubs.RecordCount ; intRow = (intRow + 1)
<cfinclude template="../components/json.cfc">
<cfscript>
	// Loop over the records in the query.
		thestruct = StructNew();

	for (

		intRow = 1 ; 
		intRow LTE clubs.RecordCount ; 
		intRow = (intRow + 1)
		){
		// Output the name some values. When doing so, access the
		// query as if it were a structure of arrays and we want
		// only get values from this row index.
		//WriteOutput(
			//thestruct eq "wewewe"
			//thestruct["integer"] = "wewewe";
			//);
			thestruct["integer"] = "wewewe";
	}
</cfscript>
<cfinvoke component="JSON" method="encode" data="#thestruct#" returnvariable="result" />
<cfoutput>#result#</cfoutput>--->



<!---
<cfscript>
<cfoutput  >
thestruct = StructNew();
thestruct.key3["first_name"] ="#clubs.name#";
</cfoutput>
</cfscript>

<cfoutput>
#jsonencode(thestruct)#
</cfoutput>--->
<!---
qPornStars[ "name" ][ intRow ] & " is a " &
<cfinclude template="../components/jsonencode.cfm">
<cfinclude template="../components/json.cfc">
<cfscript>
  
<cfoutput >
    thestruct["#clubs.id#"] = "#clubs.name#";
</cfoutput>

</cfscript>

<cfinvoke component="JSON" method="encode" data="#thestruct#" returnvariable="result" />

<cfoutput>#result#</cfoutput>--->

