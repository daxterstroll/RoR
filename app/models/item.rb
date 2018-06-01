class Item < ActiveRecord::Base
  has_many :reviews, as: :reviewable
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :filters_values

  validates :name, :category_id, :user_id, presence: true

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end

  scope :by_name, ->(name){ where('name LIKE ?', "%#{name}%") }
  scope :by_category, ->(category_ids) { where(category_id: category_ids) }
  scope :by_option, ->(filters_value_ids) { joins(:filters_values).where(filters_values: {id: filters_value_ids}) }
end