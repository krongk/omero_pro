class CitiesController < InheritedResourcesBase
  before_filter :authenticate_admin_user!, :except => [:index, :show]
  respond_to :json

  def index
  	@region = Region.find(params[:region_id])
  	@cities = @region.cities
  	respond_with(@cities) 
  end

  def show
  end

end

# Simple API in Rails 3 using respond_to and respond_with
#   http://davidwparker.com/2010/03/09/api-in-rails-respond-to-and-respond-with/

