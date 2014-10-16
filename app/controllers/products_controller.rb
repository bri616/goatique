class ProductsController < ApplicationController

  def new_product
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.vendor_id = session[:v_id]
    if @product.save
      redirect_to "/product/#{@product.vendor_id}/product_list"
    else
      redirect_to "/product/new_product"
    end
  end

  def product_list
    @products = Product.all
  end

end
