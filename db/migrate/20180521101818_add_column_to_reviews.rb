class AddColumnToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :message, :string, limit: 150
  end
end
