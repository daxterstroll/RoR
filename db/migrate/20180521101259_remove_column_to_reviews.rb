class RemoveColumnToReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :message, :text
  end
end
