class NewsItemsController < InheritedResourcesBase
  before_filter :authenticate_admin_user!, :except => [:index, :show]

  def index
  	#for search
  	if params[:q]
  	  @news_items = NewsItem.where("title like '%#{params[:q]}%'").paginate :page => params[:page] || 1, :per_page => 20, :order => 'updated_at DESC'
  	else
  	  @news_items = NewsItem.paginate :page => params[:page] || 1, :per_page => 20, :order => 'updated_at DESC'
  	end
  end

  def show
    @news_item = NewsItem.find_by_id(params[:id] || 1)
  end
end
