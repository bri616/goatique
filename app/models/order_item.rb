class OrderItem < ActiveRecord::Base
  validates :order_id, numericality: true
  validates :product_id, numericality: true
  validates :quantity, numericality: true
  belongs_to :order
  belongs_to :product





end
