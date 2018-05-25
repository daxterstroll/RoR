class Item < ActiveRecord::Base
  belongs_to :category
  # connected reviews
  has_many :reviews, as: :reviewable
  # connected user
  belongs_to :user

  scope :almost_completed, -> { where('category_id = 1') }
end