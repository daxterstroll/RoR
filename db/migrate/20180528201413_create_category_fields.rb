class CreateCategoryFields < ActiveRecord::Migration
  def change
    create_table :category_fields do |t|
      t.string :filter
      t.string :value
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
