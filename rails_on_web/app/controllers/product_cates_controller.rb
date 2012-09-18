class ProductCatesController < InheritedResourcesBase
  before_filter :authenticate_admin_user!, :except => [:index, :show]

  def index
  	@product_cates = ProductCate.all
  	
  end
  def show
    @product_cates = ProductCate.all
  	@product_cate = ProductCate.find_by_id(params[:id]) ? ProductCate.find(params[:id]) : ProductCate.first
  	@product_items = ProductItem.where("product_cate_id = #{@product_cate.id}").paginate :page => params[:page], :per_page => 24, :order => 'updated_at DESC'
  end
end
