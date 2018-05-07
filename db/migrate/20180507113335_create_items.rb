class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :name_items

      t.timestamps null: false
    end
  end
end
