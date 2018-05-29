class User < ActiveRecord::Base
  # connected reviews
  has_many :reviews, as: :reviewable
  # connected bookings
  has_many :bookings
  # connected items
  has_many :items , dependent: :destroy
  # connected choice city
  belongs_to :city
  # connected all reviews for all items users
  has_many :items_reviews, through: :items, source: :reviews
end