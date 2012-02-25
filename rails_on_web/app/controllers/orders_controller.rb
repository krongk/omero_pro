#encoding: utf-8
class OrdersController < InheritedResources::Base
  before_filter :login_required
  def login_required
  	if session[:customer].blank?
  		flash[:notice] = "请先登录系统！只有会员才可以享受在线预订洗衣服务。"
  		redirect_to '/customer_login'
  	end
  end

  def create
  	super
  	@order.customer_id = session[:customer].id
  	@order.code = "#{session[:customer].id}-#{@order.id}-#{@order.order_time.to_s.gsub(/[^0-9]/, '')}"
  	@order.save
    flash[:notice] = "订单预约成功！"
  end

  def update
    super
    flash[:notice] = "订单修改成功！"
  end
end
