class Product < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :order_item
end
