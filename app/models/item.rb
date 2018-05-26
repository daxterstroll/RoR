class Item < ActiveRecord::Base
  # connected category
  belongs_to :category
  # connected reviews
  has_many :reviews, as: :reviewable
  # connected user
  belongs_to :user

  def self.search(search)
    if search
      where(["name LIKE ?","%#{search}%"])
    else
      all
    end
  end
end