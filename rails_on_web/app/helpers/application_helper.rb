#encoding: utf-8
module ApplicationHelper

  def is_ie?
    request.env["HTTP_USER_AGENT"] =~ /MSIE.*6.*Windows NT/i
  end

  def title(page_title)
  	content_for(:title){ page_title}
  end
  def meta_keywords(meta_keywords)
  	content_for(:meta_keywords){ meta_keywords}
  end
  def meta_description(meta_description)
  	content_for(:meta_description){ meta_description}
  end
  
  #链接菜单导航，如：首页/关于我们
  #input: nav_bar [['首页', '/'], ['关于', '/about']]
  def nav_bar(bar_arr)
  	strs = []
  	bar_arr.each do |nav|
  	  strs << link_to(nav[0], nav[1], :class=> 'nav_bar_link')
  	end
  	str = strs.join(' / ')
    	content_for(:nav_bar){
    	  str.html_safe
    	}
  end

  #显示10条新闻，根据传入的分类，如果找不到则显示最新10条
  def side_news(cate_name)
    news_cate = NewsCate.find_by_name(cate_name)
    cate_id = news_cate.nil? ? 0 : news_cate.id
    news_items = NewsItem.recent(10, cate_id)
    str_arr = ['<tr><td class="black_bg"><h3 class="title">+ 相关新闻</h3></td></tr>']
    content_for(:side_news) do
      news_items.each_with_index do |item, index|
        str_arr << "<tr><td><span class='red_bg'>#{index + 1}</span><a class='gray' href='/news_items/#{item.id}' target='_blank'>#{item.title}</a></td></tr>"
      end
      str_arr.join.html_safe
    end
  end

  #flash动画显示
  # eg: play_flash("flash/top_banner.swf")
  # or: play_flash asset_path("flash/top_banner.swf"), :width => '985', :height => '249'
  def play_flash(src, options = {:width=>'600', :height=>'400'})
    str = "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' width='"+ options[:width] +"' height='"+ options[:height] +"' id='FlashID' accesskey='1' tabindex='1' title='omero'>
        <param name='movie' value='" + src + "' />
        <param name='quality' value='high' />
        <param name='wmode' value='transparent' />
        <param name='swfversion' value='9.0.45.0' />
        <param name='expressinstall' value='" + asset_path('Scripts/expressInstall.swf') + "' />
        <!--[if !IE]>-->
        <object type='application/x-shockwave-flash' data='" + src + "' width='"+  options[:width] +"' height='"+  options[:height] +"'>
          <!--<![endif]-->
          <param name='movie' value='" + src + "' />
          <param name='quality' value='high' />
          <param name='wmode' value='transparent' />
          <param name='swfversion' value='9.0.45.0' />
          <param name='expressinstall' value='"+ asset_path('Scripts/expressInstall.swf') + "' />
          <div>
            <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
            <p><a href='http://www.adobe.com/go/getflashplayer'><img src='http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif' alt='获取 Adobe Flash Player' width='112' height='33' /></a></p>
          </div>
          <!--[if !IE]>-->
        </object>
        <!--<![endif]-->
      </object>"
    return str.html_safe
  end

end