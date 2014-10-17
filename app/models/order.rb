class Order < ActiveRecord::Base
  has_many :merchants
  has_many :order_items
  has_many :products, through: :order_items

  def sorted_order_items
    order_items.order :product_id

  end

end
