class OrderItem < ActiveRecord::Base
  validates :order_id, presence: true
  validates :order_id, numericality: true
  validates :product_id, presence: true
  validates :product_id, numericality: true
  validates :quantity, presence: true
  validates :quantity, numericality: true
  belongs_to :order
  belongs_to :product





end
