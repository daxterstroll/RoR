class AddBookingRefToReviews < ActiveRecord::Migration
  def change
    add_index :reviews, :reviewable_id
    add_index :reviews, :reviewable_type
  end
end