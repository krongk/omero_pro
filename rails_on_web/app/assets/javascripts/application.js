// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require tinymce
//= require_tree .


// <a onclick="AddFavorite(window.location,document.title)" style="cursor:hand">收藏</a>&nbsp;&nbsp;&nbsp;
// <a onclick="SetHome(this,window.location)" style="cursor:hand">设为首页</a>
//添加到收藏
 function AddFavorite(sURL, sTitle)
{
    try
    {
        window.external.addFavorite(sURL, sTitle);
    }
    catch (e)
    {
        try
        {
            window.sidebar.addPanel(sTitle, sURL, "");
        }
        catch (e)
        {
            alert("加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}
//设为主页
function SetHome(obj,vrl)
{
    try
    {
        obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);
    }
    catch(e){
	    if(window.netscape) {
            try {
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
            } 
            catch (e) { 
                alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将[signed.applets.codebase_principal_support]设置为'true'"); 
            }
            var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
            prefs.setCharPref('browser.startup.homepage',vrl);
	     }
    }
}


/*滚动插件
* vertical news ticker
* Tadas Juozapaitis ( kasp3rito@gmail.com )
* http://www.jugbit.com/jquery-vticker-vertical-news-ticker/
*/
(function( $ ) {
$.fn.vTicker = function(options) {
    var defaults = {
        speed: 700,
        pause: 4000,
        showItems: 10,
        animation: '',
        mousePause: true,
        isPaused: false,
        direction: 'up',
        height: 0
    };

    var options = $.extend(defaults, options);

    moveUp = function(obj2, height, options){
        if(options.isPaused)
            return;
        
        var obj = obj2.children('ul');
        
        var clone = obj.children('li:first').clone(true);
        
        if(options.height > 0)
        {
            height = obj.children('li:first').outerHeight();
        }       
        
        obj.animate({top: '-=' + height + 'px'}, options.speed, function() {
            $(this).children('li:first').remove();
            $(this).css('top', '0px');
        });
        
        if(options.animation == 'fade')
        {
            obj.children('li:first').fadeOut(options.speed);
            if(options.height == 0)
            {
            obj.children('li:eq(' + options.showItems + ')').hide().fadeIn(options.speed).show();
            }
        }

        clone.appendTo(obj);
    };
    
    moveDown = function(obj2, height, options){
        if(options.isPaused)
            return;
        
        var obj = obj2.children('ul');
        
        var clone = obj.children('li:last').clone(true);
        
        if(options.height > 0)
        {
            height = obj.children('li:first').outerHeight();
        }
        
        obj.css('top', '-' + height + 'px')
            .prepend(clone);
            
        obj.animate({top: 0}, options.speed, function() {
            $(this).children('li:last').remove();
        });
        
        if(options.animation == 'fade')
        {
            if(options.height == 0)
            {
                obj.children('li:eq(' + options.showItems + ')').fadeOut(options.speed);
            }
            obj.children('li:first').hide().fadeIn(options.speed).show();
        }
    };
    
    return this.each(function() {
        var obj = $(this);
        var maxHeight = 0;

        obj.css({overflow: 'hidden', position: 'relative'})
            .children('ul').css({position: 'absolute', margin: 0, padding: 0})
            .children('li').css({margin: 0, padding: 0});

        if(options.height == 0)
        {
            obj.children('ul').children('li').each(function(){
                if($(this).outerHeight() > maxHeight)
                {
                    maxHeight = $(this).outerHeight();
                }
            });

            obj.children('ul').children('li').each(function(){
                $(this).height(maxHeight);
            });

            obj.height(maxHeight * options.showItems);
        }
        else
        {
            obj.height(options.height);
        }
        
        var interval = setInterval(function(){ 
            if(options.direction == 'up')
            { 
                moveUp(obj, maxHeight, options); 
            }
            else
            { 
                moveDown(obj, maxHeight, options); 
            } 
        }, options.pause);
        
        if(options.mousePause)
        {
            obj.bind("mouseenter",function(){
                options.isPaused = true;
            }).bind("mouseleave",function(){
                options.isPaused = false;
            });
        }
    });
};
})( jQuery );
