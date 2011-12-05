class ProductCatesController < InheritedResources::Base
  before_filter :authenticate_admin_user!, :except => [:index, :show]

  def show
  	@product_cate = ProductCate.find_by_id(params[:id]) ? ProductCate.find(params[:id]) : ProductCate.first
  	@product_items = ProductItem.where("product_cate_id = #{@product_cate.id}").paginate :page => params[:page], :order => 'updated_at DESC'
  end
end
