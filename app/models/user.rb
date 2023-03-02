class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :lessons, dependent: :destroy
  has_many :bookings, dependent: :destroy

  has_many :requested_bookings, through: :lessons, source: :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
end
