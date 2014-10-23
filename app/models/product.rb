class Product < ActiveRecord::Base
  validates :merchant_id, presence: true
  validates :merchant_id, numericality: true
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, presence: true
  validates :quantity, numericality: true
  validates :quantity, numericality: { greater_than: 0 }
  belongs_to :merchant
  has_many :order_items
  has_many :orders, through: :order_items
  has_and_belongs_to_many :categories
  # http://guides.rubyonrails.org/association_basics.html#the-has-and-belongs-to-many-association


#   update stock method iterate through order_items and update_stock based on #of items ordered(needs to be in model bc relates to DB)

end
