class Item < ActiveRecord::Base
  has_many :reviews, as: :reviewable, dependent: :destroy
  belongs_to :user
  belongs_to :category
  has_many :bookings, dependent: :destroy
  has_and_belongs_to_many :filters_values

  validates :name, :category_id, :user_id, presence: true

  scope :by_name, ->(name) { where('name LIKE ?', "%#{name}%") }
  scope :by_category, ->(category_id) { where(category_id: category_id) }
  scope :by_option, lambda { |filters_value_id|
    joins(:filters_values).where(filters_values: { id: filters_value_id })
  }
  scope :price_range, lambda { |price, days|
    where(Item.arel_table[:daily_price].lteq(price / days))
  }

  scope :test, lambda { |start_date, end_date|
    joins(:bookings).where(Booking.arel_table[:started_at].lteq(end_date))
                    .where(Booking.arel_table[:ended_on].gteq(start_date))
  }

  # scope :test1, ->(star,ends)

  # Model.where('event_start < ? AND event_end > ?', view_end, view_start)
end