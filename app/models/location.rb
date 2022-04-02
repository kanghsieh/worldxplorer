class Location < ApplicationRecord
  has_many :users_locations
  validates :latitude, presence: true
  validates :longitude, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
