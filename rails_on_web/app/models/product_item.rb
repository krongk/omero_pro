#encoding: utf-8
class ProductItem < ActiveRecord::Base
  belongs_to :product_cate

  def self.recent(count)
    ProductItem.order("updated_at DESC").limit(count)
  end

  scope :"洗涤设备", joins("inner join product_cates e on product_cate_id = e.id WHERE e.name = '洗涤设备'")
  scope :"干洗用品", joins("inner join product_cates e on product_cate_id = e.id WHERE e.name = '干洗用品'")
  scope :"水洗用品", joins("inner join product_cates e on product_cate_id = e.id WHERE e.name = '水洗用品'")
  scope :"辅助设备", joins("inner join product_cates e on product_cate_id = e.id WHERE e.name = '辅助设备'")
  scope :"家用化工", joins("inner join product_cates e on product_cate_id = e.id WHERE e.name = '家用化工'")
  scope :"皮衣保养", joins("inner join product_cates e on product_cate_id = e.id WHERE e.name = '皮衣保养'")
end
