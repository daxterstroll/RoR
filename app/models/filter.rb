class Filter < ActiveRecord::Base
  has_many :values
  has_and_belongs_to_many :categories



  belongs_to :category
end