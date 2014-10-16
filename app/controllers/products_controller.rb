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
    @product = Product.find(params[:id])

    render :about

  end


  def cart
    render :"/cart"

  end


  def add_to_cart
    redirect_to "/cart"

  end

end
