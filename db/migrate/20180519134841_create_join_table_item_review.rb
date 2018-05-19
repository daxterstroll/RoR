class CreateJoinTableItemReview < ActiveRecord::Migration
  def change
    create_join_table :Items, :Reviews do |t|
      t.index [:item_id, :review_id]
      t.index [:review_id, :item_id]
    end
  end
end
