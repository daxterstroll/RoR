class User < ActiveRecord::Base
  has_many :reviews
  has_many :items
  has_many :bookings
end
