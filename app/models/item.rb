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
end