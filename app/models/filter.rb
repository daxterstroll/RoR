class Filter < ActiveRecord::Base
  belongs_to :value
  has_and_belongs_to_many :categories
end