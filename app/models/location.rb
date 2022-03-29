class Location < ApplicationRecord
  has_many :users_locations
  validates %i[latitude longitude], presence: true
end
