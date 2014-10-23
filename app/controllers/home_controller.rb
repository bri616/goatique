class HomeController < ApplicationController

  def index
    @products = Product.all
    render :index
  end

  def authenticate_user
    # get pizza_name from input form
    params.require(:pringle).permit(:pizza_name)
      # check pizza_name to see if it exists in DB
      if loggedin_merchant = Merchant.find_by(user_name: params[:pringle] [:pizza_name])
        # if exists, assign a new key in the sessions hash (key > pineappleid / value > merchant id associated with username)
        # only if the password is authenticated
        params.require(:pringle).permit(:pizza_pass)
        if loggedin_merchant.authenticate(params[:pringle][:pizza_pass])
          session[:loggedin_merchant_id] = loggedin_merchant.id
        else
          raise "wrong password"
        end
        # raise @current_user.inspect
      else
        raise "pineapple erroar"
      end
    redirect_to merchant_show_path(loggedin_merchant.id)
  end

  def logout
    session[:loggedin_merchant_id] = nil
    redirect_to root_path
  end

  def search
   @products = Product.all
  render :index
  #  redirect_to :index
  end

end
