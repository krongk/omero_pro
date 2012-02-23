#encoding: utf-8
class OrdersController < InheritedResources::Base
  before_filter :login_required
  def login_required
  	if session[:customer].blank?
  		flash[:notice] = "请先登录系统！"
  		redirect_to :action => :customer_login 
  	end
  end

  def create
  	super
  	@order.customer_id = session[:customer].id
  	@order.code = "#{session[:customer].id}-#{@order.order_time.to_s.gsub(/[^0-9]/, '')}"
  	@order.save
  end
end
