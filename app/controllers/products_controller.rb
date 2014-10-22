class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def add_to_database
    puts "*"*80
    @product = Product.new(product_params)
    puts "&"*80
    puts @product.inspect
    puts "$"*80
    add_to_db(product_categories, new_categories)
    # @product.categories << Category.find(product_categories)
    if @product.save
      redirect_to "/products/index"
    else
      render :new
    end
  end

  def index
    @products = Product.all
    render :index
  end

  def about
    @product = Product.find(params[:id])
    render :about
  end

  def edit
    find_product
  end

  def update
    # raise params.inspect
    find_product
    @product.update(product_params)
    add_to_db(product_categories, new_categories)
    if @product.save
      redirect_to "/products/#{@product.id}/about"
    else
      render :edit
    end
  end

  def delete
    find_product
    @product.destroy
    redirect_to "/merchants/#{@product.merchant_id}"
  end

  def cart
    #render :"/cart"
  end

  def add_to_cart
    redirect_to "/cart"
  end

  # def show
  #   find_product
  # end

  #
  # def create
  #   @product = Product.new(product_params)
  #   @product.vendor_id = session[:v_id]
  #   if @product.save
  #     redirect_to "/product/#{@product.vendor_id}/product_list"
  #   else
  #     redirect_to "/product/new_product"
  #   end
  # end

  # def product_list
  #   @products = Product.all
  # end

  private
    def find_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :quantity, :merchant_id)
    end

    def product_categories
      params.require(:product).permit(categories: [])[:categories] # must specify that the categories key will point to an array of categories, because otherwise crazy shit happens. I am not too clear on what's happening here but it works
    end

    def new_categories
      params.require(:product).permit(:category_strings)[:category_strings]
    end

    def add_to_db(cats, strings)
      @product.categories.destroy_all
      cats.each {|cat| @product.categories << Category.find(cat)}

      strings_array = strings.include?(", ") ? strings.split(", ") : strings.split(" ")
      strings_array.each { |cat| @product.categories << Category.create(name: cat)}
    end
end
