#encoding: utf-8
class HomeController < ApplicationController
  def index
  	#redirect_to :action => :location
  end

  #It's a location tip, you can set lawyer => nil, and modify 'views/home/location.html.erb' to 'view/home/_location.html.erb'
  def location
  	#@ip = request.remote_id
  	@ip = '118.113.226.34'
  	@location = Rails.cache.read(@ip)
  end

  def site_map
  end

  #==========================================
  #HTML Design Demo
  #==========================================
  def img
    #handle css3 img style
  end
  def slide_nav
    #handle css3 slide img
  end
  def nav_img_and_jquery
    #handle css3 slide img
  end
  def nav_img_and_jquery2
    #handle css3 slide img
  end
end


	# City.find_each do |city|
	#   arr = city.en_name.split(' ')
	#   if ['shi', 'qu'].include?(arr[-1])
	#     arr.pop
	#   end
	#   city.en_name = arr.join.capitalize
	#   city.save
	# end;nil