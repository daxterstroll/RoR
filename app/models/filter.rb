class Filter < ActiveRecord::Base
  has_many :filters_values, dependent: :destroy
end