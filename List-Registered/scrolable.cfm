<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<head>
	<title>jQuery Tools standalone demo</title>
	    <script type="text/javascript" src="../javascript/jquery.js" ></script>
     <script type="text/javascript" src="../javascript/jquery.tools.min.js" ></script>
</head>
<body>
<style  type="text/css" media="all">
.scrollable { float:left;	}

.next{width:13px; height:73px; background-image:url(../img/Rotate_Next.jpg)}
.prev{ widows:13px; height:73px; background-image:url(../img/Rotate_Previous.jpg)}
div.scrollable { 
 
    /* required settings */ 
    position:relative; 
    overflow:hidden; 
    width: 650px; 
    height:70px; 
} 
 
/* 
    root element for scrollable items. Must be absolutely positioned 
    and it should have a extremely large width to accomodate scrollable items. 
    it's enough that you set width and height for the root element and 
    not for this element. 
*/ 
div.scrollable div.items { 
    /* this cannot be too large */ 
    width:650px; 
    position:absolute; 
} 
 
/* 
    a single item. must be floated in horizontal scrolling. 
    typically, this element is the one that *you* will style 
    the most. 
*/ 
div.scrollable div.items div { 
    float:left; 
} 
 
/* you may want to setup some decorations to active the item */ 
div.items div.active { 
    border:1px inset #ccc; 
    background-color:#fff; 
}

a { font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#FFFFFF; text-decoration:none}
A:HOver{text-decoration:underline}
table { font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#333333}
#areaEdit td { border-bottom:1px solid #E8E8E8}
th { font-weight:bold; color:#46415E; text-align:left; background-color:#E2EAFC}
.words {text-transform: capitalize}
.tableAttType{ }
#configure { padding:5px 10px; border:1px solid #434343; background-image:url(../img/Configure_back.png); margin:0 5px 5px 5px}
#configuretable{color:#FFFFFF}
#configuretable .tableAttType td {border-bottom:1px dotted #fff}
label {color:#FFFFFF}
body { background-color:#666666 }


/* prev, next, prevPage and nextPage buttons */
a.browse {
	background:url(../img/hori_large.png) no-repeat;
	display:block;
	width:30px;
	height:30px;
	float:left;
	margin:40px 10px;
	cursor:pointer;
	font-size:1px;
}

/* right */
a.right { background-position: 0 -30px; clear:right; margin-right: 0px;}
a.right:hover { background-position:-30px -30px; }
a.right:active {	  background-position:-60px -30px; } 


/* left */
a.left			{ margin-left: 0px; } 
a.left:hover  	{ background-position:-30px 0; }
a.left:active  	{ background-position:-60px 0; }

/* up and down */
a.up, a.down	{ 	background:url(../img/scrollable/arrow/vert_large.png) no-repeat; 	float: none; 	margin: 10px 50px }
/* up */
a.up:hover  	{ background-position:-30px 0; }
a.up:active  	{ background-position:-60px 0; }
/* down */
a.down 			{ background-position: 0 -30px; }
a.down:hover  	{ background-position:-30px -30px; }
a.down:active  	{ background-position:-60px -30px; } 
/* disabled navigational button */
a.disabled { 	visibility:hidden !important; } 	
</style> 
<link rel="stylesheet" type="text/css" href="http://static.flowplayer.org/tools/css/scrollable-buttons.css" />

<!-- HTML structures -->
<!-- "previous page" action -->
<a class="prevPage browse left"></a>

<!-- root element for scrollable -->
<div class="scrollable">	
	
	<!-- root element for the items -->
	<div class="items">
    
<div><table width="650" border="0" cellspacing="1" cellpadding="1" class="tableAttType">
        <tr>
          <td><label>
            <input  type="checkbox" name="email"  value="1"   />
            email </label></td>
          <td><label><input type="checkbox" name="invoiceNo" value="1" />Invoice No</label></td>
          <td><label><input type="checkbox" name="phone" value="1" />phone</label></td>
          <td><label><input type="checkbox" name="chkCompGuest" value="1" />guest</label></td>
          <td></td> 
        </tr>
        <tr>
          <td><label>
            <input  type="checkbox" name="comment"  value="1"   />
            comment </label></td>

          <td><label><input  type="checkbox" name="email_sec"  value="1" />email&nbsp;secretary </label></td>
            <td><label><input  type="checkbox" name="phone_ALT"  value="1" />Phone&nbsp;ALT</label></td>
            <td><label><input type="checkbox" name="discount" value="1" />discount</label></td>
            <td><select name="paid">
            	<option value="none">payment</option>
                <option value="yes">paid</option>
                <option value="no">unpaid</option>
                <option value="all">both</option>
                </select> 
            </td>
        </tr>
        <tr>
          <td></td>
          <td><label><input  type="checkbox" name="mobile"  value="1"  />mobile</label></td>
          <td><label><input  type="checkbox" name="status"  value="1"  />Status</label></td>
          <td><label><input  type="checkbox" name="count"  value="1"  />include&nbsp;count</label></td>
          <td></td>
        </tr>
      </table></div>
	</div>	
</div>

<!-- "next page" action -->
<a class="nextPage browse right"></a>

<br clear="all" />

<!-- javascript coding -->
<script>
// execute your scripts when the DOM is ready. this is a good habit
$(function() {

	// initialize scrollable
	$("div.scrollable").scrollable({     size:1 });

});
</script>

</body>