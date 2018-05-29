class DropValueTable < ActiveRecord::Migration
  def change
    drop_table :values
  end
end
