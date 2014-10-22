class Order < ActiveRecord::Base
  validates :email, presence: true
  validates :email, format: {with: /@/}
  validates :mailing_address, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :card_number, presence: true
  validates :card_number, numericality: true
  validates :expiration_date, presence: true

  has_many :merchants
  has_many :order_items
  has_many :products, through: :order_items
  attr_accessor :total_number_of_products

  def sorted_order_items
    order_items.order :product_id
  end

  def total_number_of_products
    if order_items.collect(&:product_quantity).reduce :+
      order_items.collect(&:product_quantity).reduce :+
    else
      0
    end
  end

end
