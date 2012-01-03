#encoding: utf-8
ActiveAdmin.register ProductItem do
  scope :"洗涤设备"
  scope :"干洗用品"
  scope :"水洗用品"
  scope :"辅助设备"
  scope :"家用化工"
  scope :"皮衣保养"
  
  index do
    column :id
    column :'分类' do |item|
      item.product_cate.name unless item.product_cate.blank?
    end
    column :title do |item|
      link_to item.title, admin_product_item_path(item)
    end
    column :image_path do |item|
      image_tag item.image_path, :width => '80'
   
    end
    column :updated_at
    default_actions
  end

  show do |item|
    div :class => 'panel' do
        h3 '产品详情'
        div :class => 'panel_contents' do
            div :class =>"attributes_table product_cate", :id=>"attributes_table_product_cate_#{item.product_cate_id}" do
                table do
                  tr do
                    th '编号'
                    td item.id
                  end
                  tr do
                    th '产品分类'
                    td ProductCate.find(item.product_cate_id).name unless ProductCate.find(item.product_cate_id).nil?
                  end
                  tr do
                    th '产品名称'
                    td item.title
                  end
                  tr do
                    th '显示排序（数字越大越排前面）'
                    td item.sort_id
                  end
                  tr do
                    th '图片地址'
                    td item.image_path
                  end
                  tr do
                    th '产品详情'
                    td simple_format item.description
                  end
                end
            end
        end
    end
  end

end
