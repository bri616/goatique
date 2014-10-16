class Order < ActiveRecord::Base
  has_many :merchants
  has_many :order_items
end
