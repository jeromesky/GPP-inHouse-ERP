/* 
 * jQuery - colapseble Fieldsets
 */

$.fn.collapse = function(options) {
	var defaults = {
		closed : false
	}
	settings = $.extend({}, defaults, options);

	return this.each(function() {
		var obj = $(this);
		obj.find("legend").addClass('collapsible').click(function() {
			if (obj.hasClass('collapsed'))
				obj.removeClass('collapsed').addClass('collapsible');
				obj.find("legend").removeClass('legendClose').addClass('legendOpen');
	
			$(this).removeClass('collapsed');
	
			obj.children().not('legend').toggle("fast", function() {
			 
				 if ($(this).is(":visible"))
					obj.find("legend").addClass('collapsible').addClass('legendClose');
				 else
					obj.addClass('collapsed').find("legend").addClass('collapsed').addClass('legendClose');
			 });
		});
		if (settings.closed) {
			obj.addClass('collapsed').find("legend").addClass('collapsed');
			obj.find("legend").addClass('legendOpen');
			obj.children().filter("p,img,table,ul,div,span,h1,h2,h3,h4,h5").css('display', 'none');
		}
	});
};



/* 
 * jQuery - Textbox Hinter plugin v1.0
 * http://www.aakashweb.com/
 * Copyright 2010, Aakash Chakravarthy
 * Released under the MIT License.
 */

(function($){$.fn.tbHinter=function(options){var defaults={text:'Enter a text ...',class:''};var options=$.extend(defaults,options);return this.each(function(){$(this).focus(function(){if($(this).val()==options.text){$(this).val('');$(this).removeClass(options.class)}});$(this).blur(function(){if($(this).val()==''){$(this).val(options.text);$(this).addClass(options.class)}});$(this).blur()})}})(jQuery);



/* 
 * jQuery - quicksearch plugin 
 * http://github.com/riklomas/quicksearch/blob/master/jquery.quicksearch.js
 */
jQuery(function ($) {
$.fn.quicksearch = function (target, opt) {

var timeout, cache, rowcache, jq_results, val = '', e = this, options = $.extend({
delay: 100,
selector: null,
stripeRows: null,
loader: null,
noResults: '',
bind: 'keyup',
onBefore: function () {
return;
},
onAfter: function () {
return;
},
show: function () {
this.style.display = "";
},
hide: function () {
this.style.display = "none";
},
prepareQuery: function (val) {
return val.toLowerCase().split(' ');
},
testQuery: function (query, txt, _row) {
for (var i = 0; i < query.length; i += 1) {
if (txt.indexOf(query[i]) === -1) {
return false;
}
}
return true;
}
}, opt);

this.go = function () {

var i = 0, noresults = true, query = options.prepareQuery(val);

var rowcache_length = rowcache.length;
for (var i = 0; i < rowcache_length; i++)
{
if (options.testQuery(query, cache[i], rowcache[i])) {
options.show.apply(rowcache[i]);
noresults = false;
} else {
options.hide.apply(rowcache[i]);
}
}

if (noresults) {
this.results(false);
} else {
this.results(true);
this.stripe();
}

this.loader(false);
options.onAfter();

return this;
};

this.stripe = function () {

if (typeof options.stripeRows === "object" && options.stripeRows !== null)
{
var joined = options.stripeRows.join(' ');
var stripeRows_length = options.stripeRows.length;

jq_results.not(':hidden').each(function (i) {
$(this).removeClass(joined).addClass(options.stripeRows[i % stripeRows_length]);
});
}

return this;
};

this.strip_html = function (input) {
var output = input.replace(new RegExp('<[^<]+\>', 'g'), "");
output = $.trim(output.toLowerCase());
return output;
};

this.results = function (bool) {
if (typeof options.noResults === "string" && options.noResults !== "") {
if (bool) {
$(options.noResults).hide();
} else {
$(options.noResults).show();
}
}
return this;
};

this.loader = function (bool) {
if (typeof options.loader === "string" && options.loader !== "") {
(bool) ? $(options.loader).show() : $(options.loader).hide();
}
return this;
};

this.cache = function () {

jq_results = $(target);

if (typeof options.noResults === "string" && options.noResults !== "") {
jq_results = jq_results.not(options.noResults);
}

var t = (typeof options.selector === "string") ? jq_results.find(options.selector) : $(target).not(options.noResults);
cache = t.map(function () {
return e.strip_html(this.innerHTML);
});

rowcache = jq_results.map(function () {
return this;
});

return this.go();
};

this.trigger = function () {
this.loader(true);
options.onBefore();

window.clearTimeout(timeout);
timeout = window.setTimeout(function () {
e.go();
}, options.delay);

return this;
};

this.cache();
this.results(true);
this.stripe();
this.loader(false);

return this.each(function () {
$(this).bind(options.bind, function () {
val = $(this).val();
e.trigger();
});
});

};
});

/////////////////////////////////////
////////////////////////////////////edit in place date picker
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