class Booking < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  STATUS = %w[validated pending denied]
  validates :status, presence: true
end
