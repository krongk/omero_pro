class ResourceCatesController < InheritedResourcesBase
  before_filter :authenticate_admin_user!, :except => [:index, :show]
end
