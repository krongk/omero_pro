#encoding: utf-8
ActiveAdmin.register Order do
  filter :code
  filter :phone
  filter :address
  filter :order_time
  filter :updated_at

  index do
  	column :id
  	column :customer do |item|
  		link_to item.customer.name, admin_customer_path(item.customer)
  	end
  	column :phone
  	column :address	
  	column :order_count
  	column :order_time
  	column :is_verfied do |item|
    	item.is_verfied == 'n' ? '否' : '是'
    end
  	column :note

  	default_actions
  end

end