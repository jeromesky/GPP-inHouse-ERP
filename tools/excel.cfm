<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>.</title>
</head>

<body>
<!---
	Create the uninitialized Workbook class. Remember, this
	method CreateJExcelObject() just uses a Class Loader to
	load the Workbook class from the locally stored JAR file.
	This method automatically prepends "jxl." to all class
	calls, so do NOT include it in this method call.
--->
<cfset objWorkbook = CreateJExcelObject( "Workbook" ) />
 
<!---
	Get the workbook from the given file. This workbook
	may contain multiple sheets.
--->
<cfset objWorkbook = objWorkbook.GetWorkbook(
	CreateObject( "java", "java.io.File" ).Init(
		ExpandPath( "./china.xls" )
		)
	) />
 
<!---
	Create an object to keep track of all the sheet / cell
	data. We are, essentially going to store the excell
	sheets in an array and the data in a query.
--->
<cfset arrWorkbook = ArrayNew( 1 ) />
 
<!---
	Loop over the number of sheets in the workbook. We need to
	get the number of sheets in the workbook. Be careful! The
	GetSheets() method doesn't return a number (like the later
	used GetColumns() or GetRows()); instead, it returns an
	array of actual jxl.Sheet objects.
--->
<cfloop
	index="intSheet"
	from="1"
	to="#ArrayLen( objWorkbook.GetSheets() )#"
	step="1">
 
 
	<!---
		Create a blank query for this excel data sheet.
		We could create the number of columns right now,
		but I think it will be easier to add columns as
		we go.
	--->
	<cfset qData = QueryNew( "" ) />
 
	<!--- Store this data query into the workbook array. --->
	<cfset ArrayAppend( arrWorkbook, qData ) />
 
 
	<!---
		Get the current sheet. Remember that since we are
		getting the sheet by index and we are getting it
		through a JAVA method, we need to use zero-based
		indexes (unlike ColdFusion which is one-based).
	--->
	<cfset objSheet = objWorkbook.GetSheet(
		JavaCast( "int", (intSheet - 1) )
		) />
 
 
	<!---
		Loop over the columns and rows. As we loop over the
		columns, we are going to add a column to the data
		query and then add the row values. This should allow
		us to easily create the computed names such as
		COLUMN1, COLUMN2, COLUMN3.
	--->
	<cfloop
		index="intColumn"
		from="1"
		to="#objSheet.GetColumns()#"
		step="1">
 
		<!---
			Add the column to the query. We are going to add
			all the columns as text since I have no idea what
			kind of data there will be. We can always parse
			it into a data type later.
		--->
		<cfset QueryAddColumn(
			qData,
			("COLUMN" & intColumn),
			"CF_SQL_VARCHAR",
			ArrayNew( 1 )
			) />
 
		<!---
			We need to add rows. However, since we might be
			adding a lot of data, let's resize the query for
			faster processing. We ONLY want to do this the
			FIRST time. Then, the rest of the times, we can
			simply add data to the existing query cells.
		--->
		<cfif (intColumn EQ 1)>
 
			<!---
				Resize the query based on the number of rows
				in the excel file.
			--->
			<cfset QueryAddRow(
				qData,
				objSheet.GetRows()
				) />
 
		</cfif>
 
 
		<!---
			Now that we have the appropriate column added to the
			query and we have the correct number of rows that we
			will need, let's loop over the rows and move the
			cell data into the data query.
		--->
		<cfloop
			index="intRow"
			from="1"
			to="#objSheet.GetRows()#"
			step="1">
 
			<!--- Set the query data. --->
			<cfset qData[ "COLUMN#intColumn#" ][ intRow ] = JavaCast(
				"string",
				objSheet.GetCell(
					JavaCast( "int", intColumn - 1 ),
					JavaCast( "int", intRow - 1 )
					).GetContents()
				) />
 
		</cfloop>
	</cfloop>
</cfloop>
<cfset objWorkbook.Close() />
</body>
</html>
