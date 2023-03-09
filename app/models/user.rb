class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # requests that the user made to join hikes
  has_many :requests
  has_many :hikes
  # (user.requested_hikes) the hikes that the user has requested to join
  has_many :requested_hikes, through: :requests, source: :hike

  # (user.received_requests) the requests that other user made on the hikes that are owned by this user
  has_many :received_requests, through: :hikes, source: :requests
end
