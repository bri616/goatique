class HomeController < ApplicationController

  def index

  end

  def search
   @products = Product.all
  render :index
  #  redirect_to :index
  end

end
