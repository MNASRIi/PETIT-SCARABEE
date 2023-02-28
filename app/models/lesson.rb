class Lesson < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings

  CATEGORIES = %w(violin guitar singing piano yoga chess crossfit stretching football basketball handball golf swimming)

  validates :category, presence: true, inclusion: { in: CATEGORIES,
  message: "not valid category" }
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 100 }
  validates :price, presence: true
  validates :duration, presence: true
  validates :address, presence: true
end
