#encoding: utf-8
ActiveAdmin.register Customer do
  filter :name
  filter :birth
  filter :email
  
  index do 
    column :id
    column :name
    column :sex
    column :phone
    column :email

    column :updated_at
    column :is_deleted do |item|
    	item.is_deleted == 'n' ? '否' : '是'
    end
    default_actions
  end

  show do |item|
  	attributes_table do
  	  row :name
  	  row :sex
  	  row :phone
  	  row :email
  	  row :is_deleted
  	  row :created_at
  	  row :updated_at
  	end
  	
  	active_admin_comments
  end
end

 #  show do |ad|
	# attributes_table do
	# row :title
	# row :image do
	#   image_tag(ad.image.url)
	# end
	# end
	# active_admin_comments

 # show do
 #      h3 post.title
 #      div do
 #        simple_format post.body
 #      end
 #    end