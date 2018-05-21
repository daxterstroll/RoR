class Item < ActiveRecord::Base
  # connected reviews
  has_many :reviews, as: :reviewable
  # connected user
  belongs_to :user
end