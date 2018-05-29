class AddFilterRefToFiltersValue < ActiveRecord::Migration
  def change
    add_reference :filters_values, :filter, index: true, foreign_key: true
  end
end
