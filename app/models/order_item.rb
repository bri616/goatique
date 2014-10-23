class OrderItem < ActiveRecord::Base
  validates :order_id, presence: true
  validates :order_id, numericality: {only_integer: true}
  validates :product_id, presence: true
  validates :product_id, numericality: {only_integer: true}
  validates :product_quantity, presence: true
  validates :product_quantity, numericality: {only_integer: true}
  validates :product_quantity, numericality: {greater_than: 0}
  validates :product_quantity, :numericality => { :less_than_or_equal_to => lambda { |order_item| order_item.product.quantity }}

  belongs_to :order
  belongs_to :product



end
