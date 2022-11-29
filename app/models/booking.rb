class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates :user_id, presence: true
  validates :pet_id, presence: true

  validates :start_date, :end_date, presence: true
  validates :total_price, presence: true

  def calculate_total_price
    (end_date - start_date).to_i * pet.price
  end
end
