class CreateTableFiltersItems < ActiveRecord::Migration
  def change
    create_table :filters_items do |t|
      t.belongs_to :item, index: true
      t.belongs_to :filter, index: true
    end
  end
end
