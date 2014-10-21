class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  before_filter :current_user



  def current_user

    if session[:pineapple_id]
      @current_user = Merchant.find(session[:pineapple_id])
    end

    # if @current_user = Merchant.find(session[:pineapple_id])
    #   return true
    # else
    #   return false
    # end


    # unless @current_user = Merchant.find(session[:pineapple_id])
    #   redirect_to "/home/login"
    # end

  end




end
