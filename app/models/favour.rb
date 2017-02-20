class Favour < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address
end
