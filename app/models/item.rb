class Item < ActiveRecord::Base
  # connected category
  belongs_to :category
  # connected reviews
  has_many :reviews, as: :reviewable
  # connected user
  belongs_to :user
end