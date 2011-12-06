module ApplicationHelper

  def title(page_title)
  	content_for(:title){ page_title}
  end
  def meta_keywords(meta_keywords)
  	content_for(:meta_keywords){ meta_keywords}
  end
  def meta_description(meta_description)
  	content_for(:meta_description){ meta_description}
  end
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
end
