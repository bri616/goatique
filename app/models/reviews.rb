class Reviews < ActiveRecord::Base
  validates :rating, presence: true
  validates :rating, numericality: {only_integer: true}
  validates :rating, inclusion: {in: 1..5}
  belongs_to :products
end
