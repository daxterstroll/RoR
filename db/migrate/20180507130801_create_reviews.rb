class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :message
      t.string :reviewable_type
      t.integer :reviewable_id

      t.timestamps null: false
    end
  end
end
