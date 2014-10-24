class OrderItemsController < ApplicationController

  def create
    # @order_item = OrderItem.new(order_item_params)

    # if the order already includes an order_item for this product
    if Order.find(order_item_params[:order_id]).products.include? Product.find(order_item_params[:product_id])
      # update the order_item product_quantity to be incremented by one
      @order_item = OrderItem.find_by_product_id_and_order_id(order_item_params[:product_id], order_item_params[:order_id])
      old_prod_quant = @order_item.product_quantity
      @order_item.update(product_quantity: old_prod_quant+1)
    else
      # create a new order item with order_item params
      @order_item = OrderItem.new(order_item_params)
      @order_item.update(product_quantity: 1)
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

  def update_stock
    @order_item = OrderItem.find(params[:id])
    if @order_item.product_quantity >= 1
      new_stock = @order_item.product.quantity - @order_item.product_quantity
      @order_item.product.update(quantity:new_stock)
    else
    end
  end


  def update
    @order_item = OrderItem.find(params[:id])

    if @order_item.update(order_params)
      redirect_to "/orders"
    else
      @order = @current_order
      @errorobj = @order_item
      render :template => "orders/index"
      # render :template => "orders/index", :locals => { :user => @user = @current_user }
      # render @order_item.errors
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    if @order_item.destroy
      redirect_to "/orders"
    end
  end

  private

  def order_params
    params.require(:mango).permit(:product_quantity) #can i access the attributes of the other models that Orders is associated with, such as price, etc?
  end

  def order_item_params
    params.permit(:product_id, :order_id)
  end


end
