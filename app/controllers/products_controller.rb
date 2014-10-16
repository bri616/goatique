class ProductsController < ApplicationController

  def show
    find_product
  end

  private
  def find_product
    @product = Product.find(params[:id])
  end
end
