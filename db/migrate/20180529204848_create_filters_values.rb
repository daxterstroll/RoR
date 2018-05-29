class CreateFiltersValues < ActiveRecord::Migration
  def change
    create_table :filters_values do |t|
      t.string :option

      t.timestamps null: false
    end
  end
end
