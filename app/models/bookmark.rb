class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :user_id, presence: true
  validates :pet_id, presence: true
end
