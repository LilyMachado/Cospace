class BookingLink < ApplicationRecord
  belongs_to :workspace
  validates :name, :url
end
