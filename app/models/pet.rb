class Pet < ApplicationRecord
  validates :name, presence: true
  validates :species, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :age, presence: true
  validates :photos, presence: true
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy
end
