class MerchantsController < ApplicationController

  def index
    @merchants = Merchant.all
  end

  def new
    @merchant = Merchant.new
  end

  def create
    @merchant = Merchant.new(merchant_params)
    # raise params.inspect
    if @merchant.save
      redirect_to "/merchants/#{@merchant.id}"
    else
      puts merchant_params
      render :new
    end
  end

  def show
    find_merchant
    puts "i'm in merchant#show"
    puts @merchant.id
  end

  private
  def merchant_params
    params.require(:merchant).permit(:email, :user_name, :shop_name, :description, :password_digest)
  end

  def find_merchant
    @merchant = Merchant.find(params[:id])
  end
end
