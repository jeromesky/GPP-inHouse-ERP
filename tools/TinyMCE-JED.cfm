<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="../javascript/jquery.js" ></script>
<script type="text/javascript" src="../Javascript/jeditable.js" ></script>
<script type="text/javascript" src="../javascript/jquery.charcounter.js"  ></script>
<script type="text/javascript" src="../Javascript/Tiny_mce/jscripts/tiny_mce/tiny_mce_src.js"></script>
<script type="text/javascript">

$.fn.tinymce = function(options){
   return this.each(function(){
      tinyMCE.execCommand("mceAddControl", true, this.id);
   });
}

function initMCE(){
   tinyMCE.init({mode : "none",
      theme : "advanced",
      theme_advanced_toolbar_location : "top",
      theme_advanced_toolbar_align : "left",
      theme_advanced_statusbar_location : "bottom",
      theme_advanced_buttons1 : "bold,italic,underline,strikethrough,separator,bullist,numlist,undo,redo,link,unlink",
      theme_advanced_buttons2 : "",
      theme_advanced_buttons3 : "",
      theme_advanced_resizing : true});
}

initMCE();
$.editable.addInputType('mce', {
   element : function(settings, original) {
      var textarea = $('<textarea id="'+$(original).attr("id")+'_mce"/>');
      if (settings.rows) {
         textarea.attr('rows', settings.rows);
      } else {
         textarea.height(settings.height);
      }
      if (settings.cols) {
         textarea.attr('cols', settings.cols);
      } else {
         textarea.width(settings.width);
      }
      $(this).append(textarea);
         return(textarea);
      },
   plugin : function(settings, original) {
      tinyMCE.execCommand("mceAddControl", true, $(original).attr("id")+'_mce');
      },
   submit : function(settings, original) {
      tinyMCE.triggerSave();
      tinyMCE.execCommand("mceRemoveControl", true, $(original).attr("id")+'_mce');
      },
   reset : function(settings, original) {
      tinyMCE.execCommand("mceRemoveControl", true, $(original).attr("id")+'_mce');
      original.reset();
   }
});
</script>
<script type="text/javascript">
$(function(){
   $('#foo').tinymce();
   
   $("#bar").editable(function(value, settings){
      console.log(this, value, settings);
      return value;
   
   }, {
      type : 'mce',
      submit : 'OK',
      indicator : "Saving...",
      tooltip : 'Click to edit...',
      width : '500px',
      height : '100px'
   });
});

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Petro21.com</title>
</head>
<body>
<textarea name="foo" id="foo">dfdfdfdfdsdsddfdf</textarea>
</body>
</html>