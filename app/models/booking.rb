class Booking < ApplicationRecord
  belongs_to :lesson
  belongs_to :user
  STATUS = ["Accepted", "Declined", "Canceled"]
  validates :date, presence: true, format: { with: /\d{2}\/\d{2}\/\d{4}/, message: "wrong date format" }
  validates :status, presence: true, inclusion: { in: STATUS}
end
