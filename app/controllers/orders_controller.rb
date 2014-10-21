class OrdersController < ApplicationController

  def index
    @order = @current_order
  end

  def show
    @order = @current_order
  end

  def update_all
    #method that updates all of the order quantities
  end

  def order_params
    params.require(:mango).permit(:order_item) #can i access the attributes of the other models that Orders is associated with, such as price, etc?
  end
end
