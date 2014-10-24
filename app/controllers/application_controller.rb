class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  before_filter :current_order
  before_filter :current_user


  def current_order
    if session[:order_id]
      @current_order = Order.find(session[:order_id])
    else
      @current_order = Order.create()
      session[:order_id] = @current_order.id
    end
  end

  def current_user
    if session[:loggedin_merchant_id]
      @current_user = Merchant.find(session[:loggedin_merchant_id])
    end
  end

end
