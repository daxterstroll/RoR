class City < ActiveRecord::Base
  # show users
  has_many :users
  # add items to user's city
  has_many :items, through: :users
end