class CreateJoinTableFiltersValueItem < ActiveRecord::Migration
  def change
    create_join_table :filters_values, :items do |t|
      t.index [:filters_value_id, :item_id]
      t.index [:item_id, :filters_value_id
    end
  end
end
