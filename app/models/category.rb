class Category < ActiveRecord::Base
  validates :name, presence: true
  # connected items
  has_many :items
  has_ancestry
end
