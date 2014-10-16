class OrdersController < ApplicationController

  def edit
    @order = Order.find(params[:id])

  end


  def update
    @order = Order.find(params[:id])
    if @order.update(post_params)
    redirect_to #root_path
    else
      render :edit
    end
  end

  def show
    # @order = current_order
  end

  def post_parms
    params.require(:banana).permit(:order_item) #can i access the attributes of the other models that Orders is associated with, such as price, etc?
  end




end
