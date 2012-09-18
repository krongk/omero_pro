/*
  * see: https://github.com/lyconic/jquery.rest
  * Jquery通过Restful方式处理AJAX的插件， 负责城市、省份下拉框的处理
  *
 * Copyright (c) 2011 Lyconic, LLC.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
(function(a){function d(b,c,d,g){var h={dataType:"json"};return arguments.length===1&&typeof arguments[0]!="string"?(h=a.extend(h,b),"url"in h&&"data"in h&&e(h.url,h.data)):(a.isFunction(c)&&(g=d,d=c,c=null),b=e(b,c),h=a.extend(h,{url:b,data:c,success:function(a,b,c){d&&d.call(h.context||h,a,f(c),c)},error:function(a){g&&g.call(h.context||h,a,f(a))}})),h}function e(a,b){var c,d,e;for(c in b)e=b[c],d=a.replace("{"+c+"}",e),d!=a&&(a=d,delete b[c]);return a}function f(b){var d={},e=c.call(b.getAllResponseHeaders());return a.each(e.split("\n"),function(a,b){if(b.length){var e=b.match(/^([\w\-]+):(.*)/);e.length===3&&(d[e[1]]=c.call(e[2]))}}),b.responseHeaders=d,d}var b=a.ajax,c;c=String.prototype.trim||function(){return this.replace(/^\s\s*/,"").replace(/\s\s*$/,"")},a.restSetup={methodParam:"_method",useMethodOverride:!1},a(document).ready(function(){a.restSetup.csrfParam=a.restSetup.csrfParam||a("meta[name=csrf-param]").attr("content"),a.restSetup.csrfToken=a.restSetup.csrfToken||a("meta[name=csrf-token]").attr("content")}),a.ajax=function(c){var d=new RegExp("("+a.restSetup.csrfParam+"=)","i"),e=c.beforeSend,f;return typeof c.data!="string"&&c.data!=null&&(c.data=a.param(c.data)),c.data=c.data||"",a.restSetup.csrfParam&&a.restSetup.csrfToken&&(/^(get)$/i.test(c.type)||d.test(c.data)||(c.data+=(c.data?"&":"")+a.restSetup.csrfParam+"="+a.restSetup.csrfToken)),a.restSetup.useMethodOverride&&(/^(get|post)$/i.test(c.type)||(f=c.type.toUpperCase(),c.data+=(c.data?"&":"")+a.restSetup.methodParam+"="+c.type.toLowerCase(),c.type="POST")),c.beforeSend=function(b,d){var g=c.context||c,h=c.contentType,i=/.*\.(json|xml)/i.exec(c.url);h||(h=a.restSetup.contentType),!h&&i&&(h="application/"+i[1].toLowerCase()),c.contentType!=h&&a.extend(c,{contentType:h}),f&&b.setRequestHeader("X-HTTP-Method-Override",f),a.isFunction(e)&&e.call(g,b,d)},b.call(this,c)},a.read=function(){var b=d.apply(this,arguments);return b.type="GET",a.ajax(b)},a.create=function(){var b=d.apply(this,arguments);return b.type="POST",a.ajax(b)},a.update=function(){var b=d.apply(this,arguments);return b.type="PUT",a.ajax(b)},a.destroy=function(){var b=d.apply(this,arguments);return b.type="DELETE",a.ajax(b)}})(jQuery)