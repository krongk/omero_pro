class Shop < ActiveRecord::Base
  belongs_to :region
  belongs_to :city
  belongs_to :district
end
