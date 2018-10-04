<!---
This library is part of the Common Function Library Project. An open source
	collection of UDF libraries designed for ColdFusion 5.0 and higher. For more information,
	please see the web site at:

		http://www.cflib.org

	Warning:
	You may not need all the functions in this library. If speed
	is _extremely_ important, you may want to consider deleting
	functions you do not plan on using. Normally you should not
	have to worry about the size of the library.

	License:
	This code may be used freely.
	You may modify this code as you see fit, however, this header, and the header
	for the functions must remain intact.

	This code is provided as is.  We make no warranty or guarantee.  Use of this code is at your own risk.
--->

<cfscript>
/**
 * Translates a RSS Feed's items to a query.
 * 
 * @param rssDoc 	 RSS document to translate. (Required)
 * @return Returns a query. 
 * @author William Steiner (williams@hkusa.com) 
 * @version 1, October 30, 2003 
 */
function TranslateRSSItems(rssDoc) {

	// the current token we are looking at 
	var Token = GetToken(rssDoc,1,"<>");
	
	// LoopControl needs to be initialized
	var LoopControl = 1;
	
	// Initialize the Current Query Row 
	var RowNumber = 1;

	// the number of the next token we are looking at 
	var NextToken = 2;
	
	var RSS_Struct = StructNew();

	// Initialize Return Query 
	var ResultQuery = QueryNew("Title, Link, Description");
	
	// loop until we are out of tokens 
	while(Token is not "/rss"){
		switch(Left(Token,7)){
			case "channel":{
				// loop thru until we get to the first "item"
				// skiping all tokens relating to document itself
				while(Token is not "item") {
					// increment next token
					NextToken = NextToken + 1;
					Token = GetToken(rssDoc,NextToken,"<>");
				}
			} // end channel case
			case "item":{
				// if we are getting a item token, we want to:
				// create a new blank structure 
				
				// define new structure
				RSS_Struct = StructNew();
				
				// increment next token
				NextToken = NextToken + 1;
				break;
			} // end item case		
			
			case "/item":{
				// if we are getting a /item token, we want to:
				// Create a new row in the query the each item 
				// Assuming the structure isn't empty 
				
				// copy existing structure into result array
				if (not StructIsEmpty(RSS_Struct)){
					// add a new row to the query 
					RowNumber = QueryAddRow(ResultQuery);
					
					// populate Query 
					QuerySetCell(ResultQuery, "Title", RSS_Struct.Title, RowNumber);
					QuerySetCell(ResultQuery, "Link", RSS_Struct.Link, RowNumber);
					QuerySetCell(ResultQuery, "Description", RSS_Struct.Description, RowNumber);
				}
				
				// increment next token
				NextToken = NextToken + 1;
				break;
			} // end /item case		

			case "title":{
				// if we are getting the title token, then we want to:
				// add the next token to our structure, because that will be our title text
				// increment the 'nexttoken' variable two increments past the end title token

				// add the title to the structure
				StructInsert(RSS_Struct, "Title", GetToken(rssDoc,  NextToken+1, "<>"));
				
				// increment next token
				NextToken = NextToken + 2;

				break;
			} // end title case

			case "Link":{
				// if we are getting the Link token, then we want to:
				// add the next token to our structure, because that will be our link text
				// increment the 'nexttoken' variable two increments past the end link token

				// add the title to the structure
				StructInsert(RSS_Struct, "Link", GetToken(rssDoc,  NextToken+1, "<>"));
				
				// increment next token
				NextToken = NextToken + 2;
				
				break;
			} // end link case 


			case "descrip":{	
				// if we are getting the description token, then we want to:
				// add the next token to our structure, because that will be our description text
				// increment the nexttoken variable once

				// add the title to the structure
				StructInsert(RSS_Struct, "description", GetToken(rssDoc,  NextToken+1, "<>"));
				
				// increment next token
				NextToken = NextToken + 1;
				
				break;
			} // end description case 

			default: {
				Token = GetToken(rssDoc,NextToken,"<>");
				NextToken = NextToken + 1;
				break;
			} // end default case 
		} // end switch
		Token = GetToken(rssDoc,NextToken,"<>");
	} // end while

	return (ResultQuery);
}
</cfscript>






