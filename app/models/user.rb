class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  # requests that the user made to join hikes

  has_many :requests

  has_many :hikes

  has_one_attached :photo

  # (user.requested_hikes) the hikes that the user has requested to join
  has_many :requested_hikes, through: :requests, source: :hike

  # (user.received_requests) the requests that other user made on the hikes that are owned by this user
  has_many :received_requests, through: :hikes, source: :requests

  def completed_requested_hikes
    requested_hikes.where(hike_completed: true, hike_confirmed: true)
  end

  def completed_joined_hikes
    requests.accepted.map { |request| request.hike.where(hike_completed: true, hike_confirmed: true) }
  end

  def completed_owned_hikes
    hikes.where(hike_completed: true, hike_confirmed: true)
  end

  def all_completed_hikes
    completed_owned_hikes + completed_joined_hikes
  end

  def upcoming_joined_hikes
    upcoming_requests = requests.accepted.filter do |request|
      !request.hike.hike_completed
    end
    upcoming_requests.map { |request| request.hike }
  end

  def upcoming_owned_hikes
    hikes.where(hike_completed: false)
  end

  def upcoming_pending_hikes
    upcoming_pending_requests = requests.pending.filter do |request|
      !request.hike.hike_completed
    end
    upcoming_pending_requests.map { |request| request.hike }
  end

  def all_upcoming_hikes
    upcoming_owned_hikes + upcoming_joined_hikes
  end
end
