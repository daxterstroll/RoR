class Item < ActiveRecord::Base
  has_many :reviews, :as => :reviewable

  belongs_to :review
  has_one :user
end
