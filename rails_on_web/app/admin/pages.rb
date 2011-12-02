ActiveAdmin.register Page do
  filter :title
  filter :position
  filter :menu_match
  filter :updated_at
  filter :show_in_menu
  filter :deletable

  index do
    column :id
    column :title do |item|
      link_to item.title, admin_page_path(item)
    end
    column :body do |item|
      strip_tags(item.body).truncate(80) unless item.body.blank?
    end
    column :path_name
    column :updated_at do |item|
      item.updated_at.strftime("%Y-%m-%d")
    end
    default_actions
  end

  show do |item|
    h3 item.title, :class => 'admin_title'
    div :class => 'admin_content' do
      simple_format item.body
    end
  end
end
