class User < ActiveRecord::Base
  has_many :reviews, as: :reviewable, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :items, dependent: :destroy
  belongs_to :city
  has_many :items_reviews, through: :items, source: :reviews, dependent: :destroy

  validates :name, :city_id, presence: true
end