class Category < ActiveRecord::Base
  validates :name, presence: true
  # connected items
  has_many :items

  has_ancestry
  has_many :category_fields, inverse_of: :category, dependent: :destroy
  accepts_nested_attributes_for :category_fields, reject_if: :all_blank, allow_destroy: true
end
