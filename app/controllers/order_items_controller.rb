class OrderItemController < ApplicationController

  def edit

    @order_item = OrderItem.find(params[:id])

  end



  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(orderitem_params)
    redirect_to "/"
    else
      render :edit
    end
  end

  def orderitem_params
    params.require(:banana).permit(:order_item) #can i access the attributes of the other models that Orders is associated with, such as price, etc?
  end

end
