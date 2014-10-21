class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception


  def current_order
    @current_order = Order.find(session[:order_id]) if session[:current_order_id]    
  end


  def sign_in

    if @current_user = Merchant.find(session[:pineapple_id])
      return true
    else
      return false
    end


    # unless @current_user = Merchant.find(session[:pineapple_id])
    #   redirect_to "/home/login"
    # end

  end




end
