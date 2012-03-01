#encoding: utf-8
class ApplicationController < ActionController::Base
  helper :all

  protect_from_forgery
  before_filter :locate
  

  #const
  # $REGIONS = Region.all.map{|r| {r.name => [r.id, r.en_name]}}
  # $CITIES = City.all.map{|r| {r.name => [r.id, r.en_name]}}


  #返回值
  #@location
  #  @location[:country] => '中国'
  #  @location[:region] => {'四川' => [23, 'Sichuan']} 
  #  location[:city] = {'成都' =>[234, 'Chengdu']}
  def locate
  	#ip = request.remote_id
  	ip = '222.210.173.116'
  	unless Rails.cache.exist?(ip)
	  	location = GeoLocation.find(ip)
	  	location[:country] = location[:country] == 'China' ? '中国' : location[:country]
      
      #region
      if location[:region].blank? || location[:region] =~ /(Unknown City)/i
        location[:region] = {'四川' => [23, 'Sichuan']} 
      else
        region_matchs = $REGIONS.select{|r| r.values[0][1] =~ /#{location[:region]}/i}
        if region_matchs.empty?
          location[:region] = {location[:region] => [nil, nil]}
        else
          location[:region] = region_matchs[0] #{'甘肃' => [28, 'GanSu']}
        end
      end
      #city
      if location[:city].blank? || location[:city] =~ /(Unknown City)/i
        location[:city] = {'成都' =>[234, 'Chengdu']}
      else
        city_matchs = $CITIES.select{|r| r.values[0][1] =~ /#{location[:city]}/i}
        if city_matchs.empty?
          location[:city] = {location[:city] => [nil, nil]}
        else
          location[:city] = region_matchs[0] # {'成都' => [234, 'ChengDu']}
        end
      end

      Rails.cache.write(ip, location)
	  end
    #used on views
    @location = Rails.cache.read(ip)
  end

end

##==About Cache Key
# Rails.cache.exist?('speed')         # => false
# Rails.cache.read('speed')           # => nil
# Rails.cache.write('speed', 'fast!') # => true
# Rails.cache.exist?('speed')         # => true
# Rails.cache.read('speed')           # => "fast!"