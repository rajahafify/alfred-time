class Booking < ApplicationRecord

  validates :restaurant, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  validate :no_double_booking

  def time_range
    start_time..end_time
  end


  private

  def no_double_booking
    errors.add(:time, 'This time slot is not available') unless time_slot_is_available?
  end

  def time_slot_is_available?
    Booking.all.each do |booking|
      return false if booking.time_range.overlaps?(self.time_range)
    end
    true
  end
end
