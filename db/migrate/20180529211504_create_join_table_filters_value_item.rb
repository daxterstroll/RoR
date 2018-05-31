class CreateJoinTableFiltersValueItem < ActiveRecord::Migration
  def change
    create_join_table :filters_values, :items do |t|
      t.index %i[filters_value_id item_id]
      t.index %i[item_id filters_value_id]
    end
  end
end
