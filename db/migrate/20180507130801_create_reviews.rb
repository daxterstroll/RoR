class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :message
      t.text :reviewable_type
      t.integer :reviewable_id

      t.timestamps null: false
    end
  end
end
