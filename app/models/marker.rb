class Marker < ApplicationRecord
  belongs_to :hike

  validates_presence_of :latitude, :longitude, :order
end
