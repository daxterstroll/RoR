class FiltersValue < ActiveRecord::Base
  belongs_to :filter
  has_and_belongs_to_many :items

  validates :option, :filter_id, presence: true
end