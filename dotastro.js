/*

	.Astronomy Player
	Displays talks recorded at the .Astronomy conference
	Created by Stuart Lowe July 2012

*/
(function ($) {

	
	// Elements with the class "accessible" are intended for people who don't 
	// have Javascript enabled. If we are here they obviously do have Javascript.
	if(buzz.isOGGSupported() || buzz.isMP3Supported()) document.write('<style type="text/css"> .slide, .slides h3, .slides .timestamp, .audio h3, .credits h3 { display: none; height: 0px; } .slides li:first-child { display: inline-block; }</style>');
	
	// jQuery UI for the time slider
	/*! jQuery UI - v1.8.21 - 2012-06-05
	* https://github.com/jquery/jquery-ui
	* Includes: jquery.ui.core.js
	* Copyright (c) 2012 AUTHORS.txt; Licensed MIT, GPL */
	(function(a,b){function c(b,c){var e=b.nodeName.toLowerCase();if("area"===e){var f=b.parentNode,g=f.name,h;return!b.href||!g||f.nodeName.toLowerCase()!=="map"?!1:(h=a("img[usemap=#"+g+"]")[0],!!h&&d(h))}return(/input|select|textarea|button|object/.test(e)?!b.disabled:"a"==e?b.href||c:c)&&d(b)}function d(b){return!a(b).parents().andSelf().filter(function(){return a.curCSS(this,"visibility")==="hidden"||a.expr.filters.hidden(this)}).length}a.ui=a.ui||{};if(a.ui.version)return;a.extend(a.ui,{version:"1.8.21",keyCode:{ALT:18,BACKSPACE:8,CAPS_LOCK:20,COMMA:188,COMMAND:91,COMMAND_LEFT:91,COMMAND_RIGHT:93,CONTROL:17,DELETE:46,DOWN:40,END:35,ENTER:13,ESCAPE:27,HOME:36,INSERT:45,LEFT:37,MENU:93,NUMPAD_ADD:107,NUMPAD_DECIMAL:110,NUMPAD_DIVIDE:111,NUMPAD_ENTER:108,NUMPAD_MULTIPLY:106,NUMPAD_SUBTRACT:109,PAGE_DOWN:34,PAGE_UP:33,PERIOD:190,RIGHT:39,SHIFT:16,SPACE:32,TAB:9,UP:38,WINDOWS:91}}),a.fn.extend({propAttr:a.fn.prop||a.fn.attr,_focus:a.fn.focus,focus:function(b,c){return typeof b=="number"?this.each(function(){var d=this;setTimeout(function(){a(d).focus(),c&&c.call(d)},b)}):this._focus.apply(this,arguments)},scrollParent:function(){var b;return a.browser.msie&&/(static|relative)/.test(this.css("position"))||/absolute/.test(this.css("position"))?b=this.parents().filter(function(){return/(relative|absolute|fixed)/.test(a.curCSS(this,"position",1))&&/(auto|scroll)/.test(a.curCSS(this,"overflow",1)+a.curCSS(this,"overflow-y",1)+a.curCSS(this,"overflow-x",1))}).eq(0):b=this.parents().filter(function(){return/(auto|scroll)/.test(a.curCSS(this,"overflow",1)+a.curCSS(this,"overflow-y",1)+a.curCSS(this,"overflow-x",1))}).eq(0),/fixed/.test(this.css("position"))||!b.length?a(document):b},zIndex:function(c){if(c!==b)return this.css("zIndex",c);if(this.length){var d=a(this[0]),e,f;while(d.length&&d[0]!==document){e=d.css("position");if(e==="absolute"||e==="relative"||e==="fixed"){f=parseInt(d.css("zIndex"),10);if(!isNaN(f)&&f!==0)return f}d=d.parent()}}return 0},disableSelection:function(){return this.bind((a.support.selectstart?"selectstart":"mousedown")+".ui-disableSelection",function(a){a.preventDefault()})},enableSelection:function(){return this.unbind(".ui-disableSelection")}}),a.each(["Width","Height"],function(c,d){function h(b,c,d,f){return a.each(e,function(){c-=parseFloat(a.curCSS(b,"padding"+this,!0))||0,d&&(c-=parseFloat(a.curCSS(b,"border"+this+"Width",!0))||0),f&&(c-=parseFloat(a.curCSS(b,"margin"+this,!0))||0)}),c}var e=d==="Width"?["Left","Right"]:["Top","Bottom"],f=d.toLowerCase(),g={innerWidth:a.fn.innerWidth,innerHeight:a.fn.innerHeight,outerWidth:a.fn.outerWidth,outerHeight:a.fn.outerHeight};a.fn["inner"+d]=function(c){return c===b?g["inner"+d].call(this):this.each(function(){a(this).css(f,h(this,c)+"px")})},a.fn["outer"+d]=function(b,c){return typeof b!="number"?g["outer"+d].call(this,b):this.each(function(){a(this).css(f,h(this,b,!0,c)+"px")})}}),a.extend(a.expr[":"],{data:function(b,c,d){return!!a.data(b,d[3])},focusable:function(b){return c(b,!isNaN(a.attr(b,"tabindex")))},tabbable:function(b){var d=a.attr(b,"tabindex"),e=isNaN(d);return(e||d>=0)&&c(b,!e)}}),a(function(){var b=document.body,c=b.appendChild(c=document.createElement("div"));c.offsetHeight,a.extend(c.style,{minHeight:"100px",height:"auto",padding:0,borderWidth:0}),a.support.minHeight=c.offsetHeight===100,a.support.selectstart="onselectstart"in c,b.removeChild(c).style.display="none"}),a.extend(a.ui,{plugin:{add:function(b,c,d){var e=a.ui[b].prototype;for(var f in d)e.plugins[f]=e.plugins[f]||[],e.plugins[f].push([c,d[f]])},call:function(a,b,c){var d=a.plugins[b];if(!d||!a.element[0].parentNode)return;for(var e=0;e<d.length;e++)a.options[d[e][0]]&&d[e][1].apply(a.element,c)}},contains:function(a,b){return document.compareDocumentPosition?a.compareDocumentPosition(b)&16:a!==b&&a.contains(b)},hasScroll:function(b,c){if(a(b).css("overflow")==="hidden")return!1;var d=c&&c==="left"?"scrollLeft":"scrollTop",e=!1;return b[d]>0?!0:(b[d]=1,e=b[d]>0,b[d]=0,e)},isOverAxis:function(a,b,c){return a>b&&a<b+c},isOver:function(b,c,d,e,f,g){return a.ui.isOverAxis(b,d,f)&&a.ui.isOverAxis(c,e,g)}})})(jQuery);;/*! jQuery UI - v1.8.21 - 2012-06-05
	* https://github.com/jquery/jquery-ui
	* Includes: jquery.ui.widget.js
	* Copyright (c) 2012 AUTHORS.txt; Licensed MIT, GPL */
	(function(a,b){if(a.cleanData){var c=a.cleanData;a.cleanData=function(b){for(var d=0,e;(e=b[d])!=null;d++)try{a(e).triggerHandler("remove")}catch(f){}c(b)}}else{var d=a.fn.remove;a.fn.remove=function(b,c){return this.each(function(){return c||(!b||a.filter(b,[this]).length)&&a("*",this).add([this]).each(function(){try{a(this).triggerHandler("remove")}catch(b){}}),d.call(a(this),b,c)})}}a.widget=function(b,c,d){var e=b.split(".")[0],f;b=b.split(".")[1],f=e+"-"+b,d||(d=c,c=a.Widget),a.expr[":"][f]=function(c){return!!a.data(c,b)},a[e]=a[e]||{},a[e][b]=function(a,b){arguments.length&&this._createWidget(a,b)};var g=new c;g.options=a.extend(!0,{},g.options),a[e][b].prototype=a.extend(!0,g,{namespace:e,widgetName:b,widgetEventPrefix:a[e][b].prototype.widgetEventPrefix||b,widgetBaseClass:f},d),a.widget.bridge(b,a[e][b])},a.widget.bridge=function(c,d){a.fn[c]=function(e){var f=typeof e=="string",g=Array.prototype.slice.call(arguments,1),h=this;return e=!f&&g.length?a.extend.apply(null,[!0,e].concat(g)):e,f&&e.charAt(0)==="_"?h:(f?this.each(function(){var d=a.data(this,c),f=d&&a.isFunction(d[e])?d[e].apply(d,g):d;if(f!==d&&f!==b)return h=f,!1}):this.each(function(){var b=a.data(this,c);b?b.option(e||{})._init():a.data(this,c,new d(e,this))}),h)}},a.Widget=function(a,b){arguments.length&&this._createWidget(a,b)},a.Widget.prototype={widgetName:"widget",widgetEventPrefix:"",options:{disabled:!1},_createWidget:function(b,c){a.data(c,this.widgetName,this),this.element=a(c),this.options=a.extend(!0,{},this.options,this._getCreateOptions(),b);var d=this;this.element.bind("remove."+this.widgetName,function(){d.destroy()}),this._create(),this._trigger("create"),this._init()},_getCreateOptions:function(){return a.metadata&&a.metadata.get(this.element[0])[this.widgetName]},_create:function(){},_init:function(){},destroy:function(){this.element.unbind("."+this.widgetName).removeData(this.widgetName),this.widget().unbind("."+this.widgetName).removeAttr("aria-disabled").removeClass(this.widgetBaseClass+"-disabled "+"ui-state-disabled")},widget:function(){return this.element},option:function(c,d){var e=c;if(arguments.length===0)return a.extend({},this.options);if(typeof c=="string"){if(d===b)return this.options[c];e={},e[c]=d}return this._setOptions(e),this},_setOptions:function(b){var c=this;return a.each(b,function(a,b){c._setOption(a,b)}),this},_setOption:function(a,b){return this.options[a]=b,a==="disabled"&&this.widget()[b?"addClass":"removeClass"](this.widgetBaseClass+"-disabled"+" "+"ui-state-disabled").attr("aria-disabled",b),this},enable:function(){return this._setOption("disabled",!1)},disable:function(){return this._setOption("disabled",!0)},_trigger:function(b,c,d){var e,f,g=this.options[b];d=d||{},c=a.Event(c),c.type=(b===this.widgetEventPrefix?b:this.widgetEventPrefix+b).toLowerCase(),c.target=this.element[0],f=c.originalEvent;if(f)for(e in f)e in c||(c[e]=f[e]);return this.element.trigger(c,d),!(a.isFunction(g)&&g.call(this.element[0],c,d)===!1||c.isDefaultPrevented())}}})(jQuery);;/*! jQuery UI - v1.8.21 - 2012-06-05
	* https://github.com/jquery/jquery-ui
	* Includes: jquery.ui.mouse.js
	* Copyright (c) 2012 AUTHORS.txt; Licensed MIT, GPL */
	(function(a,b){var c=!1;a(document).mouseup(function(a){c=!1}),a.widget("ui.mouse",{options:{cancel:":input,option",distance:1,delay:0},_mouseInit:function(){var b=this;this.element.bind("mousedown."+this.widgetName,function(a){return b._mouseDown(a)}).bind("click."+this.widgetName,function(c){if(!0===a.data(c.target,b.widgetName+".preventClickEvent"))return a.removeData(c.target,b.widgetName+".preventClickEvent"),c.stopImmediatePropagation(),!1}),this.started=!1},_mouseDestroy:function(){this.element.unbind("."+this.widgetName),a(document).unbind("mousemove."+this.widgetName,this._mouseMoveDelegate).unbind("mouseup."+this.widgetName,this._mouseUpDelegate)},_mouseDown:function(b){if(c)return;this._mouseStarted&&this._mouseUp(b),this._mouseDownEvent=b;var d=this,e=b.which==1,f=typeof this.options.cancel=="string"&&b.target.nodeName?a(b.target).closest(this.options.cancel).length:!1;if(!e||f||!this._mouseCapture(b))return!0;this.mouseDelayMet=!this.options.delay,this.mouseDelayMet||(this._mouseDelayTimer=setTimeout(function(){d.mouseDelayMet=!0},this.options.delay));if(this._mouseDistanceMet(b)&&this._mouseDelayMet(b)){this._mouseStarted=this._mouseStart(b)!==!1;if(!this._mouseStarted)return b.preventDefault(),!0}return!0===a.data(b.target,this.widgetName+".preventClickEvent")&&a.removeData(b.target,this.widgetName+".preventClickEvent"),this._mouseMoveDelegate=function(a){return d._mouseMove(a)},this._mouseUpDelegate=function(a){return d._mouseUp(a)},a(document).bind("mousemove."+this.widgetName,this._mouseMoveDelegate).bind("mouseup."+this.widgetName,this._mouseUpDelegate),b.preventDefault(),c=!0,!0},_mouseMove:function(b){return!a.browser.msie||document.documentMode>=9||!!b.button?this._mouseStarted?(this._mouseDrag(b),b.preventDefault()):(this._mouseDistanceMet(b)&&this._mouseDelayMet(b)&&(this._mouseStarted=this._mouseStart(this._mouseDownEvent,b)!==!1,this._mouseStarted?this._mouseDrag(b):this._mouseUp(b)),!this._mouseStarted):this._mouseUp(b)},_mouseUp:function(b){return a(document).unbind("mousemove."+this.widgetName,this._mouseMoveDelegate).unbind("mouseup."+this.widgetName,this._mouseUpDelegate),this._mouseStarted&&(this._mouseStarted=!1,b.target==this._mouseDownEvent.target&&a.data(b.target,this.widgetName+".preventClickEvent",!0),this._mouseStop(b)),!1},_mouseDistanceMet:function(a){return Math.max(Math.abs(this._mouseDownEvent.pageX-a.pageX),Math.abs(this._mouseDownEvent.pageY-a.pageY))>=this.options.distance},_mouseDelayMet:function(a){return this.mouseDelayMet},_mouseStart:function(a){},_mouseDrag:function(a){},_mouseStop:function(a){},_mouseCapture:function(a){return!0}})})(jQuery);;/*! jQuery UI - v1.8.21 - 2012-06-05
	* https://github.com/jquery/jquery-ui
	* Includes: jquery.ui.slider.js
	* Copyright (c) 2012 AUTHORS.txt; Licensed MIT, GPL */
	(function(a,b){var c=5;a.widget("ui.slider",a.ui.mouse,{widgetEventPrefix:"slide",options:{animate:!1,distance:0,max:100,min:0,orientation:"horizontal",range:!1,step:1,value:0,values:null},_create:function(){var b=this,d=this.options,e=this.element.find(".ui-slider-handle").addClass("ui-state-default ui-corner-all"),f="<a class='ui-slider-handle ui-state-default ui-corner-all' href='#'></a>",g=d.values&&d.values.length||1,h=[];this._keySliding=!1,this._mouseSliding=!1,this._animateOff=!0,this._handleIndex=null,this._detectOrientation(),this._mouseInit(),this.element.addClass("ui-slider ui-slider-"+this.orientation+" ui-widget"+" ui-widget-content"+" ui-corner-all"+(d.disabled?" ui-slider-disabled ui-disabled":"")),this.range=a([]),d.range&&(d.range===!0&&(d.values||(d.values=[this._valueMin(),this._valueMin()]),d.values.length&&d.values.length!==2&&(d.values=[d.values[0],d.values[0]])),this.range=a("<div></div>").appendTo(this.element).addClass("ui-slider-range ui-widget-header"+(d.range==="min"||d.range==="max"?" ui-slider-range-"+d.range:"")));for(var i=e.length;i<g;i+=1)h.push(f);this.handles=e.add(a(h.join("")).appendTo(b.element)),this.handle=this.handles.eq(0),this.handles.add(this.range).filter("a").click(function(a){a.preventDefault()}).hover(function(){d.disabled||a(this).addClass("ui-state-hover")},function(){a(this).removeClass("ui-state-hover")}).focus(function(){d.disabled?a(this).blur():(a(".ui-slider .ui-state-focus").removeClass("ui-state-focus"),a(this).addClass("ui-state-focus"))}).blur(function(){a(this).removeClass("ui-state-focus")}),this.handles.each(function(b){a(this).data("index.ui-slider-handle",b)}),this.handles.keydown(function(d){var e=a(this).data("index.ui-slider-handle"),f,g,h,i;if(b.options.disabled)return;switch(d.keyCode){case a.ui.keyCode.HOME:case a.ui.keyCode.END:case a.ui.keyCode.PAGE_UP:case a.ui.keyCode.PAGE_DOWN:case a.ui.keyCode.UP:case a.ui.keyCode.RIGHT:case a.ui.keyCode.DOWN:case a.ui.keyCode.LEFT:d.preventDefault();if(!b._keySliding){b._keySliding=!0,a(this).addClass("ui-state-active"),f=b._start(d,e);if(f===!1)return}}i=b.options.step,b.options.values&&b.options.values.length?g=h=b.values(e):g=h=b.value();switch(d.keyCode){case a.ui.keyCode.HOME:h=b._valueMin();break;case a.ui.keyCode.END:h=b._valueMax();break;case a.ui.keyCode.PAGE_UP:h=b._trimAlignValue(g+(b._valueMax()-b._valueMin())/c);break;case a.ui.keyCode.PAGE_DOWN:h=b._trimAlignValue(g-(b._valueMax()-b._valueMin())/c);break;case a.ui.keyCode.UP:case a.ui.keyCode.RIGHT:if(g===b._valueMax())return;h=b._trimAlignValue(g+i);break;case a.ui.keyCode.DOWN:case a.ui.keyCode.LEFT:if(g===b._valueMin())return;h=b._trimAlignValue(g-i)}b._slide(d,e,h)}).keyup(function(c){var d=a(this).data("index.ui-slider-handle");b._keySliding&&(b._keySliding=!1,b._stop(c,d),b._change(c,d),a(this).removeClass("ui-state-active"))}),this._refreshValue(),this._animateOff=!1},destroy:function(){return this.handles.remove(),this.range.remove(),this.element.removeClass("ui-slider ui-slider-horizontal ui-slider-vertical ui-slider-disabled ui-widget ui-widget-content ui-corner-all").removeData("slider").unbind(".slider"),this._mouseDestroy(),this},_mouseCapture:function(b){var c=this.options,d,e,f,g,h,i,j,k,l;return c.disabled?!1:(this.elementSize={width:this.element.outerWidth(),height:this.element.outerHeight()},this.elementOffset=this.element.offset(),d={x:b.pageX,y:b.pageY},e=this._normValueFromMouse(d),f=this._valueMax()-this._valueMin()+1,h=this,this.handles.each(function(b){var c=Math.abs(e-h.values(b));f>c&&(f=c,g=a(this),i=b)}),c.range===!0&&this.values(1)===c.min&&(i+=1,g=a(this.handles[i])),j=this._start(b,i),j===!1?!1:(this._mouseSliding=!0,h._handleIndex=i,g.addClass("ui-state-active").focus(),k=g.offset(),l=!a(b.target).parents().andSelf().is(".ui-slider-handle"),this._clickOffset=l?{left:0,top:0}:{left:b.pageX-k.left-g.width()/2,top:b.pageY-k.top-g.height()/2-(parseInt(g.css("borderTopWidth"),10)||0)-(parseInt(g.css("borderBottomWidth"),10)||0)+(parseInt(g.css("marginTop"),10)||0)},this.handles.hasClass("ui-state-hover")||this._slide(b,i,e),this._animateOff=!0,!0))},_mouseStart:function(a){return!0},_mouseDrag:function(a){var b={x:a.pageX,y:a.pageY},c=this._normValueFromMouse(b);return this._slide(a,this._handleIndex,c),!1},_mouseStop:function(a){return this.handles.removeClass("ui-state-active"),this._mouseSliding=!1,this._stop(a,this._handleIndex),this._change(a,this._handleIndex),this._handleIndex=null,this._clickOffset=null,this._animateOff=!1,!1},_detectOrientation:function(){this.orientation=this.options.orientation==="vertical"?"vertical":"horizontal"},_normValueFromMouse:function(a){var b,c,d,e,f;return this.orientation==="horizontal"?(b=this.elementSize.width,c=a.x-this.elementOffset.left-(this._clickOffset?this._clickOffset.left:0)):(b=this.elementSize.height,c=a.y-this.elementOffset.top-(this._clickOffset?this._clickOffset.top:0)),d=c/b,d>1&&(d=1),d<0&&(d=0),this.orientation==="vertical"&&(d=1-d),e=this._valueMax()-this._valueMin(),f=this._valueMin()+d*e,this._trimAlignValue(f)},_start:function(a,b){var c={handle:this.handles[b],value:this.value()};return this.options.values&&this.options.values.length&&(c.value=this.values(b),c.values=this.values()),this._trigger("start",a,c)},_slide:function(a,b,c){var d,e,f;this.options.values&&this.options.values.length?(d=this.values(b?0:1),this.options.values.length===2&&this.options.range===!0&&(b===0&&c>d||b===1&&c<d)&&(c=d),c!==this.values(b)&&(e=this.values(),e[b]=c,f=this._trigger("slide",a,{handle:this.handles[b],value:c,values:e}),d=this.values(b?0:1),f!==!1&&this.values(b,c,!0))):c!==this.value()&&(f=this._trigger("slide",a,{handle:this.handles[b],value:c}),f!==!1&&this.value(c))},_stop:function(a,b){var c={handle:this.handles[b],value:this.value()};this.options.values&&this.options.values.length&&(c.value=this.values(b),c.values=this.values()),this._trigger("stop",a,c)},_change:function(a,b){if(!this._keySliding&&!this._mouseSliding){var c={handle:this.handles[b],value:this.value()};this.options.values&&this.options.values.length&&(c.value=this.values(b),c.values=this.values()),this._trigger("change",a,c)}},value:function(a){if(arguments.length){this.options.value=this._trimAlignValue(a),this._refreshValue(),this._change(null,0);return}return this._value()},values:function(b,c){var d,e,f;if(arguments.length>1){this.options.values[b]=this._trimAlignValue(c),this._refreshValue(),this._change(null,b);return}if(!arguments.length)return this._values();if(!a.isArray(arguments[0]))return this.options.values&&this.options.values.length?this._values(b):this.value();d=this.options.values,e=arguments[0];for(f=0;f<d.length;f+=1)d[f]=this._trimAlignValue(e[f]),this._change(null,f);this._refreshValue()},_setOption:function(b,c){var d,e=0;a.isArray(this.options.values)&&(e=this.options.values.length),a.Widget.prototype._setOption.apply(this,arguments);switch(b){case"disabled":c?(this.handles.filter(".ui-state-focus").blur(),this.handles.removeClass("ui-state-hover"),this.handles.propAttr("disabled",!0),this.element.addClass("ui-disabled")):(this.handles.propAttr("disabled",!1),this.element.removeClass("ui-disabled"));break;case"orientation":this._detectOrientation(),this.element.removeClass("ui-slider-horizontal ui-slider-vertical").addClass("ui-slider-"+this.orientation),this._refreshValue();break;case"value":this._animateOff=!0,this._refreshValue(),this._change(null,0),this._animateOff=!1;break;case"values":this._animateOff=!0,this._refreshValue();for(d=0;d<e;d+=1)this._change(null,d);this._animateOff=!1}},_value:function(){var a=this.options.value;return a=this._trimAlignValue(a),a},_values:function(a){var b,c,d;if(arguments.length)return b=this.options.values[a],b=this._trimAlignValue(b),b;c=this.options.values.slice();for(d=0;d<c.length;d+=1)c[d]=this._trimAlignValue(c[d]);return c},_trimAlignValue:function(a){if(a<=this._valueMin())return this._valueMin();if(a>=this._valueMax())return this._valueMax();var b=this.options.step>0?this.options.step:1,c=(a-this._valueMin())%b,d=a-c;return Math.abs(c)*2>=b&&(d+=c>0?b:-b),parseFloat(d.toFixed(5))},_valueMin:function(){return this.options.min},_valueMax:function(){return this.options.max},_refreshValue:function(){var b=this.options.range,c=this.options,d=this,e=this._animateOff?!1:c.animate,f,g={},h,i,j,k;this.options.values&&this.options.values.length?this.handles.each(function(b,i){f=(d.values(b)-d._valueMin())/(d._valueMax()-d._valueMin())*100,g[d.orientation==="horizontal"?"left":"bottom"]=f+"%",a(this).stop(1,1)[e?"animate":"css"](g,c.animate),d.options.range===!0&&(d.orientation==="horizontal"?(b===0&&d.range.stop(1,1)[e?"animate":"css"]({left:f+"%"},c.animate),b===1&&d.range[e?"animate":"css"]({width:f-h+"%"},{queue:!1,duration:c.animate})):(b===0&&d.range.stop(1,1)[e?"animate":"css"]({bottom:f+"%"},c.animate),b===1&&d.range[e?"animate":"css"]({height:f-h+"%"},{queue:!1,duration:c.animate}))),h=f}):(i=this.value(),j=this._valueMin(),k=this._valueMax(),f=k!==j?(i-j)/(k-j)*100:0,g[d.orientation==="horizontal"?"left":"bottom"]=f+"%",this.handle.stop(1,1)[e?"animate":"css"](g,c.animate),b==="min"&&this.orientation==="horizontal"&&this.range.stop(1,1)[e?"animate":"css"]({width:f+"%"},c.animate),b==="max"&&this.orientation==="horizontal"&&this.range[e?"animate":"css"]({width:100-f+"%"},{queue:!1,duration:c.animate}),b==="min"&&this.orientation==="vertical"&&this.range.stop(1,1)[e?"animate":"css"]({height:f+"%"},c.animate),b==="max"&&this.orientation==="vertical"&&this.range[e?"animate":"css"]({height:100-f+"%"},{queue:!1,duration:c.animate}))}}),a.extend(a.ui.slider,{version:"1.8.21"})})(jQuery);;
	
	// Full Screen API - http://johndyer.name/native-fullscreen-javascript-api-plus-jquery-plugin/
	var fullScreenApi = {
		supportsFullScreen: false,
		isFullScreen: function() { return false; },
		requestFullScreen: function() {},
		cancelFullScreen: function() {},
		fullScreenEventName: '',
		prefix: ''
	},
	browserPrefixes = 'webkit moz o ms khtml'.split(' ');
	// check for native support
	if (typeof document.cancelFullScreen != 'undefined') {
		fullScreenApi.supportsFullScreen = true;
	} else {
		// check for fullscreen support by vendor prefix
		for (var i = 0, il = browserPrefixes.length; i < il; i++ ) {
			fullScreenApi.prefix = browserPrefixes[i];
			if (typeof document[fullScreenApi.prefix + 'CancelFullScreen' ] != 'undefined' ) {
				fullScreenApi.supportsFullScreen = true;
				break;
			}
		}
	}
	// update methods to do something useful
	if (fullScreenApi.supportsFullScreen) {
		fullScreenApi.fullScreenEventName = fullScreenApi.prefix + 'fullscreenchange';
		fullScreenApi.isFullScreen = function() {
			switch (this.prefix) {
				case '':
					return document.fullScreen;
				case 'webkit':
					return document.webkitIsFullScreen;
				default:
					return document[this.prefix + 'FullScreen'];
			}
		}
		fullScreenApi.requestFullScreen = function(el) {
			return (this.prefix === '') ? el.requestFullScreen() : el[this.prefix + 'RequestFullScreen']();
		}
		fullScreenApi.cancelFullScreen = function(el) {
			return (this.prefix === '') ? document.cancelFullScreen() : document[this.prefix + 'CancelFullScreen']();
		}
	}
	// jQuery plugin
	if (typeof jQuery != 'undefined') {
		jQuery.fn.requestFullScreen = function() {
			return this.each(function() {
				if (fullScreenApi.supportsFullScreen) fullScreenApi.requestFullScreen(this);
			});
		};
	}
	// export api
	window.fullScreenApi = fullScreenApi;
	// End of Full Screen API
	
	// Disable text selection thanks to http://chris-barr.com/entry/disable_text_selection_with_jquery/
	$.extend($.fn.disableTextSelect = function() {
		return this.each(function(){
			if($.browser.mozilla) $(this).css('MozUserSelect','none'); //Firefox
			else if($.browser.msie) $(this).bind('selectstart',function(){return false;}); //IE
			else $(this).mousedown(function(){return false;}); //Opera, etc.
		});
	});
	
	
	// Main function
	function dotastro(inp){
	
		if(inp && typeof inp.el==="object") this.el = inp.el;
		else return {};

		// Get the base URL of this script - we'll use this for loading
	
		// Identify the default base directory
		this.basedir = $('script[src*="dotastro.js"]').attr('src');  // the JS file path
		var idx = this.basedir.lastIndexOf('/');
		if(idx >= 0) this.basedir = this.basedir.substring(0,idx+1);
		else this.basedir = "";

		var src = this.el.find('.download a').attr('href');
		src = src.substring(0,src.lastIndexOf('.'));
		this.file = (inp && typeof inp.sound==="string") ? inp.sound : src;
		this.multiple = (inp && typeof inp.multiple==="boolean") ? inp.multiple : false;
		
		this.sound = new buzz.sound( this.file+"_low", { formats: [ "ogg", "mp3" ], preload: false });
		this.soundalt = new buzz.sound( this.file, { formats: [ "ogg", "mp3" ], preload: false });
		this.bw = "low";
	
		// The current slide number
		this.slide = 0;
	
		// Is the presentation playing?
		this.playing = false;
	
		// A setInterval timer
		this.intervalID = false;
	
		// An array to store the start times of each slide
		this.slides = [];
	
		// An array to store the start times of each note/tweet
		this.messages = [];
	
		// Are we in fullscreen mode?
		this.fullscreen = false;
		
		// Is the mouse on the talk
		this.mouseover = false;
	
		// When did the mouse last move?
		this.lastmove = new Date();
	
		// Are we updating the notes/tweets to stay synced with the talk?
		this.tweetsinsync = true;
		
		// Do we allow keyboard input - for internal use to stop it activating when focus is on textareas/inputs
		this.allowkeyboard = true;
	
		if(buzz.isOGGSupported() || buzz.isMP3Supported()) this.init();
	
		return this;
	}
	
	dotastro.prototype.init = function(){
	
		// Initial DOM setup
	
		this.el.addClass('pres');
	
		var _obj = this;
		this.el.find('.slide').each(function(i){
			if(i == 0) $(this).show();
			_obj.slides.push(buzz.fromTimer(_obj.el.find('.slide:eq('+i+')').find('time').text()));
		});
		this.el.find('.slide').removeClass('one-fourth');

		this.el_slides = this.el.find('.slides');
		this.el_slides.disableTextSelect().prepend('<div class="overlay-splash"><div class="mainplay"><img src="'+this.basedir+'play.png" /></div></div><div class="overlay-controls"><div class="controls"><div class="controls_inner"><div class="play"><img src="'+this.basedir+'play.png" class="playing" title="Click to play" /><img src="'+this.basedir+'pause.png" class="paused" title="Click to pause" /></div><div class="controls_right"><div class="controls_row"><div class="volume"><img src="'+this.basedir+'volume.png" title="Click to mute" /></div><div class="mute"><img src="'+this.basedir+'mute.png" title="Click to unmute" /></div><div class="low_bw bandwidth"><img src="'+this.basedir+'sd.png" title="Low bandwidth audio - click to change" /></div><div class="high_bw bandwidth"><img src="'+this.basedir+'hd.png" title="High bandwidth audio - click to change" /></div>'+(fullScreenApi.supportsFullScreen ? '<div class="fullscreen"><img src="'+this.basedir+'fullscreen.png" title="Click to toggle fullscreen" /></div>' : '')+'<div class=\"clock\">00:00</div></div><div class="progress"><div class="progress_outer"><div class="progress_inner"><div class="progress_bar"></div></div></div></div></div></div></div></div>').bind('mousemove',{me:this},function(e){
			e.data.me.lastmove = new Date();
		}).addClass('slides-active').removeClass('slides-inactive');
	
		this.el.find('.download-inner').bind('click',{me:this},function(e){
			$(this).parent().find('ul').slideToggle("fast");
		}).parent().find('ul').removeClass('inactive').hide();
		
		this.el_slides.find('ul').removeClass('speakers').bind('click',{me:this},function(e){
			e.preventDefault();
			e.data.me.toggleControls();
		});
	
		this.el.find('.controls').disableTextSelect().hide();
		this.el.find('.paused').hide();
	
		this.total = buzz.fromTimer(this.el.find('.total').text())
	
		// Bind resize event
		$(window).resize({me:this},function(e){ e.data.me.sizeOverlay(); });

		// Bind mouse enter and out events to this talk
		this.el.on('mousemove',{player:this},function(e){
			e.data.player.mouseover = true;
		}).on('mouseleave',{player:this},function(e){
			e.data.player.mouseover = false;
		}).on('mouseenter',{player:this},function(e){
			e.data.player.mouseover = true;
		})

		this.el.find('.mainplay').bind('click',{me:this},function(e){
			e.data.me.togglePlay();
		});
	
		this.el.find('.play').bind('click',{me:this},function(e){
			e.preventDefault();
			e.data.me.togglePlay();
		});
	
		this.el.find('.slide').bind('click',{me:this},function(e){
			e.preventDefault();
		});
	
		this.el.find('.volume').bind('click',{me:this},function(e){
			e.preventDefault();
			e.data.me.sound.mute();
			$(this).hide();
			e.data.me.el.find('.mute').show();
		})
	
		this.el.find('.mute').bind('click',{me:this},function(e){
			e.preventDefault();
			e.data.me.sound.unmute();
			$(this).hide();
			e.data.me.el.find('.volume').show();
		}).hide();
	
		// Bind fullscreen event
		if(fullScreenApi.supportsFullScreen){
			// Bind the fullscreen function to the double-click event if the browser supports fullscreen
			this.el.find('.fullscreen').bind('click', {me:this}, function(e){
				e.data.me.toggleFullScreen();
			});
			this.el_slides.find('li.slide').bind('dblclick', {me:this}, function(e){
				e.data.me.toggleFullScreen();
			});
		}
	
		this.el.find('.progress_bar').slider({min:0,max:this.total}).bind("slidechange",{me:this},function(e,ui){
			if(e.originalEvent){
				e.data.me.skipTo($(this).slider("value"));
			}
		}).bind("slidestart",{me:this},function(e,ui){
			e.data.me.pause();
		}).bind("slidestop",{me:this},function(e,ui){
			e.data.me.play();	
		});
	
		this.el.find('.messages').bind('mouseenter',{me:this},function(e){
			e.data.me.tweetsinsync = false;
		}).bind('mouseleave',{me:this},function(e){
			e.data.me.tweetsinsync = true;
		});
	
		// Check for failure to load Twitter profile images
		if($('.profile_image img').length > 0) imageLoadError('.profile_image img');

		// Replace some unicode characters with HTML escapes
		$('li.tweet p').each(function(){ $(this).html($(this).html().replace(/\\u2014/,"&#8212;")); });

		// If the user has put focus on a textarea/input field we shouldn't do anything with their key presses
		$('textarea, input').bind('focus',{me:this},function(e){ e.data.me.allowkeyboard = false; }).bind('blur',{me:this},function(e){ e.data.me.allowkeyboard = true; });

		$(document).bind('keydown',{me:this},function(e){
			if(e.data.me.allowkeyboard && (!e.data.me.multiple || (e.data.me.multiple && e.data.me.mouseover))){
				var code = e.keyCode || e.charCode || e.which || 0;
				if(code==37) e.data.me.prevSlide();
				if(code==39) e.data.me.nextSlide();
				if(code==32){
					e.preventDefault();
					// Need to add logic for when there is more than one
					e.data.me.togglePlay(true);
				}
				if(code-49 > 0 && code-49 < 10){
					var s = code-49;
					e.data.me.skipTo(e.data.me.slides[s-1]);
				}
				if(code==84){
					//	messages
					e.data.me.toggleNotes();
				}
			}
		});
	
		if(window.location.hash){
			var s = parseInt(window.location.hash.substr(1));
			if(typeof s=="number" && s >= 0 && s <= this.slides.length){
				this.firstslide = s-1;
				this.skipTo(this.slides[s-1]);
			}
		}
		
		// Attach events to the bandwidth buttons
		this.el.find('.low_bw').addClass('selected').bind('click',{me:this},function(e){ e.data.me.setBandwidth("high"); });
		this.el.find('.high_bw').bind('click',{me:this},function(e){ e.data.me.setBandwidth("low"); });

		// As we are using the thumbnails (to reduce page load),
		// we now update the first slide to a higher resolution
		this.higherResolution(0);
	
		// Preload the next slide's higher resolution version
		this.preloadSlide(1);
	
		this.sizeOverlay();
	
		return this;
	}
	
	dotastro.prototype.sizeOverlay = function(){
	
		// Update the fullscreen status
		if(fullScreenApi.isFullScreen()){
			this.el.find('.slides').addClass('fullscreen');
			this.fullscreen = true;
		}else{
			this.el.find('.slides').removeClass('fullscreen');
			this.fullscreen = false;
		}
	
		var p = this.el.find('.slides');
		this.el.find('.overlay-controls').css({'width':0});
		var w = (this.fullscreen) ? screen.width : p.outerWidth();
		var h = (this.fullscreen) ? screen.height : p.outerHeight();		
	
		this.el.find('.overlay-controls').css({'width':w});
		if(this.fullscreen) this.el.find('.slides li').css({'width':w,'height':h});
		else this.el.find('.slides li').css({'width':'auto','height':'auto'});
		
		h = parseInt((h-65)/2);
		this.el.find('.mainplay').css({'margin-top':(h<0) ? 0 : h});
		this.el.find('.controls_right').css({'width':(w-65)});
		
	}
	
	dotastro.prototype.toggleFullScreen = function(){
		// Create an ID for the slides
		var id = "player_"+Math.random();
		// Update the slides ID
		this.el_slides.attr('id',id);
		// Get the .slides element
		this.elem = document.getElementById(id);
		if(fullScreenApi.isFullScreen()){
			fullScreenApi.cancelFullScreen(this.elem);
			this.fullscreen = false;
			this.el.find('.slides').removeClass('fullscreen');
		}else{
			fullScreenApi.requestFullScreen(this.elem);
			this.fullscreen = true;
			this.el.find('.slides').addClass('fullscreen');
		}
		this.sizeOverlay();
	}
	
	dotastro.prototype.toggleNotes = function(){
	
		this.el.find('.messages').toggle();
		if(this.el.find('.messages').is(':visible')) this.el.find('.slide-holder').removeClass('fullwidth');
		else this.el.find('.slide-holder').addClass('fullwidth');
		this.sizeOverlay();
	
	}
	
	dotastro.prototype.skipTo = function(t){
	
		this.sound.setTime(t);
		this.clock = t;
		this.updateScreen(t);
	
		if(this.video){
	
			// We need to work out the video offset
			this.video.currentTime = this.clock-this.slides[this.slide];
	
			// If the presentation is playing we should
			// start playing the video too
			if(this.playing) this.video.play();
			
		}
	}
	
	dotastro.prototype.updateScreen = function(t){
	
		var i = this.slide;
		var t1,t2;
		t1 = this.slides[i];
		t2 = (i < this.slides.length) ? this.slides[i] : this.total;
		
		if(t < t1 || t > t2){
			for(i = 0 ; i < this.slides.length ; i++){
				t1 = this.slides[i];
				t2 = (i < this.slides.length-1) ? this.slides[i+1] : this.total;
				if(t >= t1 && t < t2){
					this.showSlide(i);
					break;
				}
			}
		}
		if(this.tweetsinsync){
			var el;
			for(i = 0 ; i < this.messages.length ; i++){
				el = this.el.find('.messages ul li:eq('+i+')');
				if(this.messages[i] > t) el.hide();
				if((this.messages[i] <= t || t >= this.total) && !el.is(':visible')){
					if(this.bw == "low") el.show();
					else el.fadeIn();
				}
			}
		}
		this.el.find('.progress_bar').slider("value",t);
		this.el.find('.controls .clock').html(buzz.toTimer(t)+" / "+this.el.find('.total').text());
	
		if(t >= this.total) this.pause();
	
	}
	
	dotastro.prototype.first = function(){
	
		// Hide the main play button
		this.el.find('.mainplay').hide();
	
		// Show the controls
		this.showControls();
	
		// We are starting so we'll hide all but the first message
		this.el.find('.messages li:not(:first)').hide();

		// Reverse the messages list
		this.el.find('.messages ul').each(function(){
			var ul = $(this);
			ul.children().each(function(i, li){
				ul.prepend(li);
			});
		});
		
		// Get all the message times
		var _obj = this;
		this.el.find('.messages li .timestamp').each(function(i){
			_obj.messages.push(buzz.fromTimer($(this).attr('data')));
		});	
	
		if(this.firstslide){
			var t = this.slides[this.firstslide];
			this.skipTo(t);
		}
	}
	
	dotastro.prototype.togglePlay = function(hide){
	
		// Reset last move time
		this.lastmove = new Date();
	
		if(this.el.find('.mainplay').is(':visible')) this.first();
	
		this.sound.togglePlay();
		if(typeof hide!="boolean") hide = false;
		if(this.playing) this.pause(hide);
		else this.play(hide);
	}
	
	dotastro.prototype.pause = function(hide){
		this.sound.pause();
		if(this.video) this.video.pause();
		this.playing = false;
		clearInterval(this.intervalID);
		this.el.find('.paused').hide();
		this.el.find('.playing').show();
		if(hide) this.showControls();
	}
	
	dotastro.prototype.play = function(hide){
		this.sound.play();
		if(this.video) this.video.play();
		this.playing = true;
		this.intervalID = setInterval((function(self) {
			return function() {
				self.updateScreen(Math.round(self.sound.getTime()));
				if(self.el.find('.controls').is(':visible')){
					var d = new Date();
					if(d-self.lastmove > 3000) self.hideControls();
				}
			}
		})(this),1000);
		this.el.find('.paused').show();
		this.el.find('.playing').hide();
	}
	
	dotastro.prototype.toggleControls = function(){
		if(this.el.find('.controls').is(':visible')) this.hideControls();
		else this.showControls();
	}
	
	dotastro.prototype.hideControls = function(){
		if(this.bw == "low") this.el.find('.controls').hide();
		else this.el.find('.controls').slideUp();
		this.el.find('.overlay-controls').css({'z-index':0});
	}
	
	dotastro.prototype.showControls = function(){
		if(this.bw == "low") this.el.find('.controls').show();
		else this.el.find('.controls').slideDown();
		this.el.find('.overlay-controls').css({'z-index':10});
	}
	
	dotastro.prototype.setBandwidth = function(bw){
		if(typeof bw==="string" && bw != this.bw){
			// Update the buttons
			this.el.find('.low_bw').toggleClass('selected');
			this.el.find('.high_bw').toggleClass('selected');
			this.bw = bw;

			// Check if the sound is playing. If it is we
			// pause it and restart it once we've swapped.
			var playing = this.playing;
			if(playing) this.pause();
			var t = this.sound.getTime();
			
			// Swap sounds
			var sound = this.sound;
			this.sound = this.soundalt;
			this.soundalt = sound;
	
			// We can only restart the new sound if it is ready.
			// We'll set a readytoplay variable so that we don't
			// try to reload the sound if we've already got it.
			var _obj = this;
			if(this.sound.readytoplay){
				this.skipTo(t);
				if(playing) this.play();	
			}else{
				this.sound.bind("canplay",function(e){
					this.unbind('canplay');
					this.readytoplay = true;
					_obj.skipTo(t);
					if(playing) _obj.play();	
				}).load();
			}
		}
	}
	
	dotastro.prototype.higherResolutionSrc = function(img,full){
		var src = img.attr('src');
		var w = this.el.find('.slides').outerWidth();
		if(src){
			var idx = src.indexOf('_small');
			if(idx > 0){
				var a = src.substr(0,idx);
				if(full) return a+src.substr(idx+6);
				if(w > 200) return a+((w <= 500 || this.bw!="high") ? "_medium" : "")+src.substr(idx+6);
				else return src;
			}else{
				var idx = src.indexOf('_medium');
				if(idx > 0){
					var a = src.substr(0,idx);
					if(w > 500) return a+src.substr(idx+7);
				}
				return src;
			}
		}else return "";
	}

	dotastro.prototype.setImage = function(img,src){
		var _obj = this;
		img.on('load',function(){ _obj.sizeOverlay(); });
		img.attr('src',src);
	}

	dotastro.prototype.higherResolution = function(i){
		var img = this.el.find('.slide:eq('+i+') img');
		var src = "";
		if(img.length > 0) src = this.higherResolutionSrc(img, (i==0 ? true : false));
	
		if(src != ""){
	
			// If we are dealing with the first image we'll use
			// it to check the bandwidth
			if(this.el.find('.mainplay').is(':visible')){
	
				var _obj = {me:this,img:img,src:src};
				var request = $.ajax({
					type: "HEAD",
					url: src,
					success: function(){
						if(request.getResponseHeader("Content-Length")){
							var im = new Image();
							$(im).bind('load',{me:_obj.me,img:_obj.img,fileSize:request.getResponseHeader("Content-Length"),d:new Date()},function(e){
	
								// How long did it take to load?
								var dt = (new Date()-e.data.d)/1000;
								// Replace the image
								e.data.img.attr('src',$(this).attr('src'))
	
								// Check if the download rate seems too low
								// i.e. under, say, 40kbps
								var rate = e.data.fileSize/dt;
								e.data.me.setBandwidth((rate > 40000 ? "high" : "low"));
								e.data.me.sizeOverlay();
	
							}).attr({'src':src});
						}else{
							_obj.me.setImage(_obj.img,_obj.src);
						}
					},
					error: function(){
						// Likely here because we're running locally and the browser security model has kicked in
						_obj.me.setImage(_obj.img,_obj.src);
					}
				});
	
			}else{
				if(console && typeof console.log=="function") console.log('Using higher resolution version',src);
				img.attr('src',src);
				this.sizeOverlay();
			}
		}
	}
	
	dotastro.prototype.preloadSlide = function(i){
		var src = this.higherResolutionSrc(this.el.find('.slide:eq('+i+') img'));
		if(src != ""){
			if(console && typeof console.log=="function") console.log('Preloading',src);
			var pic = new Image();
			pic.src = src
		}
	}
	
	dotastro.prototype.showSlide = function(i){
	
		if(typeof i=="number"){
	
			// Have we changed slides?
			var changed = (this.slide != i)
	
			// Hide the old slide
			if(changed) this.el.find('.slide:visible').hide();
	
			// Store the current slide number
			this.slide = i;
	
			// Get the DOM element for the slide
			var s = this.el.find('.slide:eq('+this.slide+')');
	
			if(changed){
				this.higherResolution(i);
				if(i+1 < this.slides.length) this.preloadSlide(i+1);
			}
			// Show the current slide
			if(changed) s.show();
	
			// If this is a video slide
			// Get the DOM element for the slide
			this.video = (s.hasClass('slide-video')) ? document.getElementById('video'+(this.slide+1)) : "";
	
			// If the presentation is playing we should
			// start playing the video too
			if(this.video && this.playing) this.video.play();
	
		}
	
	}
	
	dotastro.prototype.prevSlide = function(){
		if(this.slide > 0){
			this.skipTo(this.slides[this.slide-1]);
		}
	}
	
	dotastro.prototype.nextSlide = function(){
		if(this.slide < this.slides.length-1){
			this.skipTo(this.slides[this.slide+1]);
		}
	}

	function imageLoadError(el){
		$(el).each(function(){
				// Work	around for error function reporting of file load failure
				this.src = this.src;
				$(this).bind('error',function() {
					$(this).replaceWith('@'+this.title);
					return true;
				})
		});
	}
	

	function supports_video() {
		return !!document.createElement('video').canPlayType;
	}
	
	$(document).ready(function(){

		$('#talk #slides').addClass('slides');
		$('#talk #credits').addClass('credits');
		$('#talk #messages').addClass('messages');
		$('#talk #audio').addClass('audio');
		var talks = new Array();
		if($('#talk').length > 0) talks.push(new dotastro({'el':$('#talk')}));
		else{
			if($('.talk').length > 0) $('.talk').each(function(i){ talks.push(new dotastro({'el':$(this),'multiple':true})); });
		}
	});

})(jQuery);
