class OrdersController < ApplicationController




  def index
    @order = @current_order
  end

  def show
    @order = @current_order
  end

  def checkout
  end

  def final_countdown
     #update @current_order with params from form
     @current_order.update(params.require(:order).permit(:first_name, :last_name, :mailing_address, :email, :card_number, :expiration_date))

     raise @current_order.inspect
     #change status to paid
     #if @current_order.update status: "Paid"
    #   iterate through order_items and update_stock based on #of items ordered(needs to be in model bc relates to DB)
    #   set current  session order id to nil
    #   redirect_to new confirmation page (maybe refactor to partial)
    # else
    #   throw error
    #   (refactor) redirect to cart/checkout page
    #
  end

  def update_all
    #method that updates all of the order quantities
  end

  def order_params
    params.require(:mango).permit(:order_item) #can i access the attributes of the other models that Orders is associated with, such as price, etc?
  end
end
