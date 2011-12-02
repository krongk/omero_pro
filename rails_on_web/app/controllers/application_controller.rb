#encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :locate

  def locate
  	#ip = request.remote_id
  	ip = '118.113.226.34'
  	unless Rails.cache.exist?(ip)
	  	location = GeoLocation.find(ip)
	  	location[:country] = location[:country] == 'China' ? '中国' : location[:country]
	  	location[:region] = find_region(location[:region]) unless location[:region].blank?
	  	location[:city] = find_city(location[:city]) unless location[:city].blank?
      Rails.cache.write(ip, location)
	  end
  end

  private
  def find_region(region)
    regions = Region.where("en_name regexp '^#{region}'").limit(1)
    unless regions.empty?
      return regions.first.name
    end
    region
  end

  def find_city(city)
    cities = City.where("en_name regexp '^#{city}'").limit(1)
    unless cities.empty?
      return cities.first.name
    end
    city
  end
end

##==About Cache Key
# Rails.cache.exist?('speed')         # => false
# Rails.cache.read('speed')           # => nil
# Rails.cache.write('speed', 'fast!') # => true
# Rails.cache.exist?('speed')         # => true
# Rails.cache.read('speed')           # => "fast!"