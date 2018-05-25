class Item < ActiveRecord::Base
  belongs_to :category
  # connected reviews
  has_many :reviews, as: :reviewable
  # connected user
  belongs_to :user

  scope :things, -> { where('category_id = 2') }
  scope :beverages, -> { where('category_id = 1') }
  scope :boots, -> { where('category_id = 5') }
end