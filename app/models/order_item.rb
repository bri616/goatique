class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  before_create :check_against_inventory

  def check_against_inventory
    if product_quantity > product.quantity
      product_quantity = product.quantity
    end
  end

end
