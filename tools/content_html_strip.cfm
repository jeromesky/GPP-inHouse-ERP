<cfquery name="qryText" datasource="DBK_admin" >
	SELECT  dataContent, dataid
    FROM data
    ORDER BY dataid DESC
</cfquery>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
</head>

<body>

<cfloop query="qryText">

1<br />
<cfquery datasource="DBK_admin" >
	UPDATE data 
    SET dataContent =  '#replace(qryText.dataContent, "  ", " ", "ALL")#'
    WHERE dataid =  #qryText.dataid#
</cfquery>
<!----
<h4>Clean</h4>
	<cfoutput>#tagStripper(qryText.dataContent,'strip','p,b,strong,a,ul,ol,li,u,i,img,br')#</cfoutput>

<hr />
<h4>Original</h4>
	<cfoutput>#qryText.dataContent#</cfoutput>
<hr /><hr /><hr />   ----> 
</cfloop>
    
</body>
</html>
#replace(qryText.dataContent, "  ", " ", "ALL")#
#replace(qryText.dataContent, "<p></p>", " ", "ALL")#
#replace(qryText.dataContent, "chr(10) chr(13)", " ", "ALL")#


<cfscript>
/**
 * Function to strip HTML tags, with options to preserve certain tags.
 * v2 by Ray Camden, fix to closing tag
 * 
 * @param str      String to manipulate. (Required)
 * @param action      Strip or preserve. Default is strip. (Optional)
 * @param tagList      Tags to strip or perserve. (Optional)
 * @return Returns a string. 
 * @author Rick Root (rick@webworksllc.com) 
 * @version 2, July 2, 2008 
 */
function tagStripper(str) {
    var i = 1;
    var action = 'strip';
    var tagList = '';
    var tag = '';
    
    if (ArrayLen(arguments) gt 1 and lcase(arguments[2]) eq 'preserve') {
        action = 'preserve';
    }
    if (ArrayLen(arguments) gt 2) tagList = arguments[3];

    if (trim(lcase(action)) eq "preserve") {
        // strip only those tags in the tagList argument
        for (i=1;i lte listlen(tagList); i = i + 1) {
            tag = listGetAt(tagList,i);
            str = REReplaceNoCase(str,"</?#tag#.*?>","","ALL");
        }
    } else {
        // strip all, except those in the tagList argument
        // if there are exclusions, mark them with NOSTRIP
        if (tagList neq "") {
            for (i=1;i lte listlen(tagList); i = i + 1) {
                tag = listGetAt(tagList,i);
                str = REReplaceNoCase(str,"<(/?#tag#.*?)>","___TEMP___NOSTRIP___\1___TEMP___ENDNOSTRIP___","ALL");
            }
        }
        // strip all remaining tsgs.  This does NOT strip comments
        str = reReplaceNoCase(str,"</{0,1}[A-Z].*?>","","ALL");
        // convert unstripped back to normal
        str = replace(str,"___TEMP___NOSTRIP___","<","ALL");
        str = replace(str,"___TEMP___ENDNOSTRIP___",">","ALL");
    }
    
    return str;    
}
</cfscript>


<cfscript>
/**
 * Removes potentially nasty HTML text.
 * Version 2 by Lena Aleksandrova - changes include fixing a bug w/ arguments and use of REreplace where REreplaceNoCase should have been used.
 * version 4 fix by Javier Julio - when a bad event is removed, remove the arg too, ie, remove onclick=&quot;foo&quot;, not just onclick.
 * 
 * @param text      String to be modified. (Required)
 * @param strip      Boolean value (defaults to false) that determines if HTML should be stripped or just escaped out. (Optional)
 * @param badTags      A list of bad tags. Has a long default list. Consult source. (Optional)
 * @param badEvents      A list of bad HTML events. Has a long default list. Consult source. (Optional)
 * @return Returns a string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 4, October 16, 2006 
 */
function safetext(text) {
    //default mode is "escape"
    var mode = "escape";
    //the things to strip out (badTags are HTML tags to strip and badEvents are intra-tag stuff to kill)
    //you can change this list to suit your needs
    var badTags = "SCRIPT,OBJECT,APPLET,EMBED,FORM,LAYER,ILAYER,FRAME,IFRAME,FRAMESET,PARAM,META";
    var badEvents = "onClick,onDblClick,onKeyDown,onKeyPress,onKeyUp,onMouseDown,onMouseOut,onMouseUp,onMouseOver,onBlur,onChange,onFocus,onSelect,javascript:";
    var stripperRE = "";
    
    //set up variable to parse and while we're at it trim white space 
    var theText = trim(text);
    //find the first open bracket to start parsing
    var obracket = find("<",theText);        
    //var for badTag
    var badTag = "";
    //var for the next start in the parse loop
    var nextStart = "";
    //if there is more than one argument and the second argument is boolean TRUE, we are stripping
    if(arraylen(arguments) GT 1 AND isBoolean(arguments[2]) AND arguments[2]) mode = "strip";
    if(arraylen(arguments) GT 2 and len(arguments[3])) badTags = arguments[3];
    if(arraylen(arguments) GT 3 and len(arguments[4])) badEvents = arguments[4];
    //the regular expression used to stip tags
    stripperRE = "</?(" & listChangeDelims(badTags,"|") & ")[^>]*>";    
    //Deal with "smart quotes" and other "special" chars from MS Word
    theText = replaceList(theText,chr(8216) & "," & chr(8217) & "," & chr(8220) & "," & chr(8221) & "," & chr(8212) & "," & chr(8213) & "," & chr(8230),"',',"","",--,--,...");
    //if escaping, run through the code bracket by bracket and escape the bad tags.
    if(mode is "escape"){
        //go until no more open brackets to find
        while(obracket){
            //find the next instance of one of the bad tags
            badTag = REFindNoCase(stripperRE,theText,obracket,1);
            //if a bad tag is found, escape it
            if(badTag.pos[1]){
                theText = replace(theText,mid(TheText,badtag.pos[1],badtag.len[1]),HTMLEditFormat(mid(TheText,badtag.pos[1],badtag.len[1])),"ALL");
                nextStart = badTag.pos[1] + badTag.len[1];
            }
            //if no bad tag is found, move on
            else{
                nextStart = obracket + 1;
            }
            //find the next open bracket
            obracket = find("<",theText,nextStart);
        }
    }
    //if not escaping, assume stripping
    else{
        theText = REReplaceNoCase(theText,stripperRE,"","ALL");
    }
    //now kill the bad "events" (intra tag text)
    theText = REReplaceNoCase(theText,'(#ListChangeDelims(badEvents,"|")#)[^ >]*',"","ALL");
    //return theText
    return theText;
}
</cfscript>

<!---
<CFSET STR = "This is text with a <SCRIPT> in it.">
<CFSET STR2 = "Another example w/ <APPLET> bad stuff.">
<CFOUTPUT>
#SafeText(STR)#<BR>
#SafeText(STR,1)#
</CFOUTPUT>--->