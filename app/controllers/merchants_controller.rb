class MerchantsController < ApplicationController

  def index
    @merchants = Merchant.all
  end

  def new
    @merchant = Merchant.new
  end

  def create
    @merchant = Merchant.new(merchant_params)
  end

  private
  def merchant_params
    params.require(:merchant).permit(:email, :user_name, :shop_name, :description, :password, :password_confirmation)
  end
end
