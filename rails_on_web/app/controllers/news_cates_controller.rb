#encoding: utf-8
class NewsCatesController < InheritedResourcesBase
  before_filter :authenticate_admin_user!, :except => [:index, :show]

  def show
  	@news_cate = NewsCate.find_by_name(params[:name])
  	@news_cate = NewsCate.find_by_id(params[:id]) if @news_cate.nil?
    if @news_cate.nil?
      render :partial => "/layouts/no_found_error", :locals =>{:message => "没有找到任何信息"}
      return
    end
  	@news_items = @news_cate.news_items.paginate :page => params[:page] || 1, :per_page => 15
  end
end
