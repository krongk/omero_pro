#encoding: utf-8
class ResourceItem < ActiveRecord::Base
  belongs_to :resource_cate
  attr_accessor :upload_file

  def self.type_hash
  	{1 => 'picture', 2 => 'file', 3 => 'video', 4 => 'audio', 5 => 'flash'}
  end

  def self.recent(count)
    ResourceItem.order("updated_at DESC").limit(count)
  end

  scope :"产品-洗涤设备", joins("inner join resource_cates e on resource_cate_id = e.id WHERE e.name = '产品-洗涤设备'")
  scope :"产品-干洗用品", joins("inner join resource_cates e on resource_cate_id = e.id WHERE e.name = '产品-干洗用品'")
  scope :"产品-水洗用品", joins("inner join resource_cates e on resource_cate_id = e.id WHERE e.name = '产品-水洗用品'")
  scope :"产品-辅助设备", joins("inner join resource_cates e on resource_cate_id = e.id WHERE e.name = '产品-辅助设备'")
  scope :"产品-家用化工", joins("inner join resource_cates e on resource_cate_id = e.id WHERE e.name = '产品-家用化工'")
  scope :"产品-皮衣保养", joins("inner join resource_cates e on resource_cate_id = e.id WHERE e.name = '产品-皮衣保养'")
end
