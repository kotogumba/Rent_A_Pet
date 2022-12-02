class Pet < ApplicationRecord
  validates :name, presence: true
  validates :species, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :age, presence: true
  validates :photos, presence: true
  has_many_attached :photos
  belongs_to :user
  has_many :bookings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :bookmarks, dependent: :destroy
end
