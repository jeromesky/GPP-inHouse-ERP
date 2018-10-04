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
        // strip all remaining tsgs. This does NOT strip comments
        str = reReplaceNoCase(str,"</{0,1}[A-Z].*?>","","ALL");
        // convert unstripped back to normal
        str = replace(str,"___TEMP___NOSTRIP___","<","ALL");
        str = replace(str,"___TEMP___ENDNOSTRIP___",">","ALL");
    }
    
    return str;    
}
</cfscript>

<cfsavecontent variable="mystring">
&lt;table border=&quot;0&quot; cellpadding=&quot;2&quot; cellspacing=&quot;7&quot; style=&quot;vertical-align:top;&quot;&gt;&lt;tr&gt;&lt;td width=&quot;80&quot; align=&quot;center&quot; valign=&quot;top&quot;&gt;&lt;font style=&quot;font-size:85%;font-family:arial,sans-serif&quot;&gt;&lt;/font&gt;&lt;/td&gt;&lt;td valign=&quot;top&quot; class=&quot;j&quot;&gt;&lt;font style=&quot;font-size:85%;font-family:arial,sans-serif&quot;&gt;&lt;br /&gt;&lt;div style=&quot;padding-top:0.8em;&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;1&quot; width=&quot;1&quot; /&gt;&lt;/div&gt;&lt;div class=&quot;lh&quot;&gt;&lt;a href=&quot;http://news.google.com/news/url?sa=t&amp;amp;fd=R&amp;amp;usg=AFQjCNHMjsl-UgOQHls9B5huWIzBK2L3Iw&amp;amp;url=http://www.digitaljournal.com/pr/98343&quot;&gt;&lt;b&gt;&lt;b&gt;Orca Exploration&lt;/b&gt; Announces Record Date of Rights Offering&lt;/b&gt;&lt;/a&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot;&gt;&lt;b&gt;&lt;font color=&quot;#6f6f6f&quot;&gt;DigitalJournal.com (press release)&lt;/font&gt;&lt;/b&gt;&lt;/font&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot;&gt;20 /CNW/ - &lt;b&gt;Orca Exploration&lt;/b&gt; Group Inc (&amp;quot;Orca&amp;quot; or the &amp;quot;Company&amp;quot;) announces that it is proceeding with its previously announced rights offering to &lt;b&gt;...&lt;/b&gt;&lt;/font&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot; class=&quot;p&quot;&gt;&lt;/font&gt;&lt;br /&gt;&lt;font class=&quot;p&quot; size=&quot;-1&quot;&gt;&lt;a class=&quot;p&quot; href=&quot;http://news.google.com/news/more?pz=1&amp;amp;ned=us&amp;amp;ncl=d164Y_5dP5_e_aM&quot;&gt;&lt;nobr&gt;&lt;b&gt;and more&amp;nbsp;&amp;raquo;&lt;/b&gt;&lt;/nobr&gt;&lt;/a&gt;&lt;/font&gt;&lt;/div&gt;&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;


****&lt;table border=&quot;0&quot; cellpadding=&quot;2&quot; cellspacing=&quot;7&quot; style=&quot;vertical-align:top;&quot;&gt;&lt;tr&gt;&lt;td width=&quot;80&quot; align=&quot;center&quot; valign=&quot;top&quot;&gt;&lt;font style=&quot;font-size:85%;font-family:arial,sans-serif&quot;&gt;&lt;a href=&quot;http://news.google.com/news/url?sa=t&amp;amp;fd=R&amp;amp;usg=AFQjCNFv-iU6YSn48QTEh3IWoAxwCXHylw&amp;amp;url=http://www.theeastafrican.co.ke/news/-/2558/968432/-/pc11q1z/-/&quot;&gt;&lt;img src=&quot;http://nt2.ggpht.com/news/tbn/gkbxFx5GeJQVAM/6.jpg&quot; alt=&quot;&quot; border=&quot;1&quot; width=&quot;80&quot; height=&quot;80&quot; /&gt;&lt;br /&gt;&lt;font size=&quot;-2&quot;&gt;East African&lt;/font&gt;&lt;/a&gt;&lt;/font&gt;&lt;/td&gt;&lt;td valign=&quot;top&quot; class=&quot;j&quot;&gt;&lt;font style=&quot;font-size:85%;font-family:arial,sans-serif&quot;&gt;&lt;br /&gt;&lt;div style=&quot;padding-top:0.8em;&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;1&quot; width=&quot;1&quot; /&gt;&lt;/div&gt;&lt;div class=&quot;lh&quot;&gt;&lt;a href=&quot;http://news.google.com/news/url?sa=t&amp;amp;fd=R&amp;amp;usg=AFQjCNFv-iU6YSn48QTEh3IWoAxwCXHylw&amp;amp;url=http://www.theeastafrican.co.ke/news/-/2558/968432/-/pc11q1z/-/&quot;&gt;&lt;b&gt;Coming soon: Dar-Mombasa gas pipeline&lt;/b&gt;&lt;/a&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot;&gt;&lt;b&gt;&lt;font color=&quot;#6f6f6f&quot;&gt;East African&lt;/font&gt;&lt;/b&gt;&lt;/font&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot;&gt;Photo/FILE By Abduel Elinaza (email the author) Canada&amp;#39;s &lt;b&gt;Orca Exploration&lt;/b&gt; Group is planning to construct a natural gas pipeline from Dar es Salaam to &lt;b&gt;...&lt;/b&gt;&lt;/font&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot; class=&quot;p&quot;&gt;&lt;/font&gt;&lt;br /&gt;&lt;font class=&quot;p&quot; size=&quot;-1&quot;&gt;&lt;a class=&quot;p&quot; href=&quot;http://news.google.com/news/more?pz=1&amp;amp;ned=us&amp;amp;ncl=dmDocKSAtySdtmM&quot;&gt;&lt;nobr&gt;&lt;b&gt;and more&amp;nbsp;&amp;raquo;&lt;/b&gt;&lt;/nobr&gt;&lt;/a&gt;&lt;/font&gt;&lt;/div&gt;&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
****&lt;table border=&quot;0&quot; cellpadding=&quot;2&quot; cellspacing=&quot;7&quot; style=&quot;vertical-align:top;&quot;&gt;&lt;tr&gt;&lt;td width=&quot;80&quot; align=&quot;center&quot; valign=&quot;top&quot;&gt;&lt;font style=&quot;font-size:85%;font-family:arial,sans-serif&quot;&gt;&lt;/font&gt;&lt;/td&gt;&lt;td valign=&quot;top&quot; class=&quot;j&quot;&gt;&lt;font style=&quot;font-size:85%;font-family:arial,sans-serif&quot;&gt;&lt;br /&gt;&lt;div style=&quot;padding-top:0.8em;&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;1&quot; width=&quot;1&quot; /&gt;&lt;/div&gt;&lt;div class=&quot;lh&quot;&gt;&lt;a href=&quot;http://news.google.com/news/url?sa=t&amp;amp;fd=R&amp;amp;usg=AFQjCNF_2o5M3v2aTiwFTr531lbJ1DuV8w&amp;amp;url=http://www.digitaljournal.com/pr/99923&quot;&gt;&lt;b&gt;TSX Venture Exchange Daily Bulletins&lt;/b&gt;&lt;/a&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot;&gt;&lt;b&gt;&lt;font color=&quot;#6f6f6f&quot;&gt;DigitalJournal.com (press release)&lt;/font&gt;&lt;/b&gt;&lt;/font&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot;&gt;&lt;b&gt;ORCA EXPLORATION&lt;/b&gt; GROUP INC. (&amp;quot;ORC.A&amp;quot;)(&amp;quot;ORC.B&amp;quot;)(&amp;quot;ORC.RT&amp;quot;) BULLETIN TYPE: Rights Offering-Shares BULLETIN DATE: August 24, 2010 TSX Venture Tier 2 Company The &lt;b&gt;...&lt;/b&gt;&lt;/font&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot; class=&quot;p&quot;&gt;&lt;/font&gt;&lt;br /&gt;&lt;font class=&quot;p&quot; size=&quot;-1&quot;&gt;&lt;a class=&quot;p&quot; href=&quot;http://news.google.com/news/more?pz=1&amp;amp;ned=us&amp;amp;ncl=dYQUzUZIHaP6oLM&quot;&gt;&lt;nobr&gt;&lt;b&gt;and more&amp;nbsp;&amp;raquo;&lt;/b&gt;&lt;/nobr&gt;&lt;/a&gt;&lt;/font&gt;&lt;/div&gt;&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
****&lt;table border=&quot;0&quot; cellpadding=&quot;2&quot; cellspacing=&quot;7&quot; style=&quot;vertical-align:top;&quot;&gt;&lt;tr&gt;&lt;td width=&quot;80&quot; align=&quot;center&quot; valign=&quot;top&quot;&gt;&lt;font style=&quot;font-size:85%;font-family:arial,sans-serif&quot;&gt;&lt;/font&gt;&lt;/td&gt;&lt;td valign=&quot;top&quot; class=&quot;j&quot;&gt;&lt;font style=&quot;font-size:85%;font-family:arial,sans-serif&quot;&gt;&lt;br /&gt;&lt;div style=&quot;padding-top:0.8em;&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;1&quot; width=&quot;1&quot; /&gt;&lt;/div&gt;&lt;div class=&quot;lh&quot;&gt;&lt;a href=&quot;http://news.google.com/news/url?sa=t&amp;amp;fd=R&amp;amp;usg=AFQjCNGyKb1mF3mmWWXZbuHxqbSYqsjItg&amp;amp;url=http://www.oilandgasinsight.com/file/91129/duelling-projects-point-to-gas-pipeline-extension.html&quot;&gt;&lt;b&gt;Duelling Projects Point To Gas Pipeline Extension&lt;/b&gt;&lt;/a&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot;&gt;&lt;b&gt;&lt;font color=&quot;#6f6f6f&quot;&gt;Oil and Gas Insight (registration)&lt;/font&gt;&lt;/b&gt;&lt;/font&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot;&gt;Both The East African Community (EAC), a regional intergovernmental organisation, and Canada-listed independent &lt;b&gt;Orca Exploration&lt;/b&gt;, which owns producing &lt;b&gt;...&lt;/b&gt;&lt;/font&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot; class=&quot;p&quot;&gt;&lt;/font&gt;&lt;br /&gt;&lt;font class=&quot;p&quot; size=&quot;-1&quot;&gt;&lt;a class=&quot;p&quot; href=&quot;http://news.google.com/news/more?pz=1&amp;amp;ned=us&amp;amp;ncl=dEFWJUPsQgDbioM&quot;&gt;&lt;nobr&gt;&lt;b&gt;&lt;/b&gt;&lt;/nobr&gt;&lt;/a&gt;&lt;/font&gt;&lt;/div&gt;&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;

****&lt;table border=&quot;0&quot; cellpadding=&quot;2&quot; cellspacing=&quot;7&quot; style=&quot;vertical-align:top;&quot;&gt;&lt;tr&gt;&lt;td width=&quot;80&quot; align=&quot;center&quot; valign=&quot;top&quot;&gt;&lt;font style=&quot;font-size:85%;font-family:arial,sans-serif&quot;&gt;&lt;/font&gt;&lt;/td&gt;&lt;td valign=&quot;top&quot; class=&quot;j&quot;&gt;&lt;font style=&quot;font-size:85%;font-family:arial,sans-serif&quot;&gt;&lt;br /&gt;&lt;div style=&quot;padding-top:0.8em;&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;1&quot; width=&quot;1&quot; /&gt;&lt;/div&gt;&lt;div class=&quot;lh&quot;&gt;&lt;a href=&quot;http://news.google.com/news/url?sa=t&amp;amp;fd=R&amp;amp;usg=AFQjCNFITj56gjRe6CB6dngGnK3JhvrjUg&amp;amp;url=http://www.examiner.com/pets-in-hartford/seaworld-fined-75-000-over-trainer-s-death&quot;&gt;&lt;b&gt;SeaWorld fined $75000 over trainer&amp;#39;s death&lt;/b&gt;&lt;/a&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot;&gt;&lt;b&gt;&lt;font color=&quot;#6f6f6f&quot;&gt;Examiner.com&lt;/font&gt;&lt;/b&gt;&lt;/font&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot;&gt;He is also one of three &lt;b&gt;orcas&lt;/b&gt; blamed for killing another female trainer in 1991, when she accidently fell into a pool at Sealand of the Pacific in Victoria, &lt;b&gt;...&lt;/b&gt;&lt;/font&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot; class=&quot;p&quot;&gt;&lt;/font&gt;&lt;br /&gt;&lt;font class=&quot;p&quot; size=&quot;-1&quot;&gt;&lt;a class=&quot;p&quot; href=&quot;http://news.google.com/news/more?pz=1&amp;amp;ned=us&amp;amp;ncl=d-rnm5SoNFWwjvM&quot;&gt;&lt;nobr&gt;&lt;b&gt;and more&amp;nbsp;&amp;raquo;&lt;/b&gt;&lt;/nobr&gt;&lt;/a&gt;&lt;/font&gt;&lt;/div&gt;&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;

****&lt;table border=&quot;0&quot; cellpadding=&quot;2&quot; cellspacing=&quot;7&quot; style=&quot;vertical-align:top;&quot;&gt;&lt;tr&gt;&lt;td width=&quot;80&quot; align=&quot;center&quot; valign=&quot;top&quot;&gt;&lt;font style=&quot;font-size:85%;font-family:arial,sans-serif&quot;&gt;&lt;/font&gt;&lt;/td&gt;&lt;td valign=&quot;top&quot; class=&quot;j&quot;&gt;&lt;font style=&quot;font-size:85%;font-family:arial,sans-serif&quot;&gt;&lt;br /&gt;&lt;div style=&quot;padding-top:0.8em;&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;1&quot; width=&quot;1&quot; /&gt;&lt;/div&gt;&lt;div class=&quot;lh&quot;&gt;&lt;a href=&quot;http://news.google.com/news/url?sa=t&amp;amp;fd=R&amp;amp;usg=AFQjCNH7zwqYkBqLLjEUZVqaDkIJ8aq1jA&amp;amp;url=http://www.marketwatch.com/story/ion-reports-improved-second-quarter-2010-results-2010-08-04?reflink%3DMW_news_stmp&quot;&gt;&lt;b&gt;ION Reports Improved Second Quarter 2010 Results&lt;/b&gt;&lt;/a&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot;&gt;&lt;b&gt;&lt;font color=&quot;#6f6f6f&quot;&gt;MarketWatch (press release)&lt;/font&gt;&lt;/b&gt;&lt;/font&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot;&gt;We saw continued strength in both DigiFIN(TM) and &lt;b&gt;Orca&lt;/b&gt;(R) sales and signed the contract with BGP to equip their new 12 streamer vessel with our latest &lt;b&gt;...&lt;/b&gt;&lt;/font&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot; class=&quot;p&quot;&gt;&lt;/font&gt;&lt;br /&gt;&lt;font class=&quot;p&quot; size=&quot;-1&quot;&gt;&lt;a class=&quot;p&quot; href=&quot;http://news.google.com/news/more?pz=1&amp;amp;ned=us&amp;amp;ncl=dYqkDvO_6o40t4M&quot;&gt;&lt;nobr&gt;&lt;b&gt;and more&amp;nbsp;&amp;raquo;&lt;/b&gt;&lt;/nobr&gt;&lt;/a&gt;&lt;/font&gt;&lt;/div&gt;&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;

****&lt;table border=&quot;0&quot; cellpadding=&quot;2&quot; cellspacing=&quot;7&quot; style=&quot;vertical-align:top;&quot;&gt;&lt;tr&gt;&lt;td width=&quot;80&quot; align=&quot;center&quot; valign=&quot;top&quot;&gt;&lt;font style=&quot;font-size:85%;font-family:arial,sans-serif&quot;&gt;&lt;/font&gt;&lt;/td&gt;&lt;td valign=&quot;top&quot; class=&quot;j&quot;&gt;&lt;font style=&quot;font-size:85%;font-family:arial,sans-serif&quot;&gt;&lt;br /&gt;&lt;div style=&quot;padding-top:0.8em;&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;1&quot; width=&quot;1&quot; /&gt;&lt;/div&gt;&lt;div class=&quot;lh&quot;&gt;&lt;a href=&quot;http://news.google.com/news/url?sa=t&amp;amp;fd=R&amp;amp;usg=AFQjCNHci-HAVqPj01Oc0djR5iWi8r7ZbA&amp;amp;url=http://www.montrealgazette.com/Paddling%2Bwith%2Botters%2BKyuquot%2BSound/3424826/story.html&quot;&gt;&lt;b&gt;Paddling with otters in Kyuquot Sound&lt;/b&gt;&lt;/a&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot;&gt;&lt;b&gt;&lt;font color=&quot;#6f6f6f&quot;&gt;Montreal Gazette&lt;/font&gt;&lt;/b&gt;&lt;/font&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot;&gt;Paddling with &lt;b&gt;orca&lt;/b&gt; whales in places like Johnstone Strait offers an opportunity for awe and wonder of the highest order. But WCE&amp;#39;s “Sea Kayak with Sea &lt;b&gt;...&lt;/b&gt;&lt;/font&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot; class=&quot;p&quot;&gt;&lt;/font&gt;&lt;br /&gt;&lt;font class=&quot;p&quot; size=&quot;-1&quot;&gt;&lt;a class=&quot;p&quot; href=&quot;http://news.google.com/news/more?pz=1&amp;amp;ned=us&amp;amp;ncl=dTRKQJ8sBA40VOM&quot;&gt;&lt;nobr&gt;&lt;b&gt;and more&amp;nbsp;&amp;raquo;&lt;/b&gt;&lt;/nobr&gt;&lt;/a&gt;&lt;/font&gt;&lt;/div&gt;&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;

****&lt;table border=&quot;0&quot; cellpadding=&quot;2&quot; cellspacing=&quot;7&quot; style=&quot;vertical-align:top;&quot;&gt;&lt;tr&gt;&lt;td width=&quot;80&quot; align=&quot;center&quot; valign=&quot;top&quot;&gt;&lt;font style=&quot;font-size:85%;font-family:arial,sans-serif&quot;&gt;&lt;a href=&quot;http://news.google.com/news/url?sa=t&amp;amp;fd=R&amp;amp;usg=AFQjCNFJuBK0_fDzDB4oKYTr154TDDUbdw&amp;amp;url=http://www.ilnord.com/2010/08/03/contro-la-crisi-apriamo-un-pozzo-di-petrolio/&quot;&gt;&lt;img src=&quot;http://nt2.ggpht.com/news/tbn/sjpwYG7ukNE85M/6.jpg&quot; alt=&quot;&quot; border=&quot;1&quot; width=&quot;80&quot; height=&quot;80&quot; /&gt;&lt;br /&gt;&lt;font size=&quot;-2&quot;&gt;Il Nord&lt;/font&gt;&lt;/a&gt;&lt;/font&gt;&lt;/td&gt;&lt;td valign=&quot;top&quot; class=&quot;j&quot;&gt;&lt;font style=&quot;font-size:85%;font-family:arial,sans-serif&quot;&gt;&lt;br /&gt;&lt;div style=&quot;padding-top:0.8em;&quot;&gt;&lt;img alt=&quot;&quot; height=&quot;1&quot; width=&quot;1&quot; /&gt;&lt;/div&gt;&lt;div class=&quot;lh&quot;&gt;&lt;a href=&quot;http://news.google.com/news/url?sa=t&amp;amp;fd=R&amp;amp;usg=AFQjCNFJuBK0_fDzDB4oKYTr154TDDUbdw&amp;amp;url=http://www.ilnord.com/2010/08/03/contro-la-crisi-apriamo-un-pozzo-di-petrolio/&quot;&gt;&lt;b&gt;Contro la crisi apriamo un pozzo di petrolio!&lt;/b&gt;&lt;/a&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot;&gt;&lt;b&gt;&lt;font color=&quot;#6f6f6f&quot;&gt;Il Nord&lt;/font&gt;&lt;/b&gt;&lt;/font&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot;&gt;&lt;b&gt;...&lt;/b&gt; Adriatica Idrocarburi, &lt;b&gt;Orca Exploration&lt;/b&gt;, Vega Oil, Edison ea tutte le altre multinazionali del petrolio a cui non importa niente dell&amp;#39;Italia. &lt;b&gt;...&lt;/b&gt;&lt;/font&gt;&lt;br /&gt;&lt;font size=&quot;-1&quot; class=&quot;p&quot;&gt;&lt;/font&gt;&lt;br /&gt;&lt;font class=&quot;p&quot; size=&quot;-1&quot;&gt;&lt;a class=&quot;p&quot; href=&quot;http://news.google.com/news/more?pz=1&amp;amp;ned=us&amp;amp;hl=it&amp;amp;ncl=db54GADOtxUGf8M&quot;&gt;&lt;nobr&gt;&lt;b&gt;&lt;/b&gt;&lt;/nobr&gt;&lt;/a&gt;&lt;/font&gt;&lt;/div&gt;&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;
</cfsavecontent>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="../javascript/jquery1.4.js" ></script>
<link type="text/css" href="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.petro21.com/my-office/javascript/UI/jquery-ui-1.8.2.custom.min.js"></script>

<script type="text/javascript" src="../javascript/mopTip/mopTip-2.2.js"></script>
<script type="text/javascript" src="../javascript/jquery.pngFix.pack.js"></script>
<!---<link href="../styles/indexV2.css" rel="stylesheet" type="text/css">--->

<script type="text/javascript">
$(document).ready(function(){
$("#demo1Btn").mopTip({'w':150,'style':"overOut",'get':"#demo1"});
});
</script>
</head>

<body>

<cfloop list="#mystring#" delimiters="****" index="i">
<cfscript>
cleanString 		= ReplaceNoCase(i, "&lt;", "<", "ALL");
cleanString 		= ReplaceNoCase(cleanString, "&gt;", ">", "ALL");
cleanString 		= ReplaceNoCase(cleanString, "&quot;", "'", "ALL");
cleanString 		= ReplaceNoCase(cleanString, "<font color='##6f6f6f'>", "~", "ALL");
cleanString 		= ReplaceNoCase(cleanString, "<font size='-1'>", "~", "ALL");
cleanString 		= ReplaceNoCase(cleanString, "<font style='font-size:85%;font-family:arial,sans-serif'>", "~", "ALL");
cleanString 		= ReplaceNoCase(cleanString, "</font>", "~", "ALL");

cleanDescription = cleanString;

cleanimg 			= #tagStripper(cleanString,'strip','img')#;
img 					= listGetAT(cleanimg, 2, "'");

if ( img contains "height="){
	DescListPos = 8;
} else {
	DescListPos = 10;
} 
getDescription 	= listGetAt(cleanDescription, DescListPos, "~");
</cfscript>
<cfoutput>
FOUND IMG: <cfif  img contains "height=">no image<cfelse><img src="#img#" width="80" height="80" /></cfif><br /><br />

DESCRIPTION: #getDescription#<br />
Lenght: #len(getDescription)#<hr style="margin:20px 0px" /></cfoutput>
</cfloop>
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
<input type="text" id="demo1Btn" class=""  />demo1

<div id="demo1">"overOut" txt txt txt txt txt txt txt</div>
</body>
</html>
