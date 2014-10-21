class Order < ActiveRecord::Base
  has_many :merchants
  has_many :order_items
  has_many :products, through: :order_items
  attr_accessor :total_number_of_products

  def sorted_order_items
    order_items.order :product_id
  end

  def total_number_of_products
    order_items.collect(&:product_quantity).reduce :+
  end

end
