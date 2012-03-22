#encoding: utf-8
module ApplicationHelper

  def is_ie?
    request.env["HTTP_USER_AGENT"] =~ /MSIE.*6.*Windows NT/i
  end

  def title(title)
  	content_for(:title){ title}
  end
  def page_title(page_title)
    content_for(:page_title){ page_title}
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
  	strs = ['<div id="nav_bar">']
  	bar_arr.each do |nav|
  	  strs << link_to(nav[0], nav[1], :class=> 'nav_bar_link')
      strs << " / "
  	end
    strs << "</div>"
  	content_for(:nav_bar){
  	  strs.join.html_safe
  	}
  end

  #显示边栏导航
  # 有父级
  # 通过父级显示所有子栏目
  # :style => ['page', 'news', 'product', 'shop']
  def side_nav(cate_name, style = 'page')
    str_arr = ["<ul class='side_nav'>"]
    case style
    when 'page'
      page = Page.find_by_title(cate_name)
      page = Page.first if page.nil?
      #我要洗衣特殊处理
      if page.path_name == 'customer'
        str_arr << "<h2 class='parent'><img src='/assets/ico1.jpg'/>我要洗衣</h2>"
        str_arr << "<li><a href='/news_cates/9'>最新活动</a></li>"
        str_arr << "<li><a href='/news_cates/11'>洗衣常识</a></li>"
        str_arr << "<li><a href='/customers/new'>会员注册</a></li>"
        str_arr << "<li><a href='/customer_login'>会员登录</a></li>" 
        str_arr << "<li><a href='/orders/new'>在线预约</a></li>" 
      else
        if page.parent_id == 0
          pages = Page.find_all_by_parent_id(page.id)
          str_arr << "<h2 class='parent'><img src='/assets/ico1.jpg'/>#{page.title || '关于欧美龙'}</h2>"
        else
          pages = Page.find_all_by_parent_id(page.parent_id)
          parent_page = Page.find_by_id(page.parent_id)
          str_arr << "<h2 class='parent'><img src='/assets/ico1.jpg'/>#{parent_page.title}</h2>" unless parent_page.nil?
        end
        pages.each do |cate|
          if cate.title == cate_name
            str_arr << "<li class='current'><a href='/pages/#{cate.id}'>#{cate.title}</a></li>" 
          else
            str_arr << "<li><a href='/pages/#{cate.id}'>#{cate.title}</a></li>" 
          end
        end
        str_arr << "<li><a href='/jiamengs/new'>我要加盟</a></li>"  if page.id == 10 || page.parent_id == 10
      end
    when 'news'
      str_arr << "<h2 class='parent'><img src='/assets/ico1.jpg'/>新闻中心</h2>"
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
      str_arr << "<h2 class='parent'><img src='/assets/ico1.jpg'/>分店信息中心</h2>"
      Region.all.sort{|r1,r2| r1.name.length <=> r2.name.length}.each do |region|
        str_arr << "<li>"
        str_arr << link_to(region.name, :controller => :shops, :action => :index, 'shop[region_id]' => region.id)
        str_arr << "</li>"
      end
    when 'product'
      str_arr << "<h2 class='parent'><img src='/assets/ico1.jpg'/>产品中心</h2>"
      ProductCate.all.each do |cate|
        if cate.name == cate_name
          str_arr << "<li class='current'><a href='/product_cates/#{cate.id}'>#{cate.name}</a></li>" 
        else
          str_arr << "<li><a href='/product_cates/#{cate.id}'>#{cate.name}</a></li>" 
        end
      end
      str_arr << "<li><a href='/pages/piyibaoyang'>皮衣保养</a></li>" 
      str_arr << "<li><a href='/pages/fuzhuangjiuzhi'>服装救治</a></li>" 
    when 'user'
      str_arr << "<h2 class='parent'><img src='/assets/ico1.jpg'/>会员中心</h2>"  
      str_arr << "<li><a href='/customers/new'>会员注册</a></li>"
      str_arr << "<li><a href='/customer_login'>会员登录</a></li>" 
      str_arr << "<li><a href='/orders/new'>在线预约</a></li>" 
    when 'customer'
      str_arr << "<h2 class='parent'><img src='/assets/ico1.jpg'/>会员中心</h2>"  
      str_arr << "<li><a href='/customers/new'>会员注册</a></li>"
      str_arr << "<li><a href='/customer_login'>会员登录</a></li>" 
      str_arr << "<li><a href='/orders/new'>在线预约</a></li>" 
    else
      'other'
    end
    str_arr << "</ul><br/>"

    content_for(:side_nav) do
      str_arr.join.html_safe
    end
  end
  #显示6条新闻，根据传入的分类，如果找不到则显示最新6条
  def side_news(cate_name)
    news_cate = NewsCate.find_by_name(cate_name)
    cate_id = news_cate.nil? ? 0 : news_cate.id
    
    str_arr = ['<h3 class="title">+ 相关新闻</h3><ul class="side_news_ul">']
    content_for(:side_news) do
      news_items = NewsItem.recent(12, cate_id)
      news_items.each_with_index do |item, index|
        str_arr << "<li><a class='gray2' href='/news_items/#{item.id}' target='_blank'>#{item.title.truncate(16)}</a></li>"
      end
      str_arr << "</ul>"
      str_arr << '<div class="more_red">'
      str_arr << link_to("更多>>", news_cate_path(cate_id))
      str_arr << '</div>'

      # str_arr << '<div class="side_news_image">'
      # news_items = NewsItem.recent(2, cate_id, true)
      # news_items.each_with_index do |item, index|
      #   str_arr << '<div class="news_content_img">'
      #   str_arr << image_tag(asset_path("side_news_image#{rand(10)}.jpg"), :width => "130", :align => "left")
      #   str_arr << strip_tags(item.body.to_s.gsub(/&nbsp;/, '')).truncate(120)
      #   str_arr << '<div class="more_red">'
      #   str_arr << link_to("查看详细...", news_item_path(item))
      #   str_arr << '</div></div>'
      # end
      # str_arr << '</div>'

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