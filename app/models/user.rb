# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
  has_many :workspaces
  has_many :bookings
  has_many :reviews, dependent: :destroy
end
