class Category < ActiveRecord::Base
  has_ancestry
  has_many :items, dependent: :destroy
  has_and_belongs_to_many :filters, dependent: :destroy
  has_many :category_fields, inverse_of: :category, dependent: :destroy
  accepts_nested_attributes_for :category_fields,
                                reject_if: :all_blank, allow_destroy: true

  validates :name, :filters, presence: true
end