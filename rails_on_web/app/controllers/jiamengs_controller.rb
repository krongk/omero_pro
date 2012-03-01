#encoding: utf-8
class JiamengsController < InheritedResources::Base
  include ApplicationHelper
  
  before_filter :login_required, :except =>[:new, :create, :show]
  def login_required
  	if session[:user].blank?
  		flash[:notice] = "请先登录系统！"
  		redirect_to '/users/sign_in'
  	end
  end

  def create
  	super
  	flash[:notice] = "提交成功！"
  end
end
