class OrderItem < ActiveRecord::Base
  validates :order_id, presence: true
  validates :order_id, numericality: {only_integer: true}
  validates :product_id, presence: true
  validates :product_id, numericality: {only_integer: true}
  validates :product_quantity, presence: true
  validates :product_quantity, numericality: {only_integer: true}
  validates :product_quantity, numericality: {greater_than: 0}

  belongs_to :order
  belongs_to :product

end
