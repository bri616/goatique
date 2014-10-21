class HomeController < ApplicationController

  def index
  end

  def authenticate_user
    # get pizza_name from input form
    params.require(:pringle).permit(:pizza_name)
      # check pizza_name to see if it exists in DB
      if mango = Merchant.find_by(user_name: params[:pringle] [:pizza_name])
        # if exists, assign a new key in the sessions hash (key > pineappleid / value > merchant id associated with username)
        session[:pineapple_id] = mango.id
        sign_in
        # raise @current_user.inspect
      else
        raise "pineapple erroar"
      end
    redirect_to "/"
  end

  def search
   @products = Product.all
  render :index
  #  redirect_to :index
  end

end
