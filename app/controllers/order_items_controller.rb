class OrderItemsController < ApplicationController

  def create
    # @order_item = OrderItem.new(order_item_params)
    # if the order already includes an order_item for this product
    if Order.find(order_item_params[:order_id]).products.include? Product.find(order_item_params[:product_id])
      # add one to the order item associated with that product
      Order.find(order_item_params[:order_id]).order_items.each do |order_item|
        puts order_item.product_id
        puts order_item_params[:product_id]
        if order_item.product_id == order_item_params[:product_id]
          @order_item = order_item
        end
      end
      @order_item.update(product_quantity: @order_item[:product_quantity]+1)
    else
      # create a new order item with order_item params
      @order_item = OrderItem.new(order_item_params)
    end

    if @order_item.save
      redirect_to orders_path
    else
      # render :new (we want this to render the same page they were on with errors)
      raise @order_item.errors
    end
  end

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

  def destroy
    @order_item = OrderItem.find(params[:id])
    if @order_item.destroy
      redirect_to "/orders"
    end
  end

  def order_params
    params.require(:mango).permit(:product_quantity) #can i access the attributes of the other models that Orders is associated with, such as price, etc?
  end

  def order_item_params
    params.permit(:product_id, :order_id)
  end

end
