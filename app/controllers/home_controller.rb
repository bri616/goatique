class HomeController < ApplicationController

  def index
  end

  def login
  end

  def search
   @products = Product.all
  render :index
  #  redirect_to :index
  end

end
