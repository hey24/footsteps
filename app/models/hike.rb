class Hike < ApplicationRecord
  has_many :requests, dependent: :destroy
  has_many :markers, dependent: :destroy
  has_many :users, through: :requests
  belongs_to :user
  has_one_attached :photo

  validates_presence_of :hike_name, :hike_description, :max_people

  geocoded_by :starting_point
  after_validation :geocode, if: :will_save_change_to_starting_point?

end
