class MerchantsController < ApplicationController

  def index
    @merchants = Merchant.all
  end

  def new
    @merchant = Merchant.new
  end

  def create
    @merchant = Merchant.new(merchant_params)
    if @merchant.save
      redirect_to "/merchants/#{@merchant.id}"
    else
      render :new
    end
  end

  def show
    find_merchant
  end

  def edit
    find_merchant
  end

  def update
    find_merchant
    if @merchant == @current_user
      if @merchant.update(params.require(:merchant).permit(:shop_name, :description))
        redirect_to merchant_show_path
      else
        render :edit
      end
    end
  end


  private
    def merchant_params
      params.require(:merchant).permit(:email, :user_name, :shop_name, :description, :password, :password_confirmation)
    end

    def find_merchant
      @merchant = Merchant.find(params[:id])
    end
end
