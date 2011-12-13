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
  	str = strs.join('/')
    	content_for(:nav_bar){
    	  str.html_safe
    	}
  end

  #显示10条新闻，根据传入的分类，如果找不到则显示最新10条
  def side_news(cate_name)
    news_cate = NewsCate.find_by_name(cate_name)
    cate_id = news_cate.nil? ? 0 : news_cate.id
    news_items = NewsItem.recent(10, cate_id)
    str_arr = ["<tr><td><h3>相关新闻</h3></td></tr>"]
    content_for(:side_news) do
      news_items.each do |item|
        str_arr << "<tr><td><span class='cord'>&nbsp;</span><a class='gray' href='/news_items/#{item.id}' target='_blank'>#{item.title}</a></td></tr>"
      end
      str_arr << "<tr><td>&nbsp;</td></tr>"
      str_arr.join.html_safe
    end
  end

end
