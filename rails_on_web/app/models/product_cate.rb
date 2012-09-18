class ProductCate < ActiveRecord::Base
  has_many :product_items

  #get recent new items
  def self.recent(count = 8, cate = nil)
  	conditions = cate.nil? ? "true" : "product_cate_id = #{cate}"
  	ProductItem.where(conditions).order("sort_id DESC").limit(count)
  end
end