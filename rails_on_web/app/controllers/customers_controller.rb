#encoding: utf-8
class CustomersController < InheritedResources::Base
  before_filter :login_required, :except =>[:new, :create, :customer_login, :customer_login_create]
  def login_required
  	redirect_to :action => :customer_login if session[:customer].blank?
  end
  def customer_login
  end
  def customer_login_create
  	#flash[:notice] = nil
  	flash[:notice] = "用户名不能为空!" if params[:name].blank?
  	flash[:notice] = "密码不能为空！"  if params[:password].blank?
  	@customer = Customer.find_by_name(params[:name].strip)
  	flash[:notice] = "用户名不存在" if @customer.nil?
  	if flash[:notice]
  		redirect_to '/customer_login'
  	elsif @customer && @customer.password.downcase == params[:password].to_s.strip.downcase
  		session[:customer] = @customer
  		flash[:notice] = "登录成功"
  	    redirect_to customer_path(@customer)
  	else
  		redirect_to "/customer_login"
  	end
  end

  def new
    captchs = [
      '8gk7','42rf','84cm','a699',
      'nvrk','p64c','tnu7','uzfs',
      'v5q9','vf53','wewa','wxx3']
    @captcha = captchs[rand(12)]
    super
    flash[:notice] = "会员注册成功！"
  end
  def create
    super
    session[:customer] = @customer
  end
  def customer_logout
    session[:customer] = nil
    redirect_to '/'
  end
end
