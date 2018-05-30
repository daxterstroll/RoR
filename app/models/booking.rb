class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates :item_id, :user_id, presence: true
  validates :started_at, date: true
  validates :ended_on,
            date: { after: :started_at }
end