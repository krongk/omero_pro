class ProductItemsController < InheritedResourcesBase
  before_filter :authenticate_admin_user!, :except => [:index, :show]

  def index
    @product_cates = ProductCate.all
    @product_items = ProductItem.paginate :page => params[:page], :per_page => 28, :order => 'updated_at DESC'
  end

end
