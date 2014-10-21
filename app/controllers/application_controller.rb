class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  before_filter :current_user



  def current_user

    if session[:loggedin_merchant_id]
      @current_user = Merchant.find(session[:loggedin_merchant_id])
    end

    # if @current_user = Merchant.find(session[loggedin_merchant_id])
    #   return true
    # else
    #   return false
    # end


    # unless @current_user = Merchant.find(session[loggedin_merchant_id])
    #   redirect_to "/home/login"
    # end

  end




end
