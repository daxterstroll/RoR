class Filter < ActiveRecord::Base
  has_many :filters_values, dependent: :destroy

  has_and_belongs_to_many :categories
end