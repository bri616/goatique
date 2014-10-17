class OrderItemsController < ApplicationController

  def edit
    @order_item = OrderItem.find(params[:id])

  end



  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_params)
    redirect_to "/orders"
    else
      render :edit
    end
  end

  def order_params
    params.require(:mango).permit(:product_quantity) #can i access the attributes of the other models that Orders is associated with, such as price, etc?
  end

end
