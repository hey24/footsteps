class Hike < ApplicationRecord
  has_many :requests, dependent: :destroy
  has_many :markers, dependent: :destroy
  has_many :users, through: :requests
  belongs_to :user
end
