class Location < ApplicationRecord
  has_many :users_locations
  validates :latitude, presence: true
  validates :longitude, presence: true
end
