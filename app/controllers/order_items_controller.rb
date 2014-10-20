class OrderItemsController < ApplicationController

  def create
    puts
    @order_item = OrderItem.new(order_item_params)
    if @order_item.save
      redirect_to cart_path
    else
      # render :new (we want this to render the same page they were on with errors)
      raise @order_item.errors
    end
  end

  def edit
    @order_item = OrderItem.find(params[:id])

  end

  # def update_stock
  #   @order_item = OrderItem.find(params[:id])
  #   if @order_item.product_quantity >= 1
  #     @order_item.product.quantity - @order_item.product_quantity
  #   else
  #   end
  # end


  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update(order_params)
    redirect_to "/orders"
    else
      render :edit
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    if @order_item.destroy
      redirect_to "/orders"
    end
  end

  def order_params
    params.require(:mango).permit(:product_quantity) #can i access the attributes of the other models that Orders is associated with, such as price, etc?
  end

end
