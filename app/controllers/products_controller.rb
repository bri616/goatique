class ProductsController < ApplicationController

  def new
    @product = Product.new
  end




  def add_to_database
    @product = Product.new(params.require(:product).permit(:name, :description, :price))
    @product.save
    redirect_to "/products/new"
  end

end
