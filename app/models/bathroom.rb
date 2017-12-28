class Bathroom < ApplicationRecord
  has_many :ratings
  geocoded_by :address
  after_validation :geocode
end
