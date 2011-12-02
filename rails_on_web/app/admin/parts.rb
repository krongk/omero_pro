ActiveAdmin.register Part do
  filter :title

  index do
    column :id
    column :title
    column :body do |item|
      strip_tags(item.body).truncate(120) unless item.body.blank?
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
