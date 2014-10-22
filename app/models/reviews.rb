class Reviews < ActiveRecord::Base
  validates :reviewer, presence: true
  validates :review, presence: true
  validates :rating, presence: true
  validates :rating, numericality: true
  belongs_to :products
end
