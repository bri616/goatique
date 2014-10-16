class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def add_to_database
    @product = Product.new(params.require(:product).permit(:name, :description, :price))
    @product.save
    redirect_to "/products/index"
  end

  def index
    @products = Product.all
    render :index

  end

  def about
    @description = Product.find(params[:id]).description
    @price = Product.find(params[:id]).price
    @name = Product.find(params[:id]).name
    render :about

  end

end
