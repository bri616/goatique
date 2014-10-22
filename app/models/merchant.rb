class Merchant < ActiveRecord::Base
  validates :user_name, uniqueness: true
  validates :shop_name, uniqueness: true
  validates :email, uniqueness: true
  validates :email, format: {with: /@/}
  has_secure_password
  has_many :products
  has_many :order_items, through: :products
end
