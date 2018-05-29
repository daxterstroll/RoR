class Item < ActiveRecord::Base

  # connected reviews
  has_many :reviews, as: :reviewable
  # connected user
  belongs_to :user
  belongs_to :category

  has_many :filters
  has_many :values

  def self.search(search)
    if search
      where(["name LIKE ?","%#{search}%"])
    else
      all
    end
  end
end