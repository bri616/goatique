class Category < ActiveRecord::Base
  has_and_belongs_to_many :products
  # http://guides.rubyonrails.org/association_basics.html#the-has-and-belongs-to-many-association
end
