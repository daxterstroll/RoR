class User < ActiveRecord::Base
  has_many :reviews, :as => :reviewable
  has_many :items
  has_many :bookings

  belongs_to :city
end
