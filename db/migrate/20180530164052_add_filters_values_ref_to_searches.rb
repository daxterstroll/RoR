class AddFiltersValuesRefToSearches < ActiveRecord::Migration
  def change
    add_reference :searches, :filters_value, index: true, foreign_key: true
  end
end
