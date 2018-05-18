class Item < ActiveRecord::Base
  has_many :reviews, :as => :reviewable
  belongs_to :booking
  belongs_to :user
end