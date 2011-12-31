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

  #显示边栏导航
  # 有父级
  # 通过父级显示所有子栏目
  # :style => ['page', 'news', 'product', 'shop']
  def side_nav(cate_name, style = 'page')
    str_arr = ["<div class='side_top_img'>"]
    str_arr << image_tag(asset_path("2_03.jpg"))
    str_arr << "</div>"
    str_arr << ["<ul>"]
    case style
    when 'page'
      page = Page.find_by_title(cate_name)
      page = Page.first if page.nil?
      if page.parent_id == 0
        pages = Page.find_all_by_parent_id(page.id)
      else
        pages = Page.find_all_by_parent_id(page.parent_id)
      end
      pages.each do |cate|
        if cate.title == cate_name
          str_arr << "<li class='current'><a href='/pages/#{cate.id}'>#{cate.title}</a></li>" 
        else
          str_arr << "<li><a href='/pages/#{cate.id}'>#{cate.title}</a></li>" 
        end
      end
    when 'news'
      NewsCate.all.each do |cate|
        if cate.name == cate_name
          str_arr << "<li class='current'><a href='/news_cates/#{cate.id}'>#{cate.name}</a></li>" 
        else
          str_arr << "<li><a href='/news_cates/#{cate.id}'>#{cate.name}</a></li>" 
        end
      end
    when 'shop'
      #1.当店铺增多以后，左边显示相对应省份、区域的所有店铺列表
      # shops = Shop.find_all_by_region_id(cate_name.to_i)
      # shops = Shop.all.limit(10) if shops.empty?
      # shops.each_with_index do |cate, index|
      #   if cate.region_id.to_s == cate_name
      #     str_arr << "<li class='current'><a href='/shops/#{cate.id}'>#{cate.name}</a></li>" 
      #   else
      #     str_arr << "<li><a href='/shops/#{cate.id}'>#{cate.name}</a></li>" 
      #   end
      # end
      #2.当店铺不多时候，显示省份列表
      Region.all.sort{|r1,r2| r1.name.length <=> r2.name.length}.each do |region|
        str_arr << "<li>"
        str_arr << link_to(region.name, :controller => :shops, :action => :index, 'shop[region_id]' => region.id)
        str_arr << "</li>"
      end
    when 'product'
      ProductCate.all.each do |cate|
        if cate.name == cate_name
          str_arr << "<li class='current'><a href='/product_cates/#{cate.id}'>#{cate.name}</a></li>" 
        else
          str_arr << "<li><a href='/product_cates/#{cate.id}'>#{cate.name}</a></li>" 
        end
      end
    else
      'other'
    end
    str_arr << "</ul>"

    content_for(:side_nav) do
      str_arr.join.html_safe
    end
  end
  #显示10条新闻，根据传入的分类，如果找不到则显示最新10条
  def side_news(cate_name)
    news_cate = NewsCate.find_by_name(cate_name)
    cate_id = news_cate.nil? ? 0 : news_cate.id
    news_items = NewsItem.recent(10, cate_id)
    str_arr = ['<h3 class="title">+ 相关新闻</h3>']
    content_for(:side_news) do
      news_items.each_with_index do |item, index|
        str_arr << "<li><span class='red_bg'>#{index + 1}</span><a class='gray' href='/news_items/#{item.id}' target='_blank'>#{item.title}</a></li>"
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