class Bathroom < ApplicationRecord
  has_many :ratings
  geocoded_by :address
  after_validation :geocode
  validates :stalls, numericality: {only_integer: true, greater_than: 0, less_than: 50}
  validates :title, length: {in: 1..50}
  validates :establishment, presence: true
  validates :address, presence: true
end
