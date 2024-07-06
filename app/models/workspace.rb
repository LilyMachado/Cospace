# app/models/workspace.rb
class Workspace < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, :description, :location, :price, :availability, presence: true
end
