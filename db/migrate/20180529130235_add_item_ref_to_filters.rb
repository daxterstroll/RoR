class AddItemRefToFilters < ActiveRecord::Migration
  def change
    add_reference :filters, :item, index: true, foreign_key: true
  end
end
