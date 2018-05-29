class AddCategoryRefToFilters < ActiveRecord::Migration
  def change
    add_reference :filters, :category, index: true, foreign_key: true
  end
end
