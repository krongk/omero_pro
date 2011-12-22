class NewsItemsController < InheritedResourcesBase
  before_filter :authenticate_admin_user!, :except => [:index, :show]

  def index
  	@news_items = NewsItem.paginate :page => params[:page] || 1, :per_page => 20, :order => 'updated_at DESC'
  end
end
