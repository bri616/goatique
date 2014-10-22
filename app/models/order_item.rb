class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :product_quantity, :numericality => { :less_than_or_equal_to => lambda { |order_item| order_item.product.quantity }}


end
