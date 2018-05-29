class CategoriesFilters < ActiveRecord::Migration
  def change
    create_table :categories_filters, id: false do |t|
      t.belongs_to :category, index: true
      t.belongs_to :filter, index: true
    end
  end
end
