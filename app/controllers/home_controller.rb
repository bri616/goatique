class HomeController < ApplicationController

  def index
  end

  def authenticate_user
    redirect_to "/"
  end

  def search
   @products = Product.all
  render :index
  #  redirect_to :index
  end

end
