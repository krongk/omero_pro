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

end
