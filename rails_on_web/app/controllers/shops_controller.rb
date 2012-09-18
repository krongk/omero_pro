#encoding: utf-8
class ShopsController < InheritedResourcesBase
  before_filter :authenticate_admin_user!, :except => [:index, :show, :update_cities, :update_districts]
  before_filter :locate

  def index
  	if params[:shop]
  	  @shops = search
  	else
  	  @shops = Shop.all
  	end
    @regions     = Region.find(:all)
  end

  # POST /shops
  # 为了改变后台添加，成功后，调整到后台，而非前台
  def create
    super do |format|
      format.html { redirect_to admin_shops_path }
    end
    # @shop = Shop.new(params[:shop])

    # respond_to do |format|
    #   if @shop.save
    #     format.html { redirect_to admin_shops_path, notice: t(:success) }
    #     format.json { render json: @shop, status: :created, location: @shop }
    #   else
    #     format.html { render new_admin_shop_path }
    #     format.json { render json: @shop.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
    super do |format|
      format.html { redirect_to admin_shops_path}
    end
  end

  private
  #{"utf8"=>"✓", "shop"=>{"region_id"=>"6", "city_id"=>"43", "district_id"=>"482"}, "x"=>"55", "y"=>"28", "action"=>"search", "controller"=>"shops"}
  def search
  	shops = Shop.where(:district_id => params[:shop][:district_id])
  	shops = Shop.where(:city_id => params[:shop][:city_id]) if shops.empty?
  	shops = Shop.where(:region_id => params[:shop][:region_id]) if shops.empty?
  	return shops
  end
end


