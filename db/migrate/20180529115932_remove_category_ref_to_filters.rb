class RemoveCategoryRefToFilters < ActiveRecord::Migration
  def change
    remove_reference :filters, :category, index: true, foreign_key: true
  end
end
