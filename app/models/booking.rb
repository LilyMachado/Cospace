# app/models/booking.rb
class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :workspace

  validates :start_time, :end_time, presence: true
end
