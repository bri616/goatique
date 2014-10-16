class OrdersController < ApplicationController

  def index
    @order = Order.first
  end
  #
  # def edit
  #   @order = Order.find(params[:id])
  # end
  #
  #
  # def update
  #   @order = Order.find(params[:id])
  #   if @order.update(order_params)
  #   redirect_to #root_path
  #   else
  #     render :edit
  #   end
  # end

  def show
    @order = Order.first
  end

  def order_params
    params.require(:banana).permit(:order_item) #can i access the attributes of the other models that Orders is associated with, such as price, etc?
  end
end
