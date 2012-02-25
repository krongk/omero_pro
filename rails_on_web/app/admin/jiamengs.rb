#encoding: utf-8
ActiveAdmin.register Jiameng do
  filter :name
  filter :phone
  filter :address

  index do
  	column :id
  	column :name
  	column :sex
  	column :phone
  	column :address
  	column :is_verfied do |item|
    	item.is_verfied == 'n' ? '否' : '是'
    end
  	column :note
  	column :updated_at
  	default_actions
  end
end