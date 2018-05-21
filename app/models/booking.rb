class Booking < ActiveRecord::Base
  # connected choice user
  belongs_to :user
  # connected choice item
  belongs_to :item
end
