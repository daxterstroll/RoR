class CategoryField < ActiveRecord::Base
  belongs_to :category

  validates :filter, :value, presence: true
end
