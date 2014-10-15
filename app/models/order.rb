class Order < ActiveRecord::Base
  has_many :merchants
end
