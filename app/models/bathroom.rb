class Bathroom < ApplicationRecord
  has_many :ratings
  geocoded_by :address
  after_validation :geocode
  validates :stalls, numericality: {only_integer: true, greater_than: 0, less_than: 50}
  validates :title, length: {in: 1..50}
  validates :establishment, presence: true
  validates :address, presence: true

  def average_rating
    if self.ratings
      self.ratings.collect{|br| br.stars}.inject{|sum,el|sum + el}.to_f/self.ratings.size
    else
      'Not enough ratings'
    end
  end

  def number_of_reviews
    if self.ratings
      self.ratings.count
    else
      0
    end
  end
end
