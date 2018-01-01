class Rating < ApplicationRecord
  belongs_to :bathroom
  #validations
  validates :title, presence: true, length: {in: 5..100}
  validates :description, presence: true
  validates :stars,  numericality: {only_integer: true, less_than: 6, greater_than: 0 }
  validates :review_date, presence: true
end
