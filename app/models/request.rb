class Request < ApplicationRecord
  belongs_to :hike
  belongs_to :user

  scope :accepted, -> { where(request_accepted: true) }
end
