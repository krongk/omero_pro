class SitesController < InheritedResourcesBase
  before_filter :authenticate_admin_user!, :except => [:index, :show]
end
