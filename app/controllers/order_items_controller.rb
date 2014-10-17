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

end
