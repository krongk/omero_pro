class DistrictsController < InheritedResourcesBase
  before_filter :authenticate_admin_user!, :except => [:index, :show]
  respond_to :json

  def index
  	@city = City.find(params[:city_id])
  	@districts = @city.districts
  	respond_with(@districts)
  end

  def show
  end

end
