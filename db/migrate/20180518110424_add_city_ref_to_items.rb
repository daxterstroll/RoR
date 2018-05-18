class AddCityRefToItems < ActiveRecord::Migration
  def change
    add_reference :items, :city, index: true, foreign_key: true
  end
end
