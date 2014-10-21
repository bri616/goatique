class HomeController < ApplicationController

  def index
  end

  def authenticate_user
    # get pizza_name from input form
    params.require(:pringle).permit(:pizza_name)
      # check pizza_name to see if it exists in DB
      if mango = Merchant.find_by(user_name: params[:pringle] [:pizza_name])
        # if exists, assign a new key in the sessions hash (key > pineappleid / value > merchant id associated with username)
        params.require(:pringle).permit(:pizza_pass)
        if mango.authenticate(params[:pringle][:pizza_pass])
          session[:pineapple_id] = mango.id
        else
          raise "wrong password"
        end
        # raise @current_user.inspect
      else
        raise "pineapple erroar"
      end
    redirect_to "/"
  end

  def logout
    session[:pineapple_id] = nil
    redirect_to root_path
  end

  def search
   @products = Product.all
  render :index
  #  redirect_to :index
  end

end
