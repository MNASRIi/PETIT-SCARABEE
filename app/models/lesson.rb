class Lesson < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy

  CATEGORIES = %w(Violin Guitar Singing Piano Yoga Chess Crossfit Stretching Football Basketball Handball Golf Swimming)
  validates :category, presence: true, inclusion: { in: CATEGORIES, message: "This is not a valid category" }
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :price, presence: true
  validates :duration, presence: true
  validates :address, presence: true


  include PgSearch::Model
  pg_search_scope :search_by_title_and_category_and_price,
    against: [ :title, :category, :price ],
    using: {
    tsearch: { prefix: true }
    }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
