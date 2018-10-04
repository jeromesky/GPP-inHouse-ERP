<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>.</title>
<style type="text/css">
Body {font-family:Lucida Grande, Lucida Sans, Arial, sans-serif;
			font-size:0.8em;
			color:#333333;
			padding:0px;
			margin:0px}
h1 	{ font-family: ; font-size:1.9em; color:#993300; margin:20 0 15 0px; letter-spacing:-1px; border-bottom:1px dotted #993300}
h2 	{ font-family: ; font-size:1.5em; color:#993300; margin:20 0 15 0px; letter-spacing:-1px; border-bottom:1px dotted #993300}
h3 	{ font-family: ; font-size:1.2em; color:#993300; margin:20 0 15 0px; letter-spacing:-1px; border-bottom:1px dotted #993300}
h4	{ font-family: ; font-size:1em; color:#993300; margin:20 0 15 0px; letter-spacing:-1px; border-bottom:1px dotted #993300}		
p		{ margin:30px 0px }

.wrapper{
   position: relative;
   float: left;
   left: 0px;
   width: 980px;
   margin-bottom: 10px;
}
.left1{
   position: relative;
   float: left;
   left: 5px;
   width: 300px;
}
.left2{
   position: relative;
   float: left;
   left: 15px;
   width: 300px;
}
.right{
   position: relative;
   float: right;
   right: 5px;
   width: 250px;
}
</style>
</head>

<body>
<div style="padding:45px; width:980px">
<h1>This is an H1 title</h1>
<h2>This is an H2 title</h2>
<h3>This is an H3 title</h3>
<h4>This is an H4 title</h4>
sdsdsdsd
<div class="left1">
<p>
Thanks for the suggestion, still do luck. The 2nd time the content loads it's now in a standard textarea not tinyMCE: I also tried removing the control first: tinyMCE.execCommand('mceRemoveControl',false,"content"); tinyMCE.execCommand("mceAddControl",true,"content"); – Peter Mar 31 at 1:40
	if its like FCKeditor, the browser receives a textarea and then some javascript plays with the DOM and inserts a contenteditable iframe (or div or somesuch). So in the cases where I have ajax-ed forms with editors, I need to re-run all the same code that happens during pageload on successful return – Scott Evernden Mar 31 at 1:56
</p>
</div>
<div class="left2">
<p>
Thanks for the suggestion, still do luck. The 2nd time the content loads it's now in a standard textarea not tinyMCE: I also tried removing the control first: tinyMCE.execCommand('mceRemoveControl',false,"content"); tinyMCE.execCommand("mceAddControl",true,"content"); – Peter Mar 31 at 1:40
	if its like FCKeditor, the browser receives a textarea and then some javascript plays with the DOM and inserts a contenteditable iframe (or div or somesuch). So in the cases where I have ajax-ed forms with editors, I need to re-run all the same code that happens during pageload on successful return – Scott Evernden Mar 31 at 1:56
</p>
</div>
<div class="right">
</div>

</div>
</body>
</html>
