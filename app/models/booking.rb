class Booking < ApplicationRecord
  belongs_to :sheep
  belongs_to :user
  validate :booking_validity

  private

  def booking_validity
    if sheep.bookings.present?
      errors.add(:end_date, "Already booked")
    end
  end
end
