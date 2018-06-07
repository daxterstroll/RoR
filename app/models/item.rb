class Item < ActiveRecord::Base
  has_many :reviews, as: :reviewable, dependent: :destroy
  belongs_to :user
  belongs_to :category
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
end