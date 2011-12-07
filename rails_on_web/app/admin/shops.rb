#encoding: utf-8
ActiveAdmin.register Shop do

  form :partial => "form"

  index do
  	column :id
  	column :region_id do |item|
  	  Region.find_by_id(item.region_id).name
  	end
  	column :city_id do |item|
  	  City.find(item.city_id).name
  	end
  	column :district_id do |item|
  	  District.find(item.district_id).name
  	end
  	column :short_address
  	column :tel_phone
  	column :mobile_phone
  	default_actions
  end

  sidebar :"提示", :only => [:new, :edit] do
    "通过<a href='http://dev.baidu.com/wiki/static/map/API/tool/getPoint/' target='_blank'>百度坐标拾取工具</a>拾取分店地址的经纬度，以获取高精准的地图定位。".html_safe
  end

end
