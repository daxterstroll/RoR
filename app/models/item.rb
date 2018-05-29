class Item < ActiveRecord::Base
  # connected reviews
  has_many :reviews, as: :reviewable
  # connected user
  belongs_to :user
  belongs_to :category

  has_and_belongs_to_many :filters_values

  def self.search(search)
    if search
      where(["name LIKE ?","%#{search}%"])
    else
      all
    end
  end
end