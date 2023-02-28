class Booking < ApplicationRecord
  belongs_to :lesson
  belongs_to :user
  STATUS = ["Accepted", "Declined", "Cancelled", "Pending"]
  validates :status, presence: true, inclusion: { in: STATUS}
end
