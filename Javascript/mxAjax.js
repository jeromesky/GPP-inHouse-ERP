/**
 * Copyright 2005 Darren L. Spurgeon
 * Copyright 2006-2007 Arjun Kalura
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

var mxAjax = {
	Version: '0.3',
	onError: function(content, options) {
		if ( $("mxAjaxError") == null) {
			element = document.getElementsByTagName("head")[0];
    		new Insertion.After(element, '<div id="mxAjaxError"></div>');
		}
		$("mxAjaxError").innerHTML = content;
	}
}

function scriptPath() {
	var script = $A(document.getElementsByTagName("script")).findAll( function(s) {
	  return (s.src && s.src.match(/prototype\.js(\?.*)?$/))
	})
	script = script[0].src;
    return script.replace(/prototype\.js(\?.*)?$/,'');
}

function include(jsFileName) {
	document.write('<' + 'script src="' + jsFileName + '" language="javascript" type="text/javascript"' + '>' + '<' + '/script' + '>');
}

function isEmpty(o) {
  var i, v;
  if (isObject(o)) {
    for (i in o) {
      v = o[i];
      if (isUndefined(v) && isFunction(v)) {
        return false;
      }
    }
  }
  return true;
}

function isString(a) {
  return typeof a == 'string';
}

function isNull(a) {
  return typeof a == 'object' && !a;
}

function isFunction(a) {
  return typeof a == 'function';
}

function isObject(a) {
  return (a && typeof a == 'object') || isFunction(a);
}

function isUndefined(a) {
  return typeof a == 'undefined';
}

function addOnLoadEvent(func) {
  	var oldonload = window.onload;
  	if (typeof window.onload != 'function') {
    	window.onload = func;
  	} else {
    	window.onload = function() {
      		oldonload();
      		func();
    	}
  	}
}

/**
 * Global Variables
 */
AJAX_RATING_PARAMETER = "ajaxRatingParameter";
AJAX_PORTLET_MAX = 1;
AJAX_PORTLET_MIN = 2;
AJAX_PORTLET_CLOSE = 3;


//Load required library
var jsPath = scriptPath();
include(jsPath + "mxParam.js");
include(jsPath + "json.js");
include(jsPath + "mxParser.js");
include(jsPath + "DP_Debug.js");


/* ---------------------------------------------------------------------- */
/* Example File From "_JavaScript and DHTML Cookbook"
   Published by O'Reilly & Associates
   Copyright 2003 Danny Goodman
*/

// utility function to retrieve a future expiration date in proper format;
// pass three integer parameters for the number of days, hours,
// and minutes from now you want the cookie to expire; all three
// parameters required, so use zeros where appropriate
function getExpDate(days, hours, minutes) {
  var expDate = new Date();
  if (typeof days == "number" && typeof hours == "number" && typeof hours == "number") {
    expDate.setDate(expDate.getDate() + parseInt(days));
    expDate.setHours(expDate.getHours() + parseInt(hours));
    expDate.setMinutes(expDate.getMinutes() + parseInt(minutes));
    return expDate.toGMTString();
  }
}

// utility function called by getCookie()
function getCookieVal(offset) {
  var endstr = document.cookie.indexOf (";", offset);
  if (endstr == -1) {
    endstr = document.cookie.length;
  }
  return unescape(document.cookie.substring(offset, endstr));
}

// primary function to retrieve cookie by name
function getCookie(name) {
  var arg = name + "=";
  var alen = arg.length;
  var clen = document.cookie.length;
  var i = 0;
  while (i < clen) {
    var j = i + alen;
    if (document.cookie.substring(i, j) == arg) {
      return getCookieVal(j);
    }
    i = document.cookie.indexOf(" ", i) + 1;
    if (i == 0) break;
  }
  return null;
}

// store cookie value with optional details as needed
function setCookie(name, value, expires, path, domain, secure) {
  document.cookie = name + "=" + escape (value) +
    ((expires) ? "; expires=" + expires : "") +
    ((path) ? "; path=" + path : "") +
    ((domain) ? "; domain=" + domain : "") +
    ((secure) ? "; secure" : "");
}

// remove the cookie by setting ancient expiration date
function deleteCookie(name,path,domain) {
  if (getCookie(name)) {
    document.cookie = name + "=" +
      ((path) ? "; path=" + path : "") +
      ((domain) ? "; domain=" + domain : "") +
      "; expires=Thu, 01-Jan-70 00:00:01 GMT";
  }
}
/* ---------------------------------------------------------------------- */
/* End Copyright 2003 Danny Goodman */


var Window = {
	getWidth: function(){
	   if (document.documentElement.clientWidth != "") return document.documentElement.clientWidth;
		return window.innerWidth != null? window.innerWidth: document.documentElement && document.documentElement.clientWidth ? document.documentElement.clientWidth:document.body != null? document.body.clientWidth:null;
	},
	
	getPageHeight: function(){
	   if (document.documentElement.clientHeight != "") return document.documentElement.clientHeight;
		return window.innerHeight != null? window.innerHeight: document.documentElement && document.documentElement.clientHeight ? document.documentElement.clientHeight:document.body != null? document.body.clientHeight:null;
	},

	getWindowHeight: function(){
		return window.innerHeight != null? window.innerHeight: document.documentElement && document.documentElement.clientHeight ? document.documentElement.clientHeight:document.body != null? document.body.clientHeight:null;
	},

	getScrollHeight: function(){
		return document.documentElement.scrollHeight;
	},

	getScrollWidth: function(){
		return document.documentElement.scrollWidth;
	},

	getScrollTop: function(){
		return document.documentElement.scrollTop || window.pageYOffset || 0;
	},

	getScrollLeft: function(){
		return document.documentElement.scrollLeft || window.pageXOffset || 0;
	},
	
    getPosLeft: function() {
        return typeof window.pageXOffset != 'undefined' ? window.pageXOffset:document.documentElement && document.documentElement.scrollLeft? document.documentElement.scrollLeft:document.body.scrollLeft? document.body.scrollLeft:0;
    },

    getPosTop: function() {
        return typeof window.pageYOffset != 'undefined' ? window.pageYOffset:document.documentElement && document.documentElement.scrollTop? document.documentElement.scrollTop: document.body.scrollTop?document.body.scrollTop:0;
    },
	
	onDomReady: function(init){
		var state = document.readyState;
		if (state && document.childNodes && !document.all && !navigator.taintEnabled){ //khtml
			if (state.test(/loaded|complete/)) return init();
			else return Window.onDomReady.pass(init).delay(100);
		} else if (state && window.ActiveXObject){ //ie
			var script = $('_ie_ready_');
			if (!script) document.write("<script id='_ie_ready_' defer='true' src='://'></script>");
			$('_ie_ready_').addEvent('readystatechange', function(){
				if (this.readyState == 'complete') init();
			});
			return;
		} else { //others
			var myInit = function() {
				if (arguments.callee.done) return;
				arguments.callee.done = true;
				init();
			};
			window.addEvent("load", myInit);
			document.addEvent("DOMContentLoaded", myInit);
		}
	}
}
