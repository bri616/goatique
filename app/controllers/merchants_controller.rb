class MerchantsController < ApplicationController
  protect_from_forgery

  def index
    @merchants = Merchant.all
  end

  def new
    @merchant = Merchant.new
  end

  def create
    @merchant = Merchant.create(merchant_params)
    # raise params.inspect
    redirect_to "/merchants/#{@merchant.id}"
  end

  def show
    # puts "i'm in merchant#show"
    find_merchant
  end

  private
  def merchant_params
    params.require(:merchant).permit(:email, :user_name, :shop_name, :description, :password, :password_confirmation)
  end

  def find_merchant
    Merchant.find(params[:id])
  end
end
