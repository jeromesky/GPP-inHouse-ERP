/*
$.editable.addInputType("datepicker", {
        element:  function(settings, original) {
            var input = $("<input type=\"text\" name=\"value\" />");
            $(this).append(input);
            return(input);
        },
        plugin:  function(settings, original) {
            var form = this;
            $("input", this).filter(":text").datepicker({
                onSelect: function(dateText) { $(this).hide(); $(form).trigger("submit"); }
            });
        }
    });
*/


/*
    DatePicker plugin for Jeditable(http://www.appelsiini.net/projects/jeditable), using datepicker plugin for jquery (http://www.eyecon.ro/datepicker/)
    Copyright (C) 2009 Enjalbert Vincent (WinWinWeb)

    Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:
	# The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.
	
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.
    
    vincent.enjalbert at gmail dot com (French, English)

 */
/////////////////////////////////////////////////////////THIS CODE IS FOR THE CALENDAR TO SHOW IN THE AREA
/*$.editable.addInputType('ui_datepicker', {
    element : function(settings, original) {
        var editable_datepicker = $('<div id="editable_datepicker">');
        $(this).append(editable_datepicker);

        var hidden = $('<input type="hidden" id="editable_datepicker_hidden">');
        $(this).append(hidden);

        $("#editable_datepicker", this).datepicker({
            dateFormat:"yy-mm-dd", 
            altField: '#editable_datepicker_hidden'});

        return(hidden);
    }
});*/
////////////////////////////////////////////////////////THIS CODE IS FOR CALENDAR ABOVE THE TEXT BOX  V2
$.editable.addInputType('ui_datepicker', {
    /* create input element */
    element : function(settings, original) {
        var input = $('<input class="datepick">');        
        $(this).append(input);
        return(input);
    },

    /* attach 3rd party plugin to input element */
    plugin : function(settings, original) {
        settings.onblur = null;
        if (settings.datepicker == null)
            $(".datepick", this).datepicker({
                dateFormat: "d M, yy",
                onSelect: function(dateText, inst) {
                    $(this).parents('form').submit();
                } 
            });
        else
         $(".datepick", this).datepicker(settings.datepicker);
    }
});




////////////////////////////////////////////////////////THIS CODE IS FOR CALENDAR ABOVE THE TEXT BOX  V2
/*
$.editable.addInputType('datepicker', {
  */  /* create input element */
/*    element : function(settings, original) {
        var input = $('<input style="display:none">');
        var picker = $('<div id="datepicker_">');
        
        $(this).append(input);
        $(this).append(picker);
        return(input);
    },
 */   /*
    
    submit: function (settings, original) {
    	 $("input", this).val( $("#datepicker_", this).DatePickerGetDate('d/m/Y') );
    },
    
    
    content : function(string, settings, original) {
        $('input', this).val('');
    },
    
    
  */  /* attach 3rd party plugin to input element */
/*    plugin : function(settings, original) {
        var form = this;
        settings.onblur = null;
        if(settings.datepicker == null)
        	$("#datepicker_", this).DatePicker({
					flat: true,
					date: '29/10/1985',
					format: 'd/m/Y',
					view: 'years',
					current: '29/10/1985',
					calendars: 1,
					starts: 1
				});
        else
        	$("#datepicker_", this).DatePicker(settings.datepicker);
    }
});*/