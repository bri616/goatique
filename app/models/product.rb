class Product < ActiveRecord::Base
  belongs_to :merchant
  has_many :order_items
<<<<<<< HEAD
  has_many :orders, through: :order_items




=======
  has_and_belongs_to_many :categories
  # http://guides.rubyonrails.org/association_basics.html#the-has-and-belongs-to-many-association
>>>>>>> master
end
