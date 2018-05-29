class AddFilterRefToValues < ActiveRecord::Migration
  def change
    add_reference :values, :filter, index: true, foreign_key: true
  end
end
