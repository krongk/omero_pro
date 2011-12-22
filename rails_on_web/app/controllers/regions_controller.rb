class RegionsController < InheritedResourcesBase
  before_filter :authenticate_admin_user!, :except => [:index, :show]

  def index
  	render :layout => nil
  end

  def show
  	@region = Region.find(params[:id])
  end

end