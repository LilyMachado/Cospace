
class Workspace < ApplicationRecord
  has_many_attached :photos
  validates :name, :description, :price, :location, :available_from, :available_to, :amenities, presence: true
end
